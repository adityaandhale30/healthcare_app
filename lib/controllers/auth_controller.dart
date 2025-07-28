import 'package:get/get.dart';
import '../models/user.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var currentUser = Rxn<User>();

  // Dummy users
  final users =
      <User>[
        User(
          id: 1,
          name: 'John Doe',
          email: 'john@example.com',
          password: '123456',
        ),
      ].obs;

  void login(String email, String password) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final user = users.firstWhereOrNull(
      (u) => u.email == email && u.password == password,
    );
    if (user != null) {
      currentUser.value = user;
      isLoggedIn.value = true;
      update();
    }
    isLoading.value = false;
  }

  void signup(String name, String email, String password) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final user = User(
      id: users.length + 1,
      name: name,
      email: email,
      password: password,
    );
    users.add(user);
    currentUser.value = user;
    isLoggedIn.value = true;
    update();
    isLoading.value = false;
  }

  void logout() {
    currentUser.value = null;
    isLoggedIn.value = false;
    update();
  }
}
