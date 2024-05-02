import 'dart:ffi';

class Doctor{
  String name;
  String image;
  String speciality;
  double rating;
  List<String> review;

  Doctor({
    required this.name,
    required this.image,
    required this.speciality,
    required this.rating,
    required this.review,
  });
  static List<Doctor> getDoctors() {
    return [
      Doctor(
          name: "Dr. Smith",
          image: "assets/images/DoctorProfile/1.jpg",
          speciality: "Cardiologist",
          rating: 4.5,
          review: ["Excellent doctor!", "Very knowledgeable."]
      ),
      Doctor(
          name: "Dr. Johnson",
          image: "assets/images/DoctorProfile/2.jpg",
          speciality: "Pediatrician",
          rating: 4.8,
          review: ["Great with kids.", "Highly recommended."]
      ),
      Doctor(
          name: "Dr. Garcia",
          image: "assets/images/DoctorProfile/3.jpg",
          speciality: "Dermatologist",
          rating: 4.2,
          review: ["Very friendly.", "Effective treatments."]
      ),
    ];
  }
}



