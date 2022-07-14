class Validator{

  emailValidator(String? v) {
    if (v!.trim().isEmpty) {
      return 'Email is required';
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(v.trim())) {
      return 'Email should like sample@example.com';
    }
    return null;
  }
  passwordValidator(String? v) {
    if (v!.trim().isEmpty) {
      return 'Password is required';
    }
    return null;
  }

}