class User {
  User(this.name);
  User.fromMap(Map<String, dynamic> map) : this.name = map['name'];

  int? id;
  String name;

  Map<String, dynamic> toMap() {
    return {"name": this.name};
  }
}
