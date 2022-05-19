import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trainer/bloc/category_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainer/bloc/preferences_bloc.dart';
import 'package:trainer/utils/constants.dart' as constants;
import '../model/category_response.dart';
import '../enums/BodyPartEnum.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    categoryBloc.getCategories();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int? _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CategoryResponse>(
      stream: categoryBloc.stream,
      builder: (context, AsyncSnapshot<CategoryResponse> snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.requireData;
          if (data.hasError) {
            return Container();
          }

          return _getCategories(snapshot.data!);
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("An error occurred"),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _getCategories(CategoryResponse data) {
    final List<Category> category = data.categories;
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 10);
              },
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                      PreferencesBloc.instance
                          .saveBodyPartValue(constants.bodyPartPrefKey, category[index]);
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color:
                                  _selectedIndex == index ? const Color(0xff9575CD) : const Color(0xffEDE7F6),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              data.categories[index].displayableAsset,
                            ),
                          )),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(category[index].name),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
