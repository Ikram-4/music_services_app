import 'package:get_it/get_it.dart';
import '../data/repositories/music_services_repository.dart';
import '../data/models/firebase_datasource.dart';
import '../presentation/providers/music_services_provider.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  // Data Sources
  getIt.registerLazySingleton<FirebaseDataSource>(
    () => FirebaseDataSource(),
  );
  
  // Repositories
  getIt.registerLazySingleton<MusicServicesRepository>(
    () => MusicServicesRepositoryImpl(getIt<FirebaseDataSource>()),
  );
  
  // Providers
  getIt.registerFactory<MusicServicesProvider>(
    () => MusicServicesProvider(getIt<MusicServicesRepository>()),
  );
}
