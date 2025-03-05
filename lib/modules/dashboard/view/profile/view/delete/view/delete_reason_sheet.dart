import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:deals_on_map/core/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DeleteReasonSheet {
  static show(BuildContext context) async {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.80,
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: Text(
                      'Please Select Reason To Delete Account?',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: fontColor, fontFamily: regular),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: List.generate(_deleteReasons.length, (index) {
                  //bool isSelected = reasonProvider.selectedReason == index;
                  return GestureDetector(
                    onTap: () {
                      /*if (isSelected) {
                          reasonProvider.resetSelection();
                        } else {
                          reasonProvider.selectReason(index);
                        }*/
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _deleteReasons[index],
                              style: const TextStyle(fontSize: 14, color: secondaryFontColor, fontWeight: FontWeight.w400, fontFamily: regular),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 1,
                              ),
                            ),
                            width: 25,
                            height: 25,
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              CustomButton(
                buttonName: 'Submit',
                onPressed: () {
                  /*if (selectedIndex != -1) {
                      String deleteReason = _deleteReasons[selectedIndex];
                      */ /*reasonProvider.deleteAccount(deleteReason).then((_) {
                        Navigator.pop(context);
                      });*/ /*
                    }*/
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

final List<String> _deleteReasons = ["I’ve Got no offers from Driver", "Driver is too far away", "Price is too high", "Change of plans", "Found another ride", "Other reasons"];
