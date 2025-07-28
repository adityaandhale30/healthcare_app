class Appointment {
  final int id;
  final int userId;
  final int doctorId;
  final String slot;
  final String status;

  Appointment({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.slot,
    required this.status,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'userId': userId,
    'doctorId': doctorId,
    'slot': slot,
    'status': status,
  };

  factory Appointment.fromMap(Map<String, dynamic> map) => Appointment(
    id: map['id'],
    userId: map['userId'],
    doctorId: map['doctorId'],
    slot: map['slot'],
    status: map['status'],
  );
}
