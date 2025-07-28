import 'package:get/get.dart';
import '../views/login_view.dart';
import '../views/signup_view.dart';
import '../views/home_view.dart';
import '../views/doctor_profile_view.dart';
import '../views/appointment_slot_view.dart';
import '../views/confirmation_view.dart';
import '../bindings/auth_binding.dart';
import '../bindings/doctor_binding.dart';
import '../bindings/appointment_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.login;

  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: DoctorBinding(),
    ),
    GetPage(
      name: AppRoutes.doctorProfile,
      page: () => const DoctorProfileView(),
      binding: DoctorBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.appointmentSlot,
      page: () => const AppointmentSlotView(),
      binding: AppointmentBinding(),
    ),
    GetPage(
      name: AppRoutes.confirmation,
      page: () => const ConfirmationView(),
      binding: AppointmentBinding(),
    ),
  ];
}
