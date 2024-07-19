import 'package:dio/dio.dart';
import 'package:fall_detection/core/common/cubit/app_cubit/app_cubit.dart';
import 'package:fall_detection/core/routes/app_route.dart';
import 'package:fall_detection/core/routes/routes.dart';
import 'package:fall_detection/feature/auth/presentation/Manger/Cubits/AuthCubit/Auth_Cubit.dart';
import 'package:fall_detection/feature/messages/presentation/Manger/Cubits/MessagesCubit/MessagesCubit.dart';
import 'package:fall_detection/feature/notification/presentation/manger/cubits/notificationsCubit.dart';
import 'package:fall_detection/feature/patient/presentation/manger/PatientCubits/PatientCubits.dart';
import 'package:fall_detection/pusher_notiifcation_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

import 'core/services/network/api/dio_consumer.dart';
import 'feature/auth/data/logic/activate_cubit/activate_cubit.dart';
import 'feature/home/data/logic/home_cubit/home_cubit.dart';
import 'feature/profile/presenation/Manger/Cubits/UserCubit/UserCupit.dart';

class FallDetectionApp extends StatefulWidget {
  const FallDetectionApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<FallDetectionApp> createState() => _FallDetectionAppState();
}

class _FallDetectionAppState extends State<FallDetectionApp> {
  final PusherService _pusherService = PusherService();

  @override
  void initState() {
    super.initState();
    _pusherService.initPusher();
  }

  @override
  void dispose() {
    _pusherService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider<PatientCubit>(
          create: (context) => PatientCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider<ChatCubit>(
          create: (context) => ChatCubit(DioConsumer(dio: Dio())),
        ),
     //   BlocProvider<NotificationsCubit>(
       //   create: (context) => NotificationsCubit(DioConsumer(dio: Dio())),
        //),
        BlocProvider(
          create: (context) => HomeCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider<ActivateUserCubit>(
          create: (context) => ActivateUserCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(DioConsumer(dio: Dio())),
        ),

      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        // splitScreenMode: true,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splashScreen,
            onGenerateRoute: widget.appRouter.generateRoute,
            // home: ChatView(),
          ),
        ),
      ),
    );
  }
}
