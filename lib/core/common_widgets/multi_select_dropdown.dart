import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MultiSelectDropdown<T> extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T?>(
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(left: 0, right: 14),
          ),
          isExpanded: true,
          hint: Text(
            selectedItems.isEmpty
                ? hint
                : selectedItems.map(itemLabel).join(", "),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: CheckboxListTile(
                value: selectedItems.contains(item),
                onChanged: (bool? checked) {
                  onItemToggle(item);
                },
                title: Text(itemLabel(item)),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            );
          }).toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
