// FILE GENERATED AUTOMATICALLY, TO NOT EDIT BY HAND
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

abstract class L10nStrings {
  static const bottomNavBar_search = 'bottomNavBar_search';
  static const bottomNavBar_playlists = 'bottomNavBar_playlists';
  static const bottomNavBar_endangered = 'bottomNavBar_endangered';
  static const profileDialog_loggedInAs = 'profileDialog_loggedInAs';
  static const profileDialog_notLoggedIn = 'profileDialog_notLoggedIn';
  static const profileDialog_logIn = 'profileDialog_logIn';
  static const profileDialog_logOut = 'profileDialog_logOut';
  static const profileDialog_enterApiKey = 'profileDialog_enterApiKey';
  static const profileDialog_help = 'profileDialog_help';
  static const apiKeyDialog_apiKey = 'apiKeyDialog_apiKey';
  static const apiKeyDialog_apiKeyRemoved = 'apiKeyDialog_apiKeyRemoved';
  static const apiKeyDialog_apiKeyIsSaved = 'apiKeyDialog_apiKeyIsSaved';
  static const apiKeyDialog_apiKeyIsNotSaved = 'apiKeyDialog_apiKeyIsNotSaved';
  static const apiKeyDialog_removeApiKey = 'apiKeyDialog_removeApiKey';
  static const apiKeyDialog_apiKeySaved = 'apiKeyDialog_apiKeySaved';
  static const noPlaylistsFound = 'noPlaylistsFound';
  static const searchPage_addByChannelId = 'searchPage_addByChannelId';
  static const channelIdDialog_channelId = 'channelIdDialog_channelId';
  static const endangeredPage_noDeletedVideosDetected = 'endangeredPage_noDeletedVideosDetected';
  static const error_fetchingPlaylists = 'error_fetchingPlaylists';
  static const error_noInternet = 'error_noInternet';
  static const error_unknown = 'error_unknown';
}

extension L10nFromString on String {
  String tr(BuildContext context) {
    switch (this) {
      case L10nStrings.bottomNavBar_search:
        return L10n.of(context)!.bottomNavBar_search;
      case L10nStrings.bottomNavBar_playlists:
        return L10n.of(context)!.bottomNavBar_playlists;
      case L10nStrings.bottomNavBar_endangered:
        return L10n.of(context)!.bottomNavBar_endangered;
      case L10nStrings.profileDialog_loggedInAs:
        return L10n.of(context)!.profileDialog_loggedInAs;
      case L10nStrings.profileDialog_notLoggedIn:
        return L10n.of(context)!.profileDialog_notLoggedIn;
      case L10nStrings.profileDialog_logIn:
        return L10n.of(context)!.profileDialog_logIn;
      case L10nStrings.profileDialog_logOut:
        return L10n.of(context)!.profileDialog_logOut;
      case L10nStrings.profileDialog_enterApiKey:
        return L10n.of(context)!.profileDialog_enterApiKey;
      case L10nStrings.profileDialog_help:
        return L10n.of(context)!.profileDialog_help;
      case L10nStrings.apiKeyDialog_apiKey:
        return L10n.of(context)!.apiKeyDialog_apiKey;
      case L10nStrings.apiKeyDialog_apiKeyRemoved:
        return L10n.of(context)!.apiKeyDialog_apiKeyRemoved;
      case L10nStrings.apiKeyDialog_apiKeyIsSaved:
        return L10n.of(context)!.apiKeyDialog_apiKeyIsSaved;
      case L10nStrings.apiKeyDialog_apiKeyIsNotSaved:
        return L10n.of(context)!.apiKeyDialog_apiKeyIsNotSaved;
      case L10nStrings.apiKeyDialog_removeApiKey:
        return L10n.of(context)!.apiKeyDialog_removeApiKey;
      case L10nStrings.apiKeyDialog_apiKeySaved:
        return L10n.of(context)!.apiKeyDialog_apiKeySaved;
      case L10nStrings.noPlaylistsFound:
        return L10n.of(context)!.noPlaylistsFound;
      case L10nStrings.searchPage_addByChannelId:
        return L10n.of(context)!.searchPage_addByChannelId;
      case L10nStrings.channelIdDialog_channelId:
        return L10n.of(context)!.channelIdDialog_channelId;
      case L10nStrings.endangeredPage_noDeletedVideosDetected:
        return L10n.of(context)!.endangeredPage_noDeletedVideosDetected;
      case L10nStrings.error_fetchingPlaylists:
        return L10n.of(context)!.error_fetchingPlaylists;
      case L10nStrings.error_noInternet:
        return L10n.of(context)!.error_noInternet;
      case L10nStrings.error_unknown:
        return L10n.of(context)!.error_unknown;

      default:
        return this;
    }
  }
}
