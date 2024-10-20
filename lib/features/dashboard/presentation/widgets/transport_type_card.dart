import 'package:flutter/material.dart';
import 'package:secure_access_administrator/core/sizes.dart';
import 'package:secure_access_administrator/core/text_styles.dart';

class TransportTypeCard extends StatelessWidget {
  const TransportTypeCard({required this.iconWidget, required this.caption, required this.ontap,super.key});

  final Widget iconWidget;
  final String caption;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(14),child: InkWell(
      onTap: ()=> ontap(),
      child: Card(
        borderOnForeground: true,
        elevation: 8,
        color: Colors.white,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height /6,
          width: MediaQuery.sizeOf(context).width,
          child: Column(children: [
            mediumSpacer,
            iconWidget,
            smallSpacer,
            Center(child: Text(caption, style: textStyleDirectives(),)),
          ],)
        ),
      ),
    ),
    );
  }
}
