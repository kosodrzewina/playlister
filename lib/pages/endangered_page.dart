import 'package:flutter/cupertino.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';

class EndangeredPage extends StatelessWidget {
  const EndangeredPage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.secure.svg(
            height: 250,
            width: 250,
          ),
          const SizedBox(height: 10),
          Text(
            L10n.of(context)!.endangeredPage_noDeletedVideosDetected,
          ),
        ],
      ),
    );
  }
}
