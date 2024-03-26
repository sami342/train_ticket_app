import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLayout{
  static getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
  static getScreenHieght(){
    return Get.height;
  }
  static getScreenWidth(){
    return Get.width;
  }
  static getHieght(double pixels){
    double x=getScreenHieght()/pixels;
    return getScreenHieght()/x;
  }
  static getWidth(double pixels){
    double x=getScreenWidth()/pixels;
    return getScreenWidth()/x;
  }

}

class ResponsiveUtil {
  static double responsiveWidth(double size) {
    double screenWidth = Get.width;
    return screenWidth * (size / 100);
  }

  static double responsiveHeight(double size) {
    double screenHeight = Get.height;
    return screenHeight * (size / 100);
  }
}
