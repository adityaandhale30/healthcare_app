import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/doctor_controller.dart';
import '../controllers/auth_controller.dart';
import '../utils/strings.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorController doctorController = Get.find<DoctorController>();
    final AuthController authController = Get.find<AuthController>();
    final userName = authController.currentUser.value?.name ?? '';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.h),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF87CEFA), Color(0xFF00BFFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28.w,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 32.w,
                          color: const Color(0xFF00BFFF),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppStrings.welcome},',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              userName,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.logout, color: Colors.white),
                        onPressed: () {
                          authController.logout();
                          Get.offAllNamed('/login');
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search doctors, specialties...',
                        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to appointment booking
        },
        backgroundColor: const Color(0xFF00BFFF),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          AppStrings.bookAppointment,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
      body: Obx(() {
        if (doctorController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final doctors = doctorController.doctors;
        final specialties = doctors.map((d) => d.specialty).toSet().toList();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              SizedBox(
                height: 40.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: specialties.length,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    return Chip(
                      label: Text(
                        specialties[index],
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                      backgroundColor: const Color(0xFF00BFFF),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 4.h,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: ListView.separated(
                  itemCount: doctors.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
                    return GestureDetector(
                      onTap: () {
                        doctorController.selectDoctor(doctor);
                        // TODO: Add hero animation and navigate to profile
                        // Get.toNamed(AppRoutes.doctorProfile);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFE3F6FF), Color(0xFFB3E0FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Row(
                            children: [
                              Hero(
                                tag: 'doctor_${doctor.id}',
                                child: CircleAvatar(
                                  radius: 32.w,
                                  backgroundImage: AssetImage(doctor.imageUrl),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: Color(0xFF00BFFF),
                                          size: 20.w,
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          doctor.name,
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6.h),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.medical_services,
                                          color: Color(0xFF00BFFF),
                                          size: 18.w,
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          doctor.specialty,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      doctor.bio,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey[600],
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
