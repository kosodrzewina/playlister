import 'models.dart';

export 'models.dart';

extension Thumbnail on ThumbnailsPlaylist {
  String get thumbnail => default_?.url ?? standard?.url ?? '';
}
