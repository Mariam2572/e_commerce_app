
class GetUserInfoEntity {
  int? results;
  String? status;
  List<UserDataEntity>? data;

  GetUserInfoEntity({this.results, this.status, this.data});

 
}

class UserDataEntity {
  String? id;
  String? name;
  String? details;
  String? phone;
  String? city;

  UserDataEntity({this.id, this.name, this.details, this.phone, this.city});

 
}