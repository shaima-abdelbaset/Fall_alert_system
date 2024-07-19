import 'package:fall_detection/core/extensions/context_extension.dart';
import 'package:fall_detection/core/styles/images/assets.dart';
import 'package:fall_detection/core/utils/spacing.dart';
import 'package:fall_detection/feature/profile/data/Models/UserModel.dart';
import 'package:fall_detection/feature/profile/presenation/Manger/Cubits/UserCubit/UserCupit.dart';
import 'package:fall_detection/feature/profile/presenation/Manger/Cubits/UserCubit/UserStates.dart';
import 'package:fall_detection/feature/profile/presenation/widgets/row_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/edit_profile_column.dart';

class EditProfileDialge extends StatefulWidget {
  const EditProfileDialge({
    super.key,
  });

  @override
  State<EditProfileDialge> createState() => _EditProfileDialgeState();
}

class _EditProfileDialgeState extends State<EditProfileDialge> {
  final ImagePicker _picker = ImagePicker();

  XFile? _selectedImage;

  void _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _selectedImage = pickedFile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is ProfileUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Profile updated successfully!'),
          ));
        } else if (state is ProfileUpdateError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
        }
      },
      builder: (context, state) {
        return state is ProfileUpdating
            ? const Center(child: CircularProgressIndicator())
            : Dialog(
                backgroundColor: Colors.transparent,
                child: SingleChildScrollView(
                  child: Container(
                    width: context.width * 0.9,
                    height: context.height * 0.9,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                },
                                child: Container(
                                  width: context.width * 0.39,
                                  height: context.height * 0.39,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4, color: Colors.blue),
                                    shape: BoxShape.circle,
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/patientfall.png'),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: context.height * 0.24,
                                left: context.width * 0.26,
                                child: GestureDetector(
                                  onTap: () {
                                    _pickImage(ImageSource.camera);
                                  },
                                  child: Container(
                                    width: context.width * 0.1,
                                    height: context.height * 0.034,
                                    color: const Color(0xff00A9FF),
                                    child: Image.asset(
                                        'assets/images/🦆 icon _camera_.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(5),
                        editProfileColumn(
                          Controller: context.read<UserCubit>().nameController,
                          text: 'name',
                          icon: Icons.perm_identity,
                        ),
                        verticalSpace(20),
                        editProfileColumn(
                          Controller: context.read<UserCubit>().phoneController,
                          text: 'phone',
                          icon: Icons.phone,
                        ),
                        verticalSpace(20),
                        editProfileColumn(
                          Controller:
                              context.read<UserCubit>().genderController,
                          text: 'gender',
                          icon: Icons.female_outlined,
                        ),
                        verticalSpace(70),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<UserCubit>()
                                  .updateProfile(photo: _selectedImage);
                            },
                            child: Container(
                              width: context.width * 0.5,
                              height: context.height * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xff00A9FF),
                                boxShadow: const [
                                  BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    color: Colors.black,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset(1, 4),
                                  ),
                                ],
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
