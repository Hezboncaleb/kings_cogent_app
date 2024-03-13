class User {
  final String firstname;
  final String lastname;
  final String email;
  final String uid;
  final String city;
  final String subcounty;
  final String parish;
  final String village;
  final String telephonenumber1;
  final String telephonenumber2;
  final String nationalIDnumber;
  final String dateofbirth;
  final String address;
  final String nextofkin1;
  final String nextofkin2;

  const User({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.uid,
    required this.city,
    required this.subcounty,
    required this.parish,
    required this.village,
    required this.telephonenumber1,
    required this.telephonenumber2,
    required this.nationalIDnumber,
    required this.dateofbirth,
    required this.address,
    required this.nextofkin1,
    required this.nextofkin2,
  });

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "uid": uid,
        "city": city,
        "subcounty": subcounty,
        "parish": parish,
        "village": village,
        "telephonenumber1": telephonenumber1,
        "telephonenumber2": telephonenumber2,
        "nationalIDnumber": nationalIDnumber,
        "dateofbirth": dateofbirth,
        "address": address,
        "nextofkin1": nextofkin1,
        "nextofkin2": nextofkin2,
      };
}
