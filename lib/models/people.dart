class People {
  String name;
  int age;
  String email;
  String tel;

  People(this.name, this.age, this.email, this.tel);

  People.fromJson(Map<String, dynamic> map) {
    name = map["name"];
    age = map["age"];
    email = map["email"];
    tel = map["tel"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = new Map();
    map["name"] = this.name;
    map["age"] = this.age;
    map["email"] = this.email;
    map["tel"] = this.tel;
    return map;
  }
}
