import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaBtn extends StatelessWidget {
  final Color? color;
  final String? text;
  final String iconPath;
  final VoidCallback? onTapListener;
  const SocialMediaBtn({
    super.key,
    this.color,
    this.text,
    this.onTapListener,
    required this.iconPath,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 34,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
             alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 86.w),
                Image.asset(
                  iconPath,
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 24.w),
                text == ""
                    ? const CircularProgressIndicator()
                    : Text(
                        "$text",
                        style:  TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
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
