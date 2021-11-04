import 'dart:io';

import 'package:kou_basvuru_platform/models/my_user.dart';

abstract class storageBase {
  Future<String> uploadFile(
      String UserId, String fileType, String dosyaAdi,File yuklenecekDosya, );
}
