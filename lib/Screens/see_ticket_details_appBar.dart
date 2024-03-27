import 'dart:ui';
import 'package:book_train_ticket/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class SeeTicketDetailAppBar extends StatelessWidget {
  const SeeTicketDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(

      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      expandedHeight: 300,
      backgroundColor:Colors.white,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        title:Container(
          margin: const EdgeInsets.only(top: 130,left: 10),

          child: Column(
              children: [
                Row(
                  children: [
                    Text("AA", style: styles.headLineStyle2,),
                    const Gap(30),
                    const Icon(Icons.arrow_forward,color: Colors.black,),
                    const Gap(30),
                    Text("DD",style: styles.headLineStyle2,),
                  ],
                ),
                Row(
                  children: [
                    Text("Adiss Abeba", style: styles.headLineStyle4.copyWith(color: Colors.white),),
                    const Gap(30),
                    Text("Dire Dawa",style: styles.headLineStyle4.copyWith(color: Colors.white),),
                  ],
                ),
              ],

            ),
        ),

        background: Image.asset(
          "image/image9.jpg",
          fit:BoxFit.cover,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child:Container(
          height: 32.0,
          alignment: Alignment.center,
          decoration:const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(52),
              topRight: Radius.circular(52),
            ),
          ),
          child: Container(
            width: 40.0,
            height: 5.0,
            decoration: BoxDecoration(
              color:Colors.grey,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
      leadingWidth: 60.0,
      leading:Container(
        margin: const EdgeInsets.only(left: 24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(56),
          child: BackdropFilter(

            filter:ImageFilter.blur(sigmaX: 3.0,sigmaY: 3.0),
            child: Container(
              height: 56.0,
              width: 56.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape:BoxShape.circle,
                color: Colors.white.withOpacity(0.20),

              ),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ),
      ) ,
    );
  }
}
