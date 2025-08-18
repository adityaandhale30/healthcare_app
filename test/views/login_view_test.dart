import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:healthcare_app/views/login_view.dart';
import 'package:healthcare_app/controllers/auth_controller.dart';
import 'package:healthcare_app/routes/app_routes.dart';
import 'package:healthcare_app/utils/strings.dart';

void main() {
  setUp(() {
    Get.reset();
    Get.put(AuthController());
  });

  testWidgets('LoginView renders and validates input', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: AppRoutes.login,
        getPages: [
          GetPage(name: AppRoutes.login, page: () => const LoginView()),
        ],
      ),
    );
    expect(find.text(AppStrings.login), findsOneWidget);
    expect(find.byKey(const Key('login_email')), findsOneWidget);
    expect(find.byKey(const Key('login_password')), findsOneWidget);
    expect(find.byKey(const Key('login_button')), findsOneWidget);
  });

  testWidgets('Login fails with invalid credentials', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: AppRoutes.login,
        getPages: [
          GetPage(name: AppRoutes.login, page: () => const LoginView()),
        ],
      ),
    );
    await tester.enterText(
      find.byKey(const Key('login_email')),
      'wrong@example.com',
    );
    await tester.enterText(
      find.byKey(const Key('login_password')),
      'wrongpass',
    );
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text(AppStrings.invalidCredentials), findsOneWidget);
  });

  testWidgets('Login succeeds with valid credentials and navigates to home', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: AppRoutes.login,
        getPages: [
          GetPage(name: AppRoutes.login, page: () => const LoginView()),
          GetPage(
            name: AppRoutes.home,
            page: () => const Scaffold(body: Text('Home Screen')),
          ),
        ],
      ),
    );
    await tester.enterText(
      find.byKey(const Key('login_email')),
      'john@example.com',
    );
    await tester.enterText(find.byKey(const Key('login_password')), '123456');
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pump(const Duration(milliseconds: 600));
    expect(find.text('Home Screen'), findsOneWidget);
  });
}
