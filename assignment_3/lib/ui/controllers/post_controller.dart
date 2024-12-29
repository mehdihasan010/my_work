import 'package:assignment_3/data/models/post_model.dart';
import 'package:assignment_3/data/services/api_service.dart';
import 'package:assignment_3/data/services/database_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  // Fetch posts from API or local database
  Future<void> fetchPosts() async {
    try {
      isLoading(true);

      // Attempt to fetch from API
      final fetchedPosts = await ApiService.fetchPosts();
      posts.assignAll(fetchedPosts);

      // Cache the data locally
      await DatabaseService.insertPosts(fetchedPosts);
    } catch (e) {
      // If API fetch fails, load from local database
      final cachedPosts = await DatabaseService.getPosts();
      posts.assignAll(cachedPosts);
    } finally {
      isLoading(false);
    }
  }
}
