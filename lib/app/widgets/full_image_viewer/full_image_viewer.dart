import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullImageViewer extends StatefulWidget {
  final String? title;
  final String imageUrl;
  FullImageViewer({Key? key, required this.imageUrl, this.title})
      : super(key: key);

  @override
  State<FullImageViewer> createState() => _FullImageViewerState();
}

class _FullImageViewerState extends State<FullImageViewer> {
  TransformationController controller = TransformationController();

  String velocity = "VELOCITY";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Get.back(),
          ),
          title: Text(
            widget.title ?? "Preview",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            onDoubleTap: () => controller.value = Matrix4.identity(),
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: InteractiveViewer(
                        boundaryMargin: const EdgeInsets.all(0.0),
                        minScale: 0.1,
                        maxScale: 1.6,
                        child: Image.network(widget.imageUrl),
                        transformationController: controller,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
