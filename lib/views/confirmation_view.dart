import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../utils/strings.dart';
import '../routes/app_routes.dart';

class ConfirmationView extends StatelessWidget {
  const ConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animations/success.json',
                  width: 180.w,
                  height: 180.w,
                  repeat: false,
                ),
                SizedBox(height: 32.h),
                Text(
                  AppStrings.appointmentConfirmed,
                  style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  AppStrings.bookingSuccess,
                  style: TextStyle(fontSize: 18.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.offAllNamed(AppRoutes.home),
                    child: Text(AppStrings.home, style: TextStyle(fontSize: 18.sp)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 