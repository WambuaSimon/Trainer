import 'package:flutter/material.dart';
import 'package:trainer/ui/category_widget.dart';
import 'package:trainer/ui/trainings_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 16,
                ),
                /*TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black45,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(color: Colors.black45, fontFamily: "WorkSansLight"),
                    filled: true,
                    fillColor: Color(0xffECEFF1),
                    hintText: 'Search workout',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),*/
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 8,
                ),
                CategoryPage(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Trainings',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 8,
                ),
                TrainingsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
