import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:roomia/constants/hostel_post_class.dart';

class PostController extends GetxController {
  var posts = <HostelPost>[].obs;

  void addPost(List<Uint8List> imageBytesList, String description) {
    posts.add(
      HostelPost(imageBytesList: imageBytesList, description: description),
    );
  }

  void likePost(int index) {
    posts[index].likes++;
    posts.refresh();
  }
}
