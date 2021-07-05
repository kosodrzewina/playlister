import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:playlister/models.dart';

void main() {
  group('Models', () {
    final key = Platform.environment['API_KEY']!;

    test('Deserialization of YouTube API response', () async {
      final res = await get(Uri.parse(
          'https://content-youtube.googleapis.com/youtube/v3/playlistItems?playlistId=PLZJ2yOBfQ1hr3wacUOgHhY_ZFZ2ujxAEo&part=snippet&key=$key'));
      YTResponse.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
    });
  });
}
