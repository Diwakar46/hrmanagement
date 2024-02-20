class JwtResponse {
  final String? token;
  final int? id;
  final String? firstname;
  final String? middlename;
  final String? lastname;
  final String? email;
  final List<String>? roles;
  final String? status;

  JwtResponse({
    this.token,
    this.id,
    this.firstname,
    this.middlename,
    this.lastname,
    this.email,
    this.roles,
    this.status,
  });

  factory JwtResponse.fromJson(Map<String, dynamic> json) {
    return JwtResponse(
      token: json['token'],
      id: json['id'],
      firstname: json['firstname'],
      middlename: json['middlename'],
      lastname: json['lastname'],
      email: json['email'],
      roles: (json['roles'] as List<dynamic>)
          .map((role) => role.toString())
          .toList(),
      status: json['status'],
    );
  }
}
