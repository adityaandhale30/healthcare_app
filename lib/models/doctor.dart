class Doctor {
  final int id;
  final String name;
  final String specialty;
  final String imageUrl;
  final String bio;
  final List<String> availableSlots;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.bio,
    required this.availableSlots,
  });

  // For Sqflite (toMap/fromMap)
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'specialty': specialty,
        'imageUrl': imageUrl,
        'bio': bio,
        'availableSlots': availableSlots.join(','),
      };

  factory Doctor.fromMap(Map<String, dynamic> map) => Doctor(
        id: map['id'],
        name: map['name'],
        specialty: map['specialty'],
        imageUrl: map['imageUrl'],
        bio: map['bio'],
        availableSlots: (map['availableSlots'] as String).split(','),
      );
} 