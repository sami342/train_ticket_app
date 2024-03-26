
import 'package:book_train_ticket/utils/app_layout.dart';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class cityScreen extends StatefulWidget {

  final Map<String, dynamic> city;

  const cityScreen({super.key, required this.city});

  @override
  State<cityScreen> createState() => _cityScreenState();

}
class _cityScreenState extends State<cityScreen> {


  @override
  Widget build(BuildContext context) {
   // print('this is image is: ${widget.city['image']}');

    final size=AppLayout.getSize(context);

    return Container(
      width: size.width*0.6,
      height:350,
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 17),
      margin: const EdgeInsets.only(left: 15 ,top:5,right:17),
      decoration: BoxDecoration(
        color: const Color(0XFFF4F6FD),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
           height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color:styles.primaryColor,
              image:  DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "image/${widget.city['image']}"
                )
              )
            ),
          ),
          const Gap(10),
          Text(widget.city['place'],
          style: styles.headLineStyle2.copyWith(color: Colors.black),
          ),
          const Gap(5),
          Text(widget.city['destination'],
            style: styles.headLineStyle3.copyWith(color: Colors.grey),
          ),
          const Gap(8),
          Text('${widget.city['price']}ETB',
            style: styles.headLineStyle3.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

