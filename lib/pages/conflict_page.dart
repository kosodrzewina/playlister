import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model_extensions.dart';
import '../models.dart';

class ConflictPage extends StatelessWidget {
  final SnippetVideo oldSnippet;
  final SnippetVideo? newSnippet;

  const ConflictPage({
    required this.oldSnippet,
    required this.newSnippet,
  });

  @override
  Widget build(BuildContext context) => newSnippet != null
      ? Scaffold(
          appBar: AppBar(title: const Text('Conflict page')),
          body: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    newSnippet!.thumbnails.thumbnail,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const SizedBox(width: 20),
                          Text(
                            'Title',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 10),
                          Card(
                            elevation: 0,
                            color: Colors.orange[200],
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                Text(
                                  'OLD:',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  oldSnippet.title,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Card(
                            elevation: 0,
                            color: Colors.green[200],
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 20),
                                Text(
                                  'NEW:',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  newSnippet!.title,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const Expanded(child: SizedBox()),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                ),
                onPressed: () {},
                child: Text(
                  'ACCEPT CHANGES',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        )
      : const Center();
}

class ConflictPageRoute extends MaterialPageRoute<void> {
  ConflictPageRoute({
    required SnippetVideo oldSnippet,
    required SnippetVideo newSnippet,
  }) : super(
          builder: (context) => ConflictPage(
            oldSnippet: oldSnippet,
            newSnippet: newSnippet,
          ),
        );
}
