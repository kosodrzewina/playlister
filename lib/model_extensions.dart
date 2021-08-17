import 'models.dart';

extension Thumbnail on ThumbnailsPlaylist {
  String get thumbnail => default_?.url ?? standard?.url ?? '';
}
