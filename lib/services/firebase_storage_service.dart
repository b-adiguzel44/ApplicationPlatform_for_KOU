import 'dart:io';
import 'package:kou_basvuru_platform/services/storagebase.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorageServise implements storageBase {
  final firebase_storage.FirebaseStorage _sbStore =
      firebase_storage.FirebaseStorage.instance;

  late firebase_storage.Reference ref;

  @override
  Future<String> uploadFile(
      // ignore: non_constant_identifier_names
      String UserId,
      String fileType,String dosyaAdi,
      File yuklenecekDosya) async {
    ref = _sbStore.ref(fileType).child(UserId).child(dosyaAdi);
    var uploadTask = ref.putFile(yuklenecekDosya);
    var url = await (await uploadTask).ref.getDownloadURL();
    return url;
  }
}
