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
                  Uri.parse("https://6d0e-2409-40c0-1029-3c4b-43-33be-e1a5-7a32.in.ngrok.io/upload"));
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
              List<dynamic> variantsList = resJson['variants'];
              setState(() {
                variantFiller = CarouselSlider(
                  options: CarouselOptions(height: 200.0),
                  items: variantsList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () => {},
                          child: Ink(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[300]!,
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                    // 'https://m.media-amazon.com/images/I/91eC2O5IN5L._SX679_.jpg',
                                    i['image_link'],
                                    height: 100,
                                    width: 100
                                    // widget.icon,
                                    // color: widget.color,
                                    ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  i['product_name'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          fontSize: 14,
                                          fontFamily: 'Montserrat'),
                                ),
                                Text(
                                  i['description'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          fontSize: 14,
                                          fontFamily: 'Montserrat'),
                                ),
                                Text(
                                  'Price: ₹ ' + i['price'].toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          fontSize: 14,
                                          fontFamily: 'Montserrat'),
                                ),
                                Text(
                                  'Quantity: ' + i['quantity'].toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          fontSize: 14,
                                          fontFamily: 'Montserrat'),
                                ),
                              ],
                            ),
                          ),
                        );
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