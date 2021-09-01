import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../model_extensions.dart';
import '../models.dart';

class PlaylistsListItem extends StatelessWidget {
  final SnippetPlaylist snippet;
  final Icon? icon;
  final Function()? onTap;
  final Function()? onTapIcon;

  const PlaylistsListItem({
    Key? key,
    required this.snippet,
    this.icon,
    this.onTap,
    this.onTapIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            15,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    snippet.thumbnails.thumbnail,
                    errorBuilder: (context, err, st) =>
                        Assets.images.noThumbnail.image(
                      fit: BoxFit.cover,
                      width: 62,
                      height: 50,
                    ),
                    fit: BoxFit.cover,
                    width: 62,
                    height: 50,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    snippet.title,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
                if (icon != null)
                  Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: onTapIcon,
                      child: icon,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
