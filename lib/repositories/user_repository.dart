import 'dart:async';

abstract class UserRepository {
  Future<void> createUser(
    String userId,
    String name,
    String email,
    String? pictureUrl,
  );
  Future<bool> userExists(String userId);
  void dispose();
}
