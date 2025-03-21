import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';

class MultiSelectDropdown<T> extends StatefulWidget {
  final String? label;
  final String hint;
  final String Function(T) itemLabel;
  final List<T> items;
  final List<T> selectedItems;
  final Function(T) onItemToggle;

  const MultiSelectDropdown({
    super.key,
    this.label,
    required this.hint,
    required this.itemLabel,
    required this.items,
    required this.selectedItems,
    required this.onItemToggle,
  });

  @override
  State<MultiSelectDropdown<T>> createState() => _MultiSelectDropdownState<T>();
}

class _MultiSelectDropdownState<T> extends State<MultiSelectDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T?>(
          buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.only(left: 0, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              )),
          isExpanded: true,
          hint: Text(
            widget.selectedItems.isEmpty
                ? widget.hint
                : widget.selectedItems.map(widget.itemLabel).join(", "),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: widget.selectedItems.isEmpty ? unselectedFontColor : Colors.black,
              fontSize: 14,
              fontFamily: regular,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          items: widget.items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  return CheckboxListTile(
                    value: widget.selectedItems.contains(item),
                    onChanged: (bool? checked) {
                      widget.onItemToggle(item);
                      menuSetState(() {});
                      setState(() {});
                    },
                    title: Text(
                      widget.itemLabel(item),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: regular,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
              ),
            );
          }).toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
