import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_flutter_project/controllers/bloglistcontroller.dart';
import 'package:sample_flutter_project/screens/blogentry.dart';
import 'package:sample_flutter_project/screens/login.dart';
import 'package:sample_flutter_project/services/api.dart';

class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  final bloglistControlle = Get.put(BloglistController());

  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    // Api.blogList("45");
    return Scaffold(
        appBar: AppBar(
          title: Text("Bloglist"),
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              final box = GetStorage();
              box.remove("token");
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ),
        body: Container(
            height: sHeight * 100 / 70,
            width: sWidth * 100 / 90,
            // color: Colors.red,
            child: Obx(() => ListView.builder(
                itemCount: bloglistControlle.bolgList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      bloglistControlle.selectedId =
                          bloglistControlle.bolgList[index].id;
                      bloglistControlle.getBlogEntry();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => BlogEntry()));
                    },
                    child: Container(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl:
                                bloglistControlle.bolgList[index].imageUrl,
                            imageBuilder: (context, imageProvider) => Container(
                              height: sHeight / 100 * 15,
                              width: sWidth / 100 * 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          title: Text(
                            bloglistControlle.bolgList[index].title,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          subtitle: Text(
                            bloglistControlle.bolgList[index].createdAt,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            ),
                          ),
                        )),
                  );
                }))));
  }
}
