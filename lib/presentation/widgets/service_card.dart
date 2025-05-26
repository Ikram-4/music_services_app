import 'package:flutter/material.dart';

import '../../data/datasources/music_service_model.dart';
class ServiceCard extends StatelessWidget {
  final MusicServiceModel service;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.service,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Service Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _getIconColor(service.iconPath),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getServiceIcon(service.iconPath),
                color: Colors.white,
                size: 20,
              ),
            ),
            
            const SizedBox(width: 16),
            
            // Service Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service.description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            // Arrow Icon
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.5),
              size: 16,
            ),
          ],
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

  Color _getIconColor(String iconPath) {
    switch (iconPath.toLowerCase()) {
      case 'music_production':
        return const Color(0xFFFF6B6B);
      case 'mixing_mastering':
        return const Color(0xFF4ECDC4);
      case 'lyrics_writing':
        return const Color(0xFFFFE66D);
      case 'vocals':
        return const Color(0xFF9B59B6);
      default:
        return const Color(0xFF8B1538);
    }
  }
}
