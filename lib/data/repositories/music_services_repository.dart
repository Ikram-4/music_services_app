
import '/data/models/firebase_datasource.dart';
import '/data/datasources/music_service_model.dart';

abstract class MusicServicesRepository {
  Future<List<MusicServiceModel>> getMusicServices();
}

class MusicServicesRepositoryImpl implements MusicServicesRepository {
  final FirebaseDataSource _dataSource;

  MusicServicesRepositoryImpl(this._dataSource);

  @override
  Future<List<MusicServiceModel>> getMusicServices() async {
    return await _dataSource.getMusicServices();
  }
}
