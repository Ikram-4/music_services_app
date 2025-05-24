class MusicServiceModel {
  final String id;
  final String title;
  final String description;
  final String iconPath;
  final int order;

  MusicServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.order,
  });

  factory MusicServiceModel.fromFirestore(Map<String, dynamic> data, String id) {
    return MusicServiceModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      iconPath: data['iconPath'] ?? 'music_production',
      order: data['order'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'iconPath': iconPath,
      'order': order,
    };
  }
}