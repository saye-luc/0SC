class User {
  final String uid;
  final String displayName;
  final UserType userType;

  User({required this.uid, required this.displayName, required this.userType});
}

enum UserType {
  veterinarian,
  poultryFarmer,
}
