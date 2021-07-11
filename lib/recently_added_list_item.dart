import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentlyAddedListItem extends StatelessWidget {
  final String text;
  final Color color;

  const RecentlyAddedListItem({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[800],
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
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  height: 25,
                  width: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
