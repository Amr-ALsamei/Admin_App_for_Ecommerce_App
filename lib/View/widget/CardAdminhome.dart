
import 'package:flutter/material.dart';

class CardAdminHome extends StatelessWidget {
  final String imge;
  final String title;
  final void Function()? onClick;
  const CardAdminHome({super.key, required this.imge, required this.title,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Card(
            child: Column(
              children: [
                Image.asset(imge,width: 80,height: 80,),
                Text(title)
              ],
            ),
          ),
    );
  }
}