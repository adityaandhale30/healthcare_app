import 'package:get/get.dart';
import '../models/doctor.dart';

class DoctorController extends GetxController {
  var isLoading = false.obs;
  var doctors = <Doctor>[].obs;
  var selectedDoctor = Rxn<Doctor>();

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  void fetchDoctors() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    doctors.value = [
      Doctor(
        id: 1,
        name: 'Dr. Alice Smith',
        specialty: 'Cardiologist',
        imageUrl: 'assets/images/doctor1.png',
        bio: 'Experienced cardiologist with 10+ years in practice.',
        availableSlots: ['10:00 AM', '11:00 AM', '2:00 PM'],
      ),
      Doctor(
        id: 2,
        name: 'Dr. Bob Johnson',
        specialty: 'Dermatologist',
        imageUrl: 'assets/images/doctor2.png',
        bio: 'Expert in skin care and dermatology.',
        availableSlots: ['9:00 AM', '1:00 PM', '3:00 PM'],
      ),
    ];
    isLoading.value = false;
    update();
  }

  void selectDoctor(Doctor doctor) {
    selectedDoctor.value = doctor;
    update();
  }
}
