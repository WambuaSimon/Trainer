

abstract class BasePreferencesStorage{
  Future getString(String key);
  Future setString(String key, String value);
}