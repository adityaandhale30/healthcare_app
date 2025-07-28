import 'package:get/get.dart';
import '../models/appointment.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;
  var appointments = <Appointment>[].obs;
  var selectedSlot = ''.obs;
  var bookingSuccess = false.obs;

  void selectSlot(String slot) {
    selectedSlot.value = slot;
    update();
  }

  void bookAppointment(int userId, int doctorId, String slot) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final appointment = Appointment(
      id: appointments.length + 1,
      userId: userId,
      doctorId: doctorId,
      slot: slot,
      status: 'confirmed',
    );
    appointments.add(appointment);
    bookingSuccess.value = true;
    isLoading.value = false;
    update();
  }

  void resetBooking() {
    selectedSlot.value = '';
    bookingSuccess.value = false;
    update();
  }
}
