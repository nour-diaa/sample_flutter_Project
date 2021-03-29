import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_flutter_project/models/blog.dart';
import 'package:sample_flutter_project/services/api.dart';

class BloglistController extends GetxController {
  var bolgList = List<Blog>().obs;
  var selectedBlog = Blog().obs;
  var selectedId;
  var token;
  final box = GetStorage();
  @override
  void onInit() async {
    token = await box.read('token');
    await getBlogsList();
    super.onInit();
  }

  Future<void> getBlogsList() async {
    List<Blog> list = await Api.blogList(token.toString());
    bolgList.assignAll(list);
  }

  Future<void> getBlogEntry() async {
    selectedBlog.value = await Api.singleBlog(token.toString(), selectedId);
  }
}
