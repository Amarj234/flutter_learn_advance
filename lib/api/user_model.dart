
import 'package:json_annotation/json_annotation.dart';

//part 'user_model.g.dart';

@JsonSerializable()
class MyApp{
  int? count;
  String? message;
  bool? status;
  List<User>? user;

MyApp({this.count,this.message,this.status,this.user});

//factory MyApp.fromJson(Map<String,dynamic> json)=>_$MyAppFromJson(json);

factory MyApp.fromJson(Map<String,dynamic> json){
  return MyApp(
    count: json['count'],
    message: json['message'],
    status: json['status'],
    user: json['user'].map((e)=>User.fromJson(e)).toList()
  );
}

//Map<String,dynamic> toJson()=>_$MyAppTojson(this);
Map<String,dynamic>toJson(){
  return {
    'count':count,
    'message':message,
    'status':status,
    'user':user?.map((e)=>e.toJson()).toList(),
  };
}
}


@JsonSerializable()
class User{
  int? id;
  String? name;
  int? age;
  String? gender;
  User({this.id,this.name,this.age,this.gender});

 /// factory User.fromJson(Map<String,dynamic> json)=>_$UserFromjson(json);

factory User.fromJson(Map<String,dynamic> json){
  return User(
    id: json['id'],
    name: json['name'],
    age: json['age'],
    gender: json['gender']
  );
}

//Map<String,dynamic>toJson()=>_$UserTojson(this);

Map<String,dynamic> toJson(){
  return {
    'id':id,
    'name':name,
    'age':age,
    'gender':gender
  };
}

}