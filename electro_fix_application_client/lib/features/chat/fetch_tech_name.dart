import 'package:cloud_firestore/cloud_firestore.dart';

Future<String?> getTechnicianName(String technicianID) async {
  try {
    DocumentSnapshot technicianDoc = await FirebaseFirestore.instance
        .collection('Technicians')
        .doc(technicianID)
        .get();

    if (technicianDoc.exists) {
      return technicianDoc.get('name');
    } else {
      return null;
    }
  } catch (e) {
    // for development افتكر نشيلها قبل المناقشة
    print('Error fetching technician name: $e');
    return null;
  }
}
