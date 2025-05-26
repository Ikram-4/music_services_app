import 'package:cloud_firestore/cloud_firestore.dart';
import '../datasources/music_service_model.dart';

class FirebaseDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'music_services';

  Future<List<MusicServiceModel>> getMusicServices() async {
    try {
      final querySnapshot = await _firestore
          .collection(_collection)
          .orderBy('order')
          .get();

      return querySnapshot.docs
          .map((doc) => MusicServiceModel.fromFirestore(doc.data(), doc.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch music services: $e');
    }
  }
}
