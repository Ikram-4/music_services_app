import 'package:flutter/material.dart';
import '/data/datasources/music_service_model.dart';
import '../../data/repositories/music_services_repository.dart';

class MusicServicesProvider with ChangeNotifier {
  final MusicServicesRepository _repository;

  MusicServicesProvider(this._repository);

  List<MusicServiceModel> _services = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<MusicServiceModel> get services => _services;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchMusicServices() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _services = await _repository.getMusicServices();
    } catch (e) {
      _errorMessage = e.toString();
      _services = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
