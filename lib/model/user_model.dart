
class UserModel {

  final String uId;
  final String username;
  final String email;
  final String phoneNumber;
  final String userImg;
  final String userdeviceToken;
  final String country;
  final String useradress;
  final bool isadmin;
  final bool isActive;
  final DateTime createOn;

  UserModel({
    required this.uId,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.userImg,
    required this.userdeviceToken,
    required this.country,
    required this.useradress,
    required this.isadmin,
    required this.isActive,
    required this.createOn});

  Map<String, dynamic> toMap() {
    return
      { 'uId': uId,
        'username': username,
        'email': email,
        'phonenumber': phoneNumber,
        'userImg': userImg,
        'userdeviceToken': userdeviceToken,
        'country': country,
        'useradress': useradress,
        'isadmin' : isadmin,
        'isActive': isActive,
        'createOn': createOn,

      };
  }

  factory UserModel.fromMap(Map<String, dynamic> json){
    return UserModel(
      uId: json['uId'],
      email: json['email'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      userImg: json['userImg'],
      userdeviceToken: json['userdeviceToken'],
      country: json['country'],
      useradress: json['useradress'],
      isadmin: json['isadmin'],
      isActive: json['isActive'],
      createOn: DateTime.parse(json['createOn']),
    );
  }
}
