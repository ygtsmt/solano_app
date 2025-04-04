import 'package:easy_localization/easy_localization.dart';

extension EmailValidator on String {
  /// Checks if the given string is a valid email.
  bool isValidEmail() {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{1,}$')
        .hasMatch(this);
  }

  /// this password validation  8 character
  bool isValidPasswordMinCharacter() {
    return (length < 8) ? false : true;
  }

  bool isValidPassword() {
    return RegExp(
      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&()_+{}[\]:<>,.?\/~\-*="|])[-\w!@#$%^&()_+{}[\]:;<>,.?\/~\-*="|]{8,}$',
    ).hasMatch(this);
  }

  bool isValidPasswordNotCharacter() {
    return !RegExp('[üöşçÜÖŞÇ]').hasMatch(this);
  }

  bool isValidPasswordUpperLower() {
    return RegExp('^(?=.*[a-z])(?=.*[A-Z])').hasMatch(this);
  }

  bool isValidPasswordSpecialCharacter() {
    return RegExp(
      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&()_+{}[\]:<>,.?\/~\-*="|])[-\w!@#$%^&()_+{}[\]:;<>,.?\/~\-*="|]{8,}$',
    ).hasMatch(this);
  }

  bool isValidPasswordNumeric() {
    return RegExp('[0-9]').hasMatch(this);
  }

  bool isValidConfirmPassword(String first, String second) {
    if (first.isNotEmpty && second.isNotEmpty) {
      if (first == second) {
        return true;
      }
    }
    return false;
  }
}

extension DateFormatting on String {
  /// ISO 8601 tarih formatındaki String'i "M/d/yyyy" formatına çevirir.
  String toFormattedDate() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('M/d/yyyy').format(dateTime);
    } catch (e) {
      return 'Invalid Date';
    }
  }
}

extension TimestampExtension on String {
  String toFormattedTime() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(this));
    return DateFormat('hh:mm a', 'en_US').format(dateTime);
  }
}
