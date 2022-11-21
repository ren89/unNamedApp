String? validateEmail(String value) {
  String msg = "";
  RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (value.isEmpty) {
    msg = "Your username is required";
  } else if (!regex.hasMatch(value)) {
    msg = "Please provide a valid email address";
  } else {
    return null;
  }

  return msg;
}
