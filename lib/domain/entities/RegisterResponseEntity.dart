import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"mariamkamel@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MTllNGE4YmU4YjUyMzIzNWM4MzdmMiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzEyOTcyOTY4LCJleHAiOjE3MjA3NDg5Njh9.kzcGLtTIL3uuxlUhWK5CbLZZWJUX-CM8Ignx_WUJMls"

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.user, 
      this.token,
      });

 String? message;
  UserEntity? user;
  String? token;

 
}