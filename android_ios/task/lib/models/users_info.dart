class GetUsers {
  String id;
  String name;
  String atype;

  GetUsers({this.id, this.name, this.atype});

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(name: json['name'], id: json['id'], atype: json['atype']);
  }
}
