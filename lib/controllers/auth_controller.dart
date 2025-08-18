import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  @override
  void onInit() {
    super.onInit();
    initAuth();
  }

  Future<void> initAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    if (userId != null) {
      final user = users.firstWhereOrNull((u) => u.id == userId);
      if (user != null) {
        currentUser.value = user;
        isLoggedIn.value = true;
        update();
      }
    }
  }

  void login(String email, String password) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final user = users.firstWhereOrNull(
      (u) => u.email == email && u.password == password,
    );
    if (user != null) {
      currentUser.value = user;
      isLoggedIn.value = true;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('userId', user.id);
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
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', user.id);
    update();
    isLoading.value = false;
  }

  void logout() async {
    currentUser.value = null;
    isLoggedIn.value = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    update();
  }
}
