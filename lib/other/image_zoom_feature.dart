import 'package:flutter/material.dart';

class ImageZoomFeature extends StatefulWidget {
  const ImageZoomFeature({super.key});

  @override
  State<ImageZoomFeature> createState() => _ImageZoomFeatureState();
}


class _ImageZoomFeatureState extends State<ImageZoomFeature> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: width * 0.3,
            child: ListView.builder(
                itemCount: 14,
                itemBuilder: (context, index) {
                  return MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  ZoomAnImage(index: index,)));
                    },
                    color: Colors.cyan,
                    child: Text("Image ${index + 1}"),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class ZoomAnImage extends StatelessWidget {
  final int index;
  const ZoomAnImage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InteractiveViewer(
          panEnabled: false, // Set it to false
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.25,
          maxScale: 4,
          child: Image.asset(
            'assets/image${index+1}.jpg',
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
