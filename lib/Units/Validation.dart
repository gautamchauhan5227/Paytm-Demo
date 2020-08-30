String validatePassword(String value) {
  if (value.length == 0) {
    return 'Password can\'t be empty!';
  } else {
    if (value.length < 8)
      return 'Password must be more than 7 charater';
    else
      return null;
  }
}

String validateNumber(String value) {
  if (value.length == 0) {
    return 'Number can\'t be empty!';
  } else {
    if (value.length<9)
      return 'Enter valid Number';
    else
      return null;
  }
}

