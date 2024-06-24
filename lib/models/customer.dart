class Customer {
  final String id;
  final String firstName;
  final String lastName;
  final String address;
  final String googleMapsLocation;
  final String? observation;
  final String? email;
  final String phone;
  final int bottles;
  final int dispensers;
  final bool isAccountUpToDate;
  final double debt;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.googleMapsLocation,
    this.observation,
    this.email,
    required this.phone,
    required this.bottles,
    required this.dispensers,
    required this.isAccountUpToDate,
    required this.debt,
  });
}
