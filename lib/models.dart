import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class YTResponsePlaylistList {
  final String kind;
  final String etag;
  final String? nextPageToken;
  final String? prevPageToken;
  final PageInfo pageInfo;
  final List<Playlist> items;

  const YTResponsePlaylistList({
    required this.kind,
    required this.etag,
    this.nextPageToken,
    this.prevPageToken,
    required this.pageInfo,
    required this.items,
  });

  factory YTResponsePlaylistList.fromJson(Map<String, dynamic> json) =>
      _$YTResponsePlaylistListFromJson(json);

  Map<String, dynamic> toJson() => _$YTResponsePlaylistListToJson(this);
}

@JsonSerializable()
class Playlist {
  final String kind;
  final String etag;
  final String id;
  final SnippetPlaylist? snippet;

  const Playlist({
    required this.kind,
    required this.etag,
    required this.id,
    this.snippet,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}

@JsonSerializable()
class SnippetPlaylist {
  final String publishedAt;
  final String channelId;
  final String title;
  final String description;
  final ThumbnailsPlaylist thumbnails;
  final String channelTitle;
  final Localization localized;

  const SnippetPlaylist({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.localized,
  });

  factory SnippetPlaylist.fromJson(Map<String, dynamic> json) =>
      _$SnippetPlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$SnippetPlaylistToJson(this);
}

@JsonSerializable()
class Localization {
  final String title;
  final String description;

  const Localization({
    required this.title,
    required this.description,
  });

  factory Localization.fromJson(Map<String, dynamic> json) =>
      _$LocalizationFromJson(json);

  Map<String, dynamic> toJson() => _$LocalizationToJson(this);
}

@JsonSerializable()
class ThumbnailsPlaylist {
  @JsonKey(name: 'default')
  // ignore: non_constant_identifier_names
  final Thumbnail default_;
  final Thumbnail medium;
  final Thumbnail high;
  final Thumbnail standard;
  final Thumbnail maxres;

  const ThumbnailsPlaylist({
    // ignore: non_constant_identifier_names
    required this.default_,
    required this.medium,
    required this.high,
    required this.standard,
    required this.maxres,
  });

  factory ThumbnailsPlaylist.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsPlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailsPlaylistToJson(this);
}

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
  final int resultsPerPage;

  const PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) =>
      _$PageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PageInfoToJson(this);
}

@JsonSerializable()
class PlaylistItem {
  final String kind;
  final String etag;
  final String id;
  final SnippetVideo snippet;
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
class SnippetVideo {
  final String publishedAt;
  final String channelId;
  final String title;
  final String description;
  final ThumbnailsVideo thumbnails;
  final String channelTitle;
  final String playlistId;
  final int position;
  final ResourceId resourceId;
  final String videoOwnerChannelTitle;
  final String videoOwnerChannelId;

  const SnippetVideo({
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

  factory SnippetVideo.fromJson(Map<String, dynamic> json) =>
      _$SnippetVideoFromJson(json);
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

  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

@JsonSerializable()
class ThumbnailsVideo {
  @JsonKey(name: 'default')
  // ignore: non_constant_identifier_names
  final Thumbnail default_;
  final Thumbnail medium;
  final Thumbnail high;

  const ThumbnailsVideo({
    // ignore: non_constant_identifier_names
    required this.default_,
    required this.medium,
    required this.high,
  });

  factory ThumbnailsVideo.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsVideoFromJson(json);
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
