// hostel_post_class.dart
import 'dart:typed_data';

class HostelPost {
  final List<Uint8List> imageBytesList;
  final String description;
  int likes;

  HostelPost({
    required this.imageBytesList,
    required this.description,
    this.likes = 0,
  });
}
