import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/strings.dart';
import '../widgets/state_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Center(
            child: StateView(
              isLoading: false, // Replace with controller.isLoading.value
              isError: false,   // Replace with controller error state
              isSuccess: false, // Replace with controller success state
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.login, style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 32.h),
                  TextField(
                    decoration: InputDecoration(
                      labelText: AppStrings.email,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextField(
                    decoration: InputDecoration(
                      labelText: AppStrings.password,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 32.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(AppStrings.login, style: TextStyle(fontSize: 18.sp)),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TextButton(
                    onPressed: () {},
                    child: Text(AppStrings.dontHaveAccount, style: TextStyle(fontSize: 16.sp)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 