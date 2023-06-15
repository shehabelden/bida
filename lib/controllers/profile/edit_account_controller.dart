import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/catch_storage.dart';
import '../../helpers/constants.dart';
import '../../helpers/main_user.dart';
import '../../models/user_model.dart';
import '../../network/firestorage_service.dart';
import '../../network/firestore_service.dart';
import 'profile_controller.dart';

class EditAccountController extends GetxController {
  UserModel model = MainUser.instance.model!;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  File? image;
  String? imagePath;

  late TextEditingController name;
  late TextEditingController location;
  late TextEditingController address;
  late TextEditingController phoneNumbner;

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController(text: model.name);
    location = TextEditingController(text: model.location);
    address = TextEditingController(text: model.address);
    phoneNumbner = TextEditingController(text: model.phoneNumber.toString());
  }

  Future<void> pickImage(ImageSource source) async {
    var _picker = await ImagePicker().pickImage(source: source);
    if (_picker != null) {
      imagePath = _picker.path;
      image = File(_picker.path);
    }
    update();
  }

  Future<String?> uploadImage() async {
    if (image == null) return null;
    String url = await FireStorageService.instance.uploadImage(image!);
    return url;
  }

  Future<void> onSubmit() async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    update();

    try {
      String? imageUrl;
      if (image != null) imageUrl = await uploadImage();

      UserModel _model = UserModel(
        uId: model.uId,
        email: model.email,
        address: address.text,
        name: name.text,
        location: location.text,
        phoneNumber: int.parse(phoneNumbner.text),
        image: imageUrl ?? model.image,
      );

      await FirestoreServic.instance.updateUser(_model);

      await CatchStorage.save(k_userKey, jsonEncode(_model.toMap));

      MainUser.instance.update();

      Get.back();

      Get.find<ProfileController>().update();

      isLoading = false;
      update();
    } on FirebaseException catch (error) {
      Get.snackbar(
        "Something_wrong".tr,
        error.message!,
        backgroundColor: Colors.red,
      );
      isLoading = false;
      update();
    }
  }
}
