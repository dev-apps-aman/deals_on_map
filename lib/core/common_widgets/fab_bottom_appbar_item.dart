import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/modules/dashboard/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FABBottomAppBarItem {
  final String unselectedImage;
  final String selectedImage;
  final String label;

  FABBottomAppBarItem({
    required this.unselectedImage,
    required this.selectedImage,
    required this.label,
  });
}

class FABBottomAppBar extends StatefulWidget {
  final List<FABBottomAppBarItem>? items;
  final String? centerItemText;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;

  FABBottomAppBar({
    super.key,
    this.items,
    this.centerItemText,
    this.height = 42.0,
    this.iconSize = 20.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
  }) {
    assert(items!.length == 2 || items!.length == 5);
  }

  @override
  State<FABBottomAppBar> createState() => _FABBottomAppBarState();
}

class _FABBottomAppBarState extends State<FABBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      List<Widget> items = List.generate(widget.items!.length, (int index) {
        return _buildTabItem(
          item: widget.items![index],
          index: index,
          onPressed: (index) {
            provider.onItemTapped(index);
          },
          isSelected: provider.selectedIndex == index,
        );
      });
      return BottomAppBar(
        surfaceTintColor: widget.backgroundColor,
        color: Colors.white,
        shadowColor: Colors.white,
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: const BoxDecoration(border: Border(top: BorderSide(color: brdColor, width: 1))),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        ),
      );
    });
  }

  Widget _buildTabItem({
    FABBottomAppBarItem? item,
    int? index,
    required ValueChanged<int> onPressed,
    bool isSelected = false,
  }) {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index!),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  isSelected ? item!.selectedImage : item!.unselectedImage,
                  width: 24.0,
                  height: 24.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: TextStyle(
                    color: isSelected ? mainColor : unselectedFontColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
