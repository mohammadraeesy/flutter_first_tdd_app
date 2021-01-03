import 'dart:convert';

class T {
  int id;
  String token;

  T({
  this.id = 0,
  this.token = "",
  });

  T.fromJson(Map<String, dynamic>  map) :
        id = map['id']  ?? 0,
        token = map['token']  ?? "";

  Map<String, dynamic> toJson() => {
        'id': id,
        'token': token,
      };

  T copyWith({
    int id,
    String token,
  }) {
    return T(
      id: id ?? this.id,
      token: token ?? this.token,
    );
  }
}

