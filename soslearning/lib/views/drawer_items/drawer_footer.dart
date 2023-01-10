import 'package:flutter/material.dart';
import 'package:soslearning/themes/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerFooter extends StatelessWidget {
  const DrawerFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              launchUrl(Uri.parse("tel://01701037042"));
            },
            child: Container(
              height: 50,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call,
                    color: AppTheme.color.call_but_icon,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Call Now',
                    style: AppTheme.text.call_but_text,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  gradient: AppTheme.color.medel_lengradient,
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
