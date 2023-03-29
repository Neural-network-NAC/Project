import 'dart:convert';
import 'dart:io';
import 'package:badges/src/badge.dart' as badge;
import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/pages/shoppingCartPage.dart';
import 'package:project/utils/item_list_provider.dart';
import 'package:project/utils/item_list_shared_prefs.dart';
import 'package:provider/provider.dart';

import '../utils/item.dart';

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
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              cameraController.value.isInitialized) {
            return Scaffold(
              appBar: AppBar(
                title: Text('$message'),
                actions: [
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 10),
                    // decoration: BoxDecoration(
                    //     color: Color(0XFF00A368),
                    //     borderRadius: BorderRadius.circular(10),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.white.withOpacity(0.5),
                    //         blurRadius: 2,
                    //       ),
                    //     ]),
                    child: badge.Badge(
                      badgeColor: Colors.red,
                      padding: EdgeInsets.all(7),
                      badgeContent: Text(
                        Provider.of<ItemListProvider>(context)
                            .items
                            .length
                            .toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ShoppingCartScreen()),
                          );
                        },
                        child: Icon(
                          CupertinoIcons.cart,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                    final request = http.MultipartRequest(
                        "POST",
                        Uri.parse(
                            "https://6fd8-49-36-113-17.in.ngrok.io/upload"));
                    final headers = {"Content-type": "multipart/form-data"};
                    request.files.add(http.MultipartFile(
                        'image',
                        selectedImage.readAsBytes().asStream(),
                        selectedImage.lengthSync(),
                        filename: selectedImage.path.split("/").last));
                    request.headers.addAll(headers);
                    final response = await request.send();
                    http.Response res =
                        await http.Response.fromStream(response);
                    final resJson = jsonDecode(res.body);
                    message = resJson['message'];
                    List<dynamic> variantsList = resJson['variants'];
                    setState(() {
                      variantFiller = CarouselSlider(
                        options: CarouselOptions(
                            height: 200.0, clipBehavior: Clip.none),
                        items: variantsList.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[300]!,
                                              blurRadius: 10,
                                              spreadRadius: 5,
                                            ),
                                          ]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            'Quantity: ' +
                                                i['quantity'].toString(),
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
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      width: 110,
                                      height: 50,
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.horizontal(
                                                    left: Radius.circular(15),
                                                    right:
                                                        Radius.circular(15))),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              iconSize: 15,
                                              onPressed: () async {
                                                Item tempItem = Item(
                                                    name: i['product_name'],
                                                    description:
                                                        i['description'],
                                                    price: double.parse(
                                                        i['price'].toString()),
                                                    quantity: 1,
                                                    availableQuantity:
                                                        i['quantity']);
                                                int tempInt = Provider.of<
                                                            ItemListProvider>(
                                                        context,
                                                        listen: false)
                                                    .findIndexByName(tempItem);
                                                if (tempInt == -1) {
                                                  Provider.of<ItemListProvider>(
                                                          context,
                                                          listen: false)
                                                      .addItem(tempItem);
                                                  await addItem(tempItem);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "Item added to cart")));
                                                } else {
                                                  tempItem = Provider.of<
                                                              ItemListProvider>(
                                                          context,
                                                          listen: false)
                                                      .items[tempInt];
                                                  if (tempItem.quantity < 999) {
                                                    if (tempItem
                                                        .checkQuantity()) {
                                                      //item.quantity++;
                                                      Provider.of<ItemListProvider>(
                                                              context,
                                                              listen: false)
                                                          .items[tempInt]
                                                          .quantity++;
                                                    }
                                                    updateItemQuantity(
                                                        tempInt,
                                                        Provider.of<ItemListProvider>(
                                                                context,
                                                                listen: false)
                                                            .items[tempInt]
                                                            .quantity);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Item quantity updated in cart")));
                                                  }
                                                }
                                              },
                                              icon: Icon(Icons.add),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              iconSize: 15,
                                              onPressed: () async {
                                                Item tempItem = Item(
                                                    name: i['product_name'],
                                                    description:
                                                        i['description'],
                                                    price: double.parse(
                                                        i['price'].toString()),
                                                    quantity: 1,
                                                    availableQuantity:
                                                        i['quantity']);
                                                int tempInt = Provider.of<
                                                            ItemListProvider>(
                                                        context,
                                                        listen: false)
                                                    .findIndexByName(tempItem);
                                                if (tempInt > -1) {
                                                  tempItem = Provider.of<
                                                              ItemListProvider>(
                                                          context,
                                                          listen: false)
                                                      .items[tempInt];
                                                  if (tempItem.quantity > 1) {
                                                    Provider.of<ItemListProvider>(
                                                            context,
                                                            listen: false)
                                                        .items[tempInt]
                                                        .quantity--;
                                                    updateItemQuantity(
                                                        tempInt,
                                                        Provider.of<ItemListProvider>(
                                                                context,
                                                                listen: false)
                                                            .items[tempInt]
                                                            .quantity);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Item quantity updated in cart")));
                                                  } else {
                                                    Provider.of<ItemListProvider>(
                                                            context,
                                                            listen: false)
                                                        .removeItem(tempItem);
                                                    await removeItem(tempInt);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Item deleted")));
                                                  }
                                                }
                                              },
                                              icon: Icon(Icons.remove),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
