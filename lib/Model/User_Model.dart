class User {
  int id;
  String name;
  String number;
  String password;

  User(this.id, this.name, this.number, this.password);

  //Convert a User into a map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['number'] = number;
    map['password'] = password;
    return map;
  }

  //Extract a User object from Map object
  User.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.number = map['number'];
    this.password = map['password'];
  }
}
