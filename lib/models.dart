import 'package:json_annotation/json_annotation.dart';

export 'model_extensions.dart';

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
class YTSearchListResponse {
  final String? kind;
  final String etag;
  final String? nextPageToken;
  final String? prevPageToken;
  final String regionCode;
  final PageInfo pageInfo;
  final List<SearchResult> items;

  const YTSearchListResponse({
    this.kind,
    required this.etag,
    this.nextPageToken,
    this.prevPageToken,
    required this.regionCode,
    required this.pageInfo,
    required this.items,
  });

  factory YTSearchListResponse.fromJson(Map<String, dynamic> json) =>
      _$YTSearchListResponseFromJson(json);
}

@JsonSerializable()
class SearchResult {
  final String kind;
  final String etag;
  final ID id;

  const SearchResult({
    required this.kind,
    required this.etag,
    required this.id,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}

@JsonSerializable()
class ID {
  final String kind;
  final String? playlistId;

  const ID({
    required this.kind,
    this.playlistId,
  });

  factory ID.fromJson(Map<String, dynamic> json) => _$IDFromJson(json);
}

@JsonSerializable()
class Playlist {
  final String kind;
  final String etag;
  final String id;
  final SnippetPlaylist? snippet;
  List<PlaylistItem>? items;

  Playlist({
    required this.kind,
    required this.etag,
    required this.id,
    this.snippet,
    this.items,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}

class Snippet {
  final String title;
  final Thumbnails thumbnails;

  const Snippet({
    required this.title,
    required this.thumbnails,
  });
}

@JsonSerializable()
class SnippetPlaylist extends Snippet {
  final String publishedAt;
  final String? channelId;
  final String description;
  final String? channelTitle;
  final Localization localized;

  const SnippetPlaylist({
    required this.publishedAt,
    this.channelId,
    required String title,
    required this.description,
    required Thumbnails thumbnails,
    this.channelTitle,
    required this.localized,
  }) : super(title: title, thumbnails: thumbnails);

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
class Thumbnails {
  @JsonKey(name: 'default')
  // ignore: non_constant_identifier_names
  final Thumbnail? default_;
  final Thumbnail? medium;
  final Thumbnail? high;
  final Thumbnail? standard;
  final Thumbnail? maxres;

  const Thumbnails({
    // ignore: non_constant_identifier_names
    this.default_,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailsToJson(this);
}

@JsonSerializable()
class YTResponsePlaylistItems {
  final String kind;
  final String etag;
  final String? nextPageToken;
  final String? prevPageToken;
  final List<PlaylistItem> items;

  const YTResponsePlaylistItems({
    required this.kind,
    required this.etag,
    this.nextPageToken,
    this.prevPageToken,
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

  Map<String, dynamic> toJson() => _$PlaylistItemToJson(this);
}

@JsonSerializable()
class Status {
  final String privacyStatus;

  const Status({
    required this.privacyStatus,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
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

  Map<String, dynamic> toJson() => _$ContentDetailsToJson(this);
}

@JsonSerializable()
class SnippetVideo extends Snippet {
  final String publishedAt;
  final String channelId;
  final String description;
  final String channelTitle;
  final String playlistId;
  final int position;
  final ResourceId resourceId;
  final String? videoOwnerChannelTitle;
  final String? videoOwnerChannelId;

  const SnippetVideo({
    required this.publishedAt,
    required this.channelId,
    required String title,
    required this.description,
    required Thumbnails thumbnails,
    required this.channelTitle,
    required this.playlistId,
    required this.position,
    required this.resourceId,
    this.videoOwnerChannelTitle,
    this.videoOwnerChannelId,
  }) : super(title: title, thumbnails: thumbnails);

  factory SnippetVideo.fromJson(Map<String, dynamic> json) =>
      _$SnippetVideoFromJson(json);

  Map<String, dynamic> toJson() => _$SnippetVideoToJson(this);
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
class ResourceId {
  final String kind;
  final String videoId;

  const ResourceId({
    required this.kind,
    required this.videoId,
  });

  factory ResourceId.fromJson(Map<String, dynamic> json) =>
      _$ResourceIdFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceIdToJson(this);
}
