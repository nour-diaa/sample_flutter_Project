import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter_project/controllers/bloglistcontroller.dart';
import 'package:sample_flutter_project/models/blog.dart';

class BlogEntry extends StatefulWidget {
  // Blog selectedBlog;
  // BlogEntry(this.selectedBlog);
  @override
  _BlogEntryState createState() => _BlogEntryState();
}

class _BlogEntryState extends State<BlogEntry> {
  final bloglistControlle = Get.find<BloglistController>();
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog Entry"),
        centerTitle: true,
      ),
      body: Obx(() => Container(
            width: sWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  bloglistControlle.selectedBlog.value.title,
                  style: TextStyle(fontSize: 20),
                ),
                CachedNetworkImage(
                  imageUrl: bloglistControlle.selectedBlog.value.imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    height: sHeight / 100 * 30,
                    width: sWidth / 100 * 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Text(bloglistControlle.selectedBlog.value.createdAt)
              ],
            ),
          )),
    );
  }
}
