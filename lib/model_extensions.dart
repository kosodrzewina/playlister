import 'models.dart';

extension Thumbnail on Thumbnails {
  String get thumbnail => default_?.url ?? standard?.url ?? '';
}
