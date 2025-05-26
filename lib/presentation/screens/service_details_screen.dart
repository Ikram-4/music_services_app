import 'package:flutter/material.dart';
import 'package:music_services_app/data/datasources/music_service_model.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final MusicServiceModel service;

  const ServiceDetailsScreen({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        title: Text(
          service.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF8B1538),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B1538).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  _getServiceIcon(service.iconPath),
                  size: 80,
                  color: const Color(0xFF8B1538),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'You tapped on:',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                service.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                service.description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B1538),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getServiceIcon(String iconPath) {
    switch (iconPath.toLowerCase()) {
      case 'music_production':
        return Icons.equalizer;
      case 'mixing_mastering':
        return Icons.tune;
      case 'lyrics_writing':
        return Icons.edit;
      case 'vocals':
        return Icons.mic;
      default:
        return Icons.music_note;
    }
  }
}
