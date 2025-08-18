import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/strings.dart';
import '../widgets/state_view.dart';
import '../controllers/auth_controller.dart';
import '../routes/app_routes.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignup() {
    FocusScope.of(context).unfocus();
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    setState(() => _errorMessage = null);
    _authController.signup(name, email, password);
    Future.delayed(const Duration(milliseconds: 500), () {
      if (_authController.isLoggedIn.value) {
        Get.offAllNamed(AppRoutes.home);
      } else if (!_authController.isLoading.value) {
        setState(() => _errorMessage = AppStrings.error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF87CEFA), Color(0xFF00BFFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Obx(
                  () => StateView(
                    isLoading: _authController.isLoading.value,
                    isError: _errorMessage != null,
                    errorMessage: _errorMessage,
                    isSuccess: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_add_alt_1,
                          size: 64.w,
                          color: Colors.white,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          AppStrings.signup,
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 32.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 16,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              TextField(
                                key: const Key('signup_name'),
                                controller: _nameController,
                                decoration: InputDecoration(
                                  labelText: AppStrings.name,
                                  prefixIcon: Icon(Icons.person_outline),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextField(
                                key: const Key('signup_email'),
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: AppStrings.email,
                                  prefixIcon: Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextField(
                                key: const Key('signup_password'),
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: AppStrings.password,
                                  prefixIcon: Icon(Icons.lock_outline),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                obscureText: true,
                              ),
                              SizedBox(height: 28.h),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  key: const Key('signup_button'),
                                  onPressed:
                                      _authController.isLoading.value
                                          ? null
                                          : _onSignup,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF00BFFF),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  child: Text(
                                    AppStrings.signup,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              TextButton(
                                key: const Key('goto_login'),
                                onPressed:
                                    () => Get.offAllNamed(AppRoutes.login),
                                child: Text(
                                  AppStrings.alreadyHaveAccount,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF00BFFF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
