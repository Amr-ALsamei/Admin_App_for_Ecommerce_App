import 'package:adminapp/Core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonGlobal extends StatelessWidget {
  final void Function()? onPressed;
  final String buttontitle;
  const CustomButtonGlobal({super.key,required this.onPressed,required this.buttontitle});

  @override
  Widget build(BuildContext context) {
    return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Appcolors.primarycolor
                    ),
                    margin: EdgeInsets.all(25),
                    child:MaterialButton(
                      elevation: 0,
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      onPressed:onPressed,
                      child: Text(buttontitle),
                      
                      ) ,
                  );
  }
}