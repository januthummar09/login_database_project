class Helper {
  /// email validation

  String? validEmail(String val) {
    if (val.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  ///  password validation
  String? validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  String? validPassword(String value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return 'Enter minimum 6 digit';
    } else {
      return null;
    }
  }

  String? firstNameValidation(String value) {
    if (value.isEmpty) {
      return 'Please Check FirstName Data';
    } else {
      return null;
    }
  }

  String? lastNameValidation(String value) {
    if (value.isEmpty) {
      return 'Please fill up firstName Data';
    } else {
      return null;
    }
  }

  ageValidation(String value) {
    if (value.isEmpty) {
      return 'Please fill up age Data';
    } else {
      return null;
    }
  }

  String? genderValidation(String value) {
    if (value.isEmpty) {
      return 'Please Check FirstName Data';
    } else {
      return null;
    }
  }

  String? conformPassValidation(String value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return 'Enter minimum 6 digit';
    } else {
      return null;
    }
  }
}
