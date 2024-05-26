
import 'package:flutter/material.dart';
import 'package:news_app/Home/tabs_widget.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/category/category_model.dart';
import 'package:news_app/models/source_response/resource_response.dart';

import 'package:news_app/theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routeName = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    CategoryModel categoryModel =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: MyTheme.whiteColor,
          ),
          child: Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
            automaticallyImplyLeading: false,
            title: Text(
              categoryModel.name,
            ),
          ),
          body: FutureBuilder<SourceResponse?>(
            future: ApiManager.getSources(categoryModel.id),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: MyTheme.primaryColor,
                  ),
                );
              } else if (snapShot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Something went wrong',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: IconButton(
                        onPressed: () {
                          ApiManager.getSources(categoryModel.id);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.refresh,
                          size: 35,
                          color: MyTheme.primaryColor,
                        ),
                      ),
                    )
                  ],
                );
              } else if (snapShot.data!.status != 'ok') {
                return Center(
                  child: Text(
                    snapShot.data?.message ?? 'Server error',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }

              var sources = snapShot.data?.sources ?? [];

              return TabsWidget(sources: sources);
            },
          ),
        ),
      ],
    );
  }
}
