// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YTResponsePlaylistList _$YTResponsePlaylistListFromJson(
    Map<String, dynamic> json) {
  return YTResponsePlaylistList(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    nextPageToken: json['nextPageToken'] as String?,
    prevPageToken: json['prevPageToken'] as String?,
    pageInfo: PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    items: (json['items'] as List<dynamic>)
        .map((e) => Playlist.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$YTResponsePlaylistListToJson(
        YTResponsePlaylistList instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'pageInfo': instance.pageInfo,
      'items': instance.items,
    };

YTSearchListResponse _$YTSearchListResponseFromJson(Map<String, dynamic> json) {
  return YTSearchListResponse(
    kind: json['kind'] as String?,
    etag: json['etag'] as String,
    nextPageToken: json['nextPageToken'] as String?,
    prevPageToken: json['prevPageToken'] as String?,
    regionCode: json['regionCode'] as String,
    pageInfo: PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
    items: (json['items'] as List<dynamic>)
        .map((e) => SearchResult.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$YTSearchListResponseToJson(
        YTSearchListResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'prevPageToken': instance.prevPageToken,
      'regionCode': instance.regionCode,
      'pageInfo': instance.pageInfo,
      'items': instance.items,
    };

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return SearchResult(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    id: ID.fromJson(json['id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
    };

ID _$IDFromJson(Map<String, dynamic> json) {
  return ID(
    kind: json['kind'] as String,
    playlistId: json['playlistId'] as String?,
  );
}

Map<String, dynamic> _$IDToJson(ID instance) => <String, dynamic>{
      'kind': instance.kind,
      'playlistId': instance.playlistId,
    };

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return Playlist(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    id: json['id'] as String,
    snippet: json['snippet'] == null
        ? null
        : SnippetPlaylist.fromJson(json['snippet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
      'snippet': instance.snippet,
    };

SnippetPlaylist _$SnippetPlaylistFromJson(Map<String, dynamic> json) {
  return SnippetPlaylist(
    publishedAt: json['publishedAt'] as String,
    channelId: json['channelId'] as String?,
    title: json['title'] as String,
    description: json['description'] as String,
    thumbnails:
        ThumbnailsPlaylist.fromJson(json['thumbnails'] as Map<String, dynamic>),
    channelTitle: json['channelTitle'] as String?,
    localized: Localization.fromJson(json['localized'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SnippetPlaylistToJson(SnippetPlaylist instance) =>
    <String, dynamic>{
      'publishedAt': instance.publishedAt,
      'channelId': instance.channelId,
      'title': instance.title,
      'description': instance.description,
      'thumbnails': instance.thumbnails,
      'channelTitle': instance.channelTitle,
      'localized': instance.localized,
    };

Localization _$LocalizationFromJson(Map<String, dynamic> json) {
  return Localization(
    title: json['title'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$LocalizationToJson(Localization instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

ThumbnailsPlaylist _$ThumbnailsPlaylistFromJson(Map<String, dynamic> json) {
  return ThumbnailsPlaylist(
    default_: json['default'] == null
        ? null
        : Thumbnail.fromJson(json['default'] as Map<String, dynamic>),
    medium: json['medium'] == null
        ? null
        : Thumbnail.fromJson(json['medium'] as Map<String, dynamic>),
    high: json['high'] == null
        ? null
        : Thumbnail.fromJson(json['high'] as Map<String, dynamic>),
    standard: json['standard'] == null
        ? null
        : Thumbnail.fromJson(json['standard'] as Map<String, dynamic>),
    maxres: json['maxres'] == null
        ? null
        : Thumbnail.fromJson(json['maxres'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ThumbnailsPlaylistToJson(ThumbnailsPlaylist instance) =>
    <String, dynamic>{
      'default': instance.default_,
      'medium': instance.medium,
      'high': instance.high,
      'standard': instance.standard,
      'maxres': instance.maxres,
    };

YTResponsePlaylistItems _$YTResponsePlaylistItemsFromJson(
    Map<String, dynamic> json) {
  return YTResponsePlaylistItems(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    nextPageToken: json['nextPageToken'] as String,
    items: (json['items'] as List<dynamic>)
        .map((e) => PlaylistItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$YTResponsePlaylistItemsToJson(
        YTResponsePlaylistItems instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'nextPageToken': instance.nextPageToken,
      'items': instance.items,
    };

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) {
  return PageInfo(
    totalResults: json['totalResults'] as int,
    resultsPerPage: json['resultsPerPage'] as int,
  );
}

Map<String, dynamic> _$PageInfoToJson(PageInfo instance) => <String, dynamic>{
      'totalResults': instance.totalResults,
      'resultsPerPage': instance.resultsPerPage,
    };

PlaylistItem _$PlaylistItemFromJson(Map<String, dynamic> json) {
  return PlaylistItem(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    id: json['id'] as String,
    snippet: SnippetVideo.fromJson(json['snippet'] as Map<String, dynamic>),
    contentDetails: json['contentDetails'] == null
        ? null
        : ContentDetails.fromJson(
            json['contentDetails'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaylistItemToJson(PlaylistItem instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'etag': instance.etag,
      'id': instance.id,
      'snippet': instance.snippet,
      'contentDetails': instance.contentDetails,
      'status': instance.status,
    };

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    privacyStatus: json['privacyStatus'] as String,
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'privacyStatus': instance.privacyStatus,
    };

ContentDetails _$ContentDetailsFromJson(Map<String, dynamic> json) {
  return ContentDetails(
    videoId: json['videoId'] as String,
    startAt: json['startAt'] as String,
    endAt: json['endAt'] as String,
    note: json['note'] as String,
    videoPublishedAt: DateTime.parse(json['videoPublishedAt'] as String),
  );
}

Map<String, dynamic> _$ContentDetailsToJson(ContentDetails instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'note': instance.note,
      'videoPublishedAt': instance.videoPublishedAt.toIso8601String(),
    };

SnippetVideo _$SnippetVideoFromJson(Map<String, dynamic> json) {
  return SnippetVideo(
    publishedAt: json['publishedAt'] as String,
    channelId: json['channelId'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    thumbnails:
        ThumbnailsVideo.fromJson(json['thumbnails'] as Map<String, dynamic>),
    channelTitle: json['channelTitle'] as String,
    playlistId: json['playlistId'] as String,
    position: json['position'] as int,
    resourceId: ResourceId.fromJson(json['resourceId'] as Map<String, dynamic>),
    videoOwnerChannelTitle: json['videoOwnerChannelTitle'] as String,
    videoOwnerChannelId: json['videoOwnerChannelId'] as String,
  );
}

Map<String, dynamic> _$SnippetVideoToJson(SnippetVideo instance) =>
    <String, dynamic>{
      'publishedAt': instance.publishedAt,
      'channelId': instance.channelId,
      'title': instance.title,
      'description': instance.description,
      'thumbnails': instance.thumbnails,
      'channelTitle': instance.channelTitle,
      'playlistId': instance.playlistId,
      'position': instance.position,
      'resourceId': instance.resourceId,
      'videoOwnerChannelTitle': instance.videoOwnerChannelTitle,
      'videoOwnerChannelId': instance.videoOwnerChannelId,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) {
  return Thumbnail(
    url: json['url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

ThumbnailsVideo _$ThumbnailsVideoFromJson(Map<String, dynamic> json) {
  return ThumbnailsVideo(
    default_: Thumbnail.fromJson(json['default'] as Map<String, dynamic>),
    medium: Thumbnail.fromJson(json['medium'] as Map<String, dynamic>),
    high: Thumbnail.fromJson(json['high'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ThumbnailsVideoToJson(ThumbnailsVideo instance) =>
    <String, dynamic>{
      'default': instance.default_,
      'medium': instance.medium,
      'high': instance.high,
    };

ResourceId _$ResourceIdFromJson(Map<String, dynamic> json) {
  return ResourceId(
    kind: json['kind'] as String,
    videoId: json['videoId'] as String,
  );
}

Map<String, dynamic> _$ResourceIdToJson(ResourceId instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'videoId': instance.videoId,
    };
