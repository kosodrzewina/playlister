// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
    resultsPerPAge: json['resultsPerPAge'] as int,
  );
}

Map<String, dynamic> _$PageInfoToJson(PageInfo instance) => <String, dynamic>{
      'totalResults': instance.totalResults,
      'resultsPerPAge': instance.resultsPerPAge,
    };

PlaylistItem _$PlaylistItemFromJson(Map<String, dynamic> json) {
  return PlaylistItem(
    kind: json['kind'] as String,
    etag: json['etag'] as String,
    id: json['id'] as String,
    snippet: Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
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

Snippet _$SnippetFromJson(Map<String, dynamic> json) {
  return Snippet(
    publishedAt: json['publishedAt'] as String,
    channelId: json['channelId'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    thumbnails: Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
    channelTitle: json['channelTitle'] as String,
    playlistId: json['playlistId'] as String,
    position: json['position'] as int,
    resourceId: ResourceId.fromJson(json['resourceId'] as Map<String, dynamic>),
    videoOwnerChannelTitle: json['videoOwnerChannelTitle'] as String,
    videoOwnerChannelId: json['videoOwnerChannelId'] as String,
  );
}

Map<String, dynamic> _$SnippetToJson(Snippet instance) => <String, dynamic>{
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

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) {
  return Thumbnails(
    default_: Thumbnail.fromJson(json['default'] as Map<String, dynamic>),
    medium: Thumbnail.fromJson(json['medium'] as Map<String, dynamic>),
    high: Thumbnail.fromJson(json['high'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ThumbnailsToJson(Thumbnails instance) =>
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
