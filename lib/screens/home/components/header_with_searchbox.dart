import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2, 
          child: Stack(
            children: <Widget>[
              Container(height: size.height * 0.2 - 27, 
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)
                )
              ),
            )],
          ),
    );
  }
}