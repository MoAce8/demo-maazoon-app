String? mobileValidator(String value) {
  if (value.trim().isEmpty) {
    return 'رقم الجوال مطلوب';
  } else if (value.length != 9) {
    return "ادخل رقم مكون من 9 ارقام";
  } else if (!value.startsWith('5')) {
    return "ادخل رقم صحيح";
  }
  return null;
}

String? passwordValidator(String value) {
  RegExp capRegex = RegExp(r'^(?=.*?[A-Z])');
  RegExp smallRegex = RegExp(r'(?=.*?[a-z])');
  RegExp numRegex = RegExp(r'(?=.*?[0-9])');
  RegExp scRegex = RegExp(r'(?=.*?[!@#$&*~])');
  RegExp limitRegex = RegExp(r'.{8,}$');

  if (value.trim().isEmpty) {
    return 'كلمة المرور مطلوبة';
  } else if (!limitRegex.hasMatch(value)) {
    return 'يجب ان تكون كلمة المرور 8 احرف على الأقل';
  } else {
    if (!capRegex.hasMatch(value)) {
      return 'يجب ان تحتوي كلمة المرور على حرف كبير واحد على الأقل';
    } else if (!smallRegex.hasMatch(value)) {
      return 'يجب ان تحتوي كلمة المرور على حرف صغير واحد على الأقل';
    } else if (!numRegex.hasMatch(value)) {
      return 'يجب ان تحتوي كلمة المرور على رقم واحد على الأقل';
    } else if (!scRegex.hasMatch(value)) {
      return 'يجب ان تحتوي كلمة المرور على حرف مميز واحد على الأقل';
    }
    return null;
  }
}

String? userValidator(String value) {
  if (value.trim().isEmpty) {
    return 'اسم المستخدم مطلوب';
  }
  return null;
}

String? emailValidator(String value) {
  RegExp regex = RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');

  if (value.trim().isEmpty) {
    return 'البريد الالكتروني مطلوب';
  }

  if (!regex.hasMatch(value)) {
    return 'ادخل بريد الكتروني صحيح';
  }
  return null;
}

String? idValidator(String value) {
  if (value.trim().isEmpty) {
    return 'ادخل رقم الهوية';
  }
  return null;
}

String? otpValidator(String value) {
  if (value.trim().isEmpty) {
    return 'ادخل الرمز التوثيقي';
  } else if (value.length < 6) {
    return 'يجب ان يتكون من 6 ارقام';
  }

  return null;
}
