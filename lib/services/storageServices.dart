import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

Future<String> uplodSnapToFirebase(XFile xFile) async {
  firebase_storage.Reference ref = storage.ref("uploads/file-to-upload.png");

  try {
    await ref.putFile(File(xFile.path));
  } catch (e) {
    print(e);
  }
  // print(await ref.getDownloadURL());
  // print(ref.fullPath);
  return ref.getDownloadURL();
}
