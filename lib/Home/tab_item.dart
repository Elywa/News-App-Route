import 'package:flutter/material.dart';
import 'package:news_app/theme.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, this.name, required this.isSelected});
  String? name;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 40,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: MyTheme.primaryColor,
        ),
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? MyTheme.primaryColor : Colors.transparent,
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          name ?? 'UnKnown',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: isSelected ? MyTheme.whiteColor : MyTheme.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
