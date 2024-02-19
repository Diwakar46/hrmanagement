class JwtResponse {
  final String token;
  final String id;
  final String firstname;
  final String middlename;
  final String lastname;
  final String email;
  final List<String> roles;
  final String status;

  JwtResponse(
    this.token,
    this.id,
    this.firstname,
    this.middlename,
    this.lastname,
    this.email,
    this.roles,
    this.status,
  );
}
