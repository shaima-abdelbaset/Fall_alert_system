import 'package:fall_detection/core/styles/colors/colors.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
    required this.patientImage,
    required this.patientName,
    required this.patientLocationImage,
    required this.date,
  });
  final String patientImage;
  final String patientName;
  final String date;
  final String patientLocationImage;
  String wrapTextAfterTwoWords(String text) {
    List<String> words = text.split(' ');
    for (int i = 2; i < words.length; i += 3) {
      words.insert(i, '\n');
    }
    return words.join(' ');
  }

  String formatDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    final DateFormat formatter = DateFormat('dd MMM yyyy'); // e.g., 28 Feb 2024
    return formatter.format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 340.h,
          width: double.infinity,
          // color: Colors.grey,
          child: Card(
            color: const Color(0xffD3E4EC),
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 32.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: AppColors.primaryColor,
                        child: CircleAvatar(
                          radius: 28.r,
                          backgroundImage: NetworkImage(
                            patientImage,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Text(
                          wrapTextAfterTwoWords(patientName),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Text(
                          formatDate(date),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(
                      //     Icons.more_horiz,
                      //     size: 28,
                      //   ),
                      // ),
                    ],
                  ),
                  verticalSpace(10),
                  SizedBox(
                    height: 150.h,
                    width: double.infinity,
                    child: Image.network(
                      patientLocationImage,
                      // height: 165.h,
                      // width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  verticalSpace(18),
                  Text(
                    'I need help in this location',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.6),
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
