/// Provides Strings utility methods
class StringUtils {
  /// Returns the string of an enum value
  static String enumName(Object enumToString) =>
      enumToString.toString().split('.').last;
}
