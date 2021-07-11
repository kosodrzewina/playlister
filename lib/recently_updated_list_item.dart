import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentlyUpdatedListItem extends StatelessWidget {
  final String text;
  final Color color;

  const RecentlyUpdatedListItem({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(
            15,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
