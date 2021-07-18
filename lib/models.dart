import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class YTResponsePlaylistItems {
  final String kind;
  final String etag;
  final String nextPageToken;
  final List<PlaylistItem> items;

  const YTResponsePlaylistItems({
    required this.kind,
    required this.etag,
    required this.nextPageToken,
    required this.items,
  });

  factory YTResponsePlaylistItems.fromJson(Map<String, dynamic> json) =>
      _$YTResponsePlaylistItemsFromJson(json);
}

@JsonSerializable()
class PageInfo {
  final int totalResults;
  final int resultsPerPAge;

  const PageInfo({
    required this.totalResults,
    required this.resultsPerPAge,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) =>
      _$PageInfoFromJson(json);
}

@JsonSerializable()
class PlaylistItem {
  final String kind;
  final String etag;
  final String id;
  final Snippet snippet;
  final ContentDetails? contentDetails;
  final Status? status;

  const PlaylistItem({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
    required this.contentDetails,
    required this.status,
  });

  factory PlaylistItem.fromJson(Map<String, dynamic> json) =>
      _$PlaylistItemFromJson(json);
}

@JsonSerializable()
class Status {
  final String privacyStatus;

  const Status({
    required this.privacyStatus,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}

@JsonSerializable()
class ContentDetails {
  final String videoId;
  final String startAt;
  final String endAt;
  final String note;
  final DateTime videoPublishedAt;

  const ContentDetails({
    required this.videoId,
    required this.startAt,
    required this.endAt,
    required this.note,
    required this.videoPublishedAt,
  });

  factory ContentDetails.fromJson(Map<String, dynamic> json) =>
      _$ContentDetailsFromJson(json);
}

@JsonSerializable()
class Snippet {
  final String publishedAt;
  final String channelId;
  final String title;
  final String description;
  final Thumbnails thumbnails;
  final String channelTitle;
  final String playlistId;
  final int position;
  final ResourceId resourceId;
  final String videoOwnerChannelTitle;
  final String videoOwnerChannelId;

  const Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.playlistId,
    required this.position,
    required this.resourceId,
    required this.videoOwnerChannelTitle,
    required this.videoOwnerChannelId,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) =>
      _$SnippetFromJson(json);
}

@JsonSerializable()
class Thumbnail {
  final String url;
  final int width;
  final int height;

  const Thumbnail({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
}

@JsonSerializable()
class Thumbnails {
  @JsonKey(name: 'default')
  // ignore: non_constant_identifier_names
  final Thumbnail default_;
  final Thumbnail medium;
  final Thumbnail high;

  const Thumbnails({
    // ignore: non_constant_identifier_names
    required this.default_,
    required this.medium,
    required this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsFromJson(json);
}

@JsonSerializable()
class ResourceId {
  final String kind;
  final String videoId;

  const ResourceId({
    required this.kind,
    required this.videoId,
  });

  factory ResourceId.fromJson(Map<String, dynamic> json) =>
      _$ResourceIdFromJson(json);
}
