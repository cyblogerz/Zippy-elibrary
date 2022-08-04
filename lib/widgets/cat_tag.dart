import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CatTag extends StatelessWidget {
  final Color color;
  final String tag;
  const CatTag({Key? key, required this.color, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: color,
        shadowColor: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          child: Text(
            maxLines: 1,
            textWidthBasis: TextWidthBasis.longestLine,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            '$tag',
            style: TextStyle(
                //  softWrap: false,
                // overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
        ),
        elevation: 20.0,
      ),
    );
  }
}
