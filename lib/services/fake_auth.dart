import 'package:kou_basvuru_platform/models/my_user.dart';
import 'package:kou_basvuru_platform/services/auth.dart';

class FakeAuth implements AuthService{
  String userId="123",mail="123@mail.com",pozisyon ="Admin";

  @override
  Future<MyUser> currentUser() async{
    return await Future.value(MyUser(userID: userId,mail:mail,pozisyon: pozisyon));
  }

  @override
  Future<MyUser?>signInWithEmailAndPassword(String email, String password,String pozisyon) {
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
      return Future.value(true);
  }

  @override
  Future<MyUser?> createUserWithEmailAndPassword(String email, String password,String pozisyon) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }


}