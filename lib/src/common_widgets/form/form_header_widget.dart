import 'package:flutter/material.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/sizes.dart';
import 'package:loginsys/src/constants/text_string.dart';
class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({Key? key,
  required this.image,
  required this.title,
  required this.subTitle,
  }) :
    super(key:key);

  final String image,title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(image),
          height:250,width:250,
          ),
          Text(title, style: Theme.of(context).textTheme.headline1),
          Text(subTitle, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}