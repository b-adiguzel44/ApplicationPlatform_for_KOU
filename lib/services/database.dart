import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kou_basvuru_platform/models/my_user.dart';

abstract class DataBaseService {

  Future<bool> saveUserWithEmailAndPassword(MyUser saveUser);
  Future<MyUser> readUser(String id);
  Future<bool> updateUserAd(String UserId,String UserAd,String UserSoyad, String UserAdres);


}