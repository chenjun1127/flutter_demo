class UserInfo {
  int age;
  String name;

  UserInfo(this.age, this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfo && runtimeType == other.runtimeType && age == other.age && name == other.name;

  @override
  int get hashCode => age.hashCode ^ name.hashCode;
}
