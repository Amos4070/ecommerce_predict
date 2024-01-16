import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_predict/utilities/categ_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

import '../../widget/snackbar.dart';

List<String> categ = [];
List<String> categCereals = [];
List<String> categTubers = [];

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({Key? key}) : super(key: key);

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  late double price;
  late int quantity;
  late String proName;
  late String proDesc;
  late String proId;
  bool processing = false;

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  List<XFile>? imagesFileList = [];
  List<String>? imageUrlList = [];

  dynamic _pickedImageError;

  void pickProductImages() async {
    try {
      /// we need to safe the image picked in a variable and this is called pickedImage
      ///the pickedImage must be XFile type
      final pickedImages = await _picker.pickMultiImage(
          maxWidth: 300, maxHeight: 300, imageQuality: 99);
      setState(() {
        imagesFileList = pickedImages!;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
    }
  }

  Widget previewImages() {
    if (imagesFileList!.isNotEmpty) {
      return ListView.builder(
          itemCount: imagesFileList!.length,
          itemBuilder: (context, index) {
            return Image.file(File(imagesFileList![index].path));
          });
    } else {
      return const Center(
          child: Text(
        'You have not\n\npicked images\n\n\t\tYET!',
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ));
    }
  }

  Future<void> uploadImages() async {
    if (mainCategoryValue != 'select category' &&
        subCategoryValue != 'subcategory') {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (imagesFileList!.isNotEmpty) {
          setState(() {
            processing = true;
          });

          /// for saving images to  firebase
          try {
            for (var image in imagesFileList!) {
              firebase_storage.Reference ref = firebase_storage
                  .FirebaseStorage.instance
                  .ref('products/${path.basename(image.path)}');
              await ref.putFile(File(image.path)).whenComplete(() async {
                await ref.getDownloadURL().then((value) {
                  imageUrlList?.add(value);
                });
              });
            }
          } catch (e) {
            MyMessageHandler.showSnackbar(_scaffoldKey, e.toString());
          }

          _formKey.currentState!.reset();
        } else {
          MyMessageHandler.showSnackbar(_scaffoldKey, 'please pick images');
        }

        ///todo do nothing for now
      } else {
        MyMessageHandler.showSnackbar(_scaffoldKey, 'please fill all fields');
      }
    } else {
      MyMessageHandler.showSnackbar(_scaffoldKey, 'please select categories');
    }
  }

  void uploadData() async {
    if (imageUrlList!.isNotEmpty) {
      CollectionReference productRef =
          FirebaseFirestore.instance.collection('products');

      proId = const Uuid().v4();

      await productRef.doc(proId).set({
        'maincateg': mainCategoryValue,
        'subcateg': subCategoryValue,
        'price': price,
        'instock': quantity,
        'proname': proName,
        'productdesc': proDesc,
        'sid': FirebaseAuth.instance.currentUser!.uid,
        'proimages': imageUrlList,
        'discount': 0
      }).whenComplete(() {
        setState(
          () {
            imagesFileList = [];
            mainCategoryValue = 'select category';
            processing = false;
            subCategList = [];
            imageUrlList = [];
          },
        );
      });
    } else {
      print('no images');
    }
  }

  void uploadProduct() async {
    await uploadImages().whenComplete(() {
      uploadData();
    });
  }

  String subCategoryValue = 'shirt';

  String mainCategoryValue = 'select category';
  List<String> subCategList = [];

  void selectedMainCategory(String? value) {
    if (value == 'select category') {
      subCategList = [];
    } else if (value == 'cereals') {
      subCategList = cereals;
    } else if (value == "tubers") {
      subCategList = tubers;
    } else if (value == "legumes") {
      subCategList = legumes;
    } else if (value == 'vegetable & fruits') {
      subCategList = vegetablefruits;
    } else if (value == 'sugars') {
      subCategList = sugars;
    } else if (value == 'meats & eggs') {
      subCategList = meatseggs;
    } else if (value == 'dairy') {
      subCategList = dairy;
    } else if (value == 'oil') {
      subCategList = oil;
    } else if (value == 'beverages') {
      subCategList = beverages;
    } else if (value == 'equipments') {
      subCategList = equipments;
    } else if (value == 'chemicals') {
      subCategList = chemicals;
    } else if (value == 'property') {
      subCategList = property;
    }

    setState(() {
      mainCategoryValue = value!;
      subCategoryValue = 'subcategory';
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.blueGrey.shade100,
                        height: size.width * 0.5,
                        width: size.width * 0.5,
                        child: imagesFileList != null
                            ? previewImages()
                            : const Center(
                                child: Text(
                                'You have not\n\npicked images\n\n\t\tYET!',
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              )),
                      ),
                      SizedBox(
                        height: size.width * 0.5,
                        width: size.width * 0.5,
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '* select main category',
                                  style: TextStyle(color: Colors.red),
                                ),
                                DropdownButton(
                                    iconSize: 40,
                                    iconEnabledColor: Colors.red,
                                    dropdownColor: Colors.yellow.shade400,
                                    value: mainCategoryValue,
                                    items: maincateg
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem(
                                          value: value, child: Text(value));
                                    }).toList(),
                                    onChanged: (String? value) {
                                      selectedMainCategory(value);
                                    }),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                const Text(
                                  'select subcategory',
                                  style: TextStyle(color: Colors.red),
                                ),
                                DropdownButton(
                                    iconSize: 40,
                                    menuMaxHeight: 500,
                                    iconDisabledColor: Colors.black,
                                    iconEnabledColor: Colors.red,
                                    dropdownColor: Colors.yellow.shade400,
                                    disabledHint: const Text('select category'),
                                    value: subCategoryValue,
                                    items: subCategList
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem(
                                          value: value, child: Text(value));
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        subCategoryValue = value!;
                                      });
                                    })
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                    child: Divider(
                      color: Colors.yellowAccent,
                      thickness: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter price for this product';
                            } else if (value.isValidPrice() != true) {
                              return 'Invalid Price';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            price = double.parse(value!);
                          },
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: textFormDecoration.copyWith(
                            labelText: 'price',
                            hintText: 'price...\$',
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter quantity';
                          } else if (value.isValidQuatity() != true) {
                            return 'Not valid quantity';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          quantity = int.parse(value!);
                        },
                        keyboardType: TextInputType.number,
                        decoration: textFormDecoration.copyWith(
                          labelText: 'Quantity',
                          hintText: 'Add Quantity',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter product name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            proName = value!;
                          },
                          maxLength: 150,
                          maxLines: 4,
                          decoration: textFormDecoration.copyWith(
                            labelText: 'product name',
                            hintText: 'Enter product name',
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter product description';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            proDesc = value;
                          },
                          maxLength: 1000,
                          maxLines: 7,
                          decoration: textFormDecoration.copyWith(
                            labelText: 'product description',
                            hintText: 'Enter product description',
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: FloatingActionButton(
                onPressed: imagesFileList!.isEmpty
                    ? () {
                        pickProductImages();
                      }
                    : () {
                        setState(() {
                          imagesFileList = [];
                        });
                      },
                backgroundColor: Colors.yellow,
                child: imagesFileList!.isEmpty
                    ? const Icon(
                        Icons.photo_library,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.delete_forever,
                        color: Colors.black,
                      ),
              ),
            ),
            FloatingActionButton(
                onPressed: processing == true
                    ? null
                    : () {
                        uploadProduct();
                      },
                backgroundColor: Colors.yellow,
                child: processing == true
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.upload,
                        color: Colors.black,
                      )),
          ],
        ),
      ),
    );
  }
}

var textFormDecoration = InputDecoration(
  labelText: 'price',
  hintText: 'price...\$',
  labelStyle: const TextStyle(color: Colors.purple),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.brown, width: 1),
      borderRadius: BorderRadius.circular(10)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
      borderRadius: BorderRadius.circular(10)),
);

extension QuantityValidator on String {
  bool isValidQuatity() {
    return RegExp(r'^[1-9][0-9]*$').hasMatch(this);
  }
}

extension PriceValidator on String {
  bool isValidPrice() {
    return RegExp(r'^((([1-9][0-9]*[\.])||([0][\.]*))([0-9]{1,2}))$')
        .hasMatch(this);
  }
}
