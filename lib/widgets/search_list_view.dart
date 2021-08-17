import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';
import '../l10n/l10n.dart';
import '../models.dart';
import '../repositories/youtube_repository.dart';
import 'playlists_list_item.dart';

class SearchListView extends StatefulWidget {
  final String? searchTerm;

  const SearchListView({required this.searchTerm, Key? key}) : super(key: key);

  @override
  _SearchListViewState createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  static const _pageSize = 10;
  final PagingController<String?, Playlist> _pagingController =
      PagingController(firstPageKey: null);

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Future<void> _fetchPage(String? pageKey) async {
    final searchTerm = widget.searchTerm;
    if (searchTerm == null) {
      return;
    }

    final fetched = await context
        .read<YoutubeRepository>()
        .searchedPlaylistsPage(searchTerm, _pageSize, nextPageToken: pageKey);

    if (fetched == null) {
      return;
    }

    final newItems = fetched.item1;
    final nextPageToken = fetched.item2;

    if (nextPageToken == null) {
      _pagingController.appendLastPage(newItems);
    } else {
      _pagingController.appendPage(newItems, nextPageToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.searchTerm == null) {
      // TODO: keyboard should not push away the svg
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.search.svg(
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 10),
            Text(L10n.of(context)!.searchPage_readyToSearch),
          ],
        ),
      );
    }

    return PagedListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      pagingController: _pagingController,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      builderDelegate: PagedChildBuilderDelegate<Playlist>(
        itemBuilder: (context, item, index) => PlaylistsListItem(
          snippet: item.snippet!,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
