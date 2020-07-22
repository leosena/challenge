class Validator {
  static bool validateName(String text) {
    return text
        .contains(new RegExp(r"^[a-zA-ZÀ-ú]+(([',. -][a-zA-ZÀ-ú ])?[a-zA-ZÀ-ú]*)*$"));
  }

  static bool validateClientName(String text) {
    return text
        .contains(new RegExp(r"^[a-zA-ZÀ-ú]$"));
  }

  static bool validateGender(String text) {
    return text
        .contains(new RegExp(r"^[FM]$"));
  }

  static bool validateNumberWhats (String text) {
    Pattern pattern = r'^$|^\D?(\d{3})\D?\D?(\d{3})\D?(\d{5})$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(text);
  }

  static bool validateNumberPhone (String text) {
    Pattern pattern = r'^$|^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(text);
  }

  static bool validateAge (String text) {
    Pattern pattern = r'(^[0-9]{1,2})$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(text);
  }


  static bool validateEmail(String text) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(text);
  }

  static bool validatePassword(String text) {
    return text.toString().length >= 6;
  }

  static bool validateAddress(String text) {
    return text
        .contains(new RegExp(r"^(\d+) ?([A-Za-z](?= ))? (.*?) ([^ ]+?) ?((?<= )APT)? ?((?<= )\d*)?$"));
  }
}
