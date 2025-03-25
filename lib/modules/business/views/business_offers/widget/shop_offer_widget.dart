import 'package:deals_on_map/constants/colors.dart';
import 'package:deals_on_map/constants/styles.dart';
import 'package:flutter/material.dart';

class ShopOfferWidget extends StatelessWidget {
  final String imageUrl;
  final String offerDescription;
  final VoidCallback onDeletePost;
  final VoidCallback onEditPost;

  const ShopOfferWidget({
    super.key,
    required this.imageUrl,
    required this.offerDescription,
    required this.onDeletePost,
    required this.onEditPost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: greeenCFBB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageUrl,
                  width: 102,
                  height: 61,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  offerDescription,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: headingColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onDeletePost,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: mainColor),
                  ),
                  child: const Text(
                    "Delete Post",
                    style: TextStyle(
                      fontSize: 14,
                      color: mainColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: regular,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: onEditPost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                  ),
                  child: const Text(
                    "Edit Post",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: regular,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
