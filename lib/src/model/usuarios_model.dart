
import 'dart:convert';

UsersLocally usersLocallyFromJson(String str) => UsersLocally.fromJson(json.decode(str));

String usersLocallyToJson(UsersLocally data) => json.encode(data.toJson());

class UsersLocally {
    UsersLocally({
        this.mail,
        this.password,
        this.id,
        this.perfil,
        this.name,
    });

    String mail;
    String password;
    String id;
    String perfil;
    String name;

    factory UsersLocally.fromJson(Map<String, dynamic> json) => UsersLocally(
        mail     : json["Mail"],
        password : json["Password"],
        id       : json["Id"],
        perfil   : json["Perfil"],
        name     : json["Name"],
    );

    Map<String, dynamic> toJson() => {
        "Mail"     : mail,
        "Password" : password,
        "Id"       : id,
        "Perfil"   : perfil,
        "Name"     : name,
    };
}