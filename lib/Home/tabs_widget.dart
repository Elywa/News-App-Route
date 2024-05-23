import 'package:flutter/material.dart';
import 'package:news_app/Home/news_widget.dart';
import 'package:news_app/Home/tab_item.dart';
import 'package:news_app/models/source_response/source.dart';

class TabsWidget extends StatefulWidget {
  TabsWidget({super.key, required this.sources});
  List<Source> sources;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int selctedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selctedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sources
                    .map(
                      (source) => TabItem(
                        isSelected:
                            selctedIndex == widget.sources.indexOf(source),
                        name: source.name,
                      ),
                    )
                    .toList()),
            NewsView(source: widget.sources[selctedIndex])
          ],
        ));
  }
}
