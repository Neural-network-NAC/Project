import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'package:image_picker/image_picker.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  late String message = "Dummy";
  int direction = 0;
  Widget variantFiller = Container();

  @override
  void initState() {
    startCamera(direction);
    super.initState();
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      // print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(title: Text('$message')),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  width: 370.0,
                  height: 400.0,
                  child: CameraPreview(cameraController),
                ),
                Column(children: [
                  Center(
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text('Variants')),
                  ),
                  variantFiller
                ])
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Click',
          child: Icon(Icons.search),
          onPressed: () async {
            try {
              print("Hi");
              final image = await cameraController.takePicture();
              String ImagePath = image.path;
              // GallerySaver.saveImage(ImagePath);
              File selectedImage = File(ImagePath);
              final request = http.MultipartRequest("POST",
                  Uri.parse("https://4fc3-49-36-122-221.in.ngrok.io/upload"));
              final headers = {"Content-type": "multipart/form-data"};
              request.files.add(http.MultipartFile(
                  'image',
                  selectedImage.readAsBytes().asStream(),
                  selectedImage.lengthSync(),
                  filename: selectedImage.path.split("/").last));
              request.headers.addAll(headers);
              final response = await request.send();
              http.Response res = await http.Response.fromStream(response);
              final resJson = jsonDecode(res.body);
              message = resJson['message'];
              setState(() {
                variantFiller = CarouselSlider(
                  options: CarouselOptions(height: 200.0),
                  items: resJson['variants'].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration:
                                const BoxDecoration(color: Colors.green),
                            child: Center(
                              child: Text(
                                '$i',
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ));
                      },
                    );
                  }).toList(),
                );
              });
            } catch (e) {
              print("Error detected");
              print(e); //show error
            }
          },
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
