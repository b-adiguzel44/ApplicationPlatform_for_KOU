import 'package:flutter/material.dart';
class SocailLoginButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final double yukseklik;
  final Widget buttonIcon;
  final VoidCallback onPress;

  const SocailLoginButton({Key? key,this.buttonText:"Yeni Buton",this.buttonColor:Colors.blue,this.textColor:Colors.white,this.radius:16,this.yukseklik:40,required this.buttonIcon, required this.onPress}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child:SizedBox(
      height: yukseklik,
      child : RaisedButton( 
      onPressed: onPress,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius)),),
      color: buttonColor,
      elevation : 10,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
               buttonIcon!=null ? buttonIcon: Container(),
                Text(buttonText , style: TextStyle(color: textColor),),
              buttonIcon!=null ? Opacity(opacity: 0 , child: buttonIcon) : Container(),
        ]   
      ),
       ),
    ) 
    ) ;
  }
  tabbar()
  {

  }
}