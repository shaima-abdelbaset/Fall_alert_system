import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/core/routes/routes.dart';
import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/styles/images/assets.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/home/presenation/widgets/circle_avater_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewPatient extends StatelessWidget {
  const ListViewPatient({
    super.key,
    required this.imagePatient,
    required this.patientName,
    required this.itemCount,
  });
  final String imagePatient;
  final String patientName;
  // int index;
  // BuildContext context;
  // Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  String wrapTextAfterTwoWords(String text) {
    List<String> words = text.split(' ');
    for (int i = 2; i < words.length; i += 3) {
      words.insert(i, '\n');
    }
    return words.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100.h,
          width: 240.w,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            // ImageContainer(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: AppColors.primaryColor,
                    child: CircleAvatar(
                      radius: 28.r,
                      backgroundImage: NetworkImage(
                        imagePatient,
                      ),
                    ),
                  ),
                  Text(
                    wrapTextAfterTwoWords(patientName),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        horizontalSpace(25),
        Column(
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.all(
                  Radius.circular(60.r),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  context.pushName(Routes.mapScreen);
                },
                icon: const Icon(
                  Icons.map,
                ),
              ),
            ),
            const Text(
              'Map',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    );
  }
}
