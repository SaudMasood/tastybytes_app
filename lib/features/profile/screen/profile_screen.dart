import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),

      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileEdit) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Edit Profile')),
            );
          }

          if (state is ProfileLogoutSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Logged out successfully')),
            );
          }
        },

        child: Scaffold(
          backgroundColor: AppColors.lightGrey,

          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25.r),
                ),
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColors.white,
                      child: Icon(
                        Icons.person,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'My Profile 👤',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


          body: ListView(
            padding: EdgeInsets.all(20.w),
            children: [
              SizedBox(height: 10.h),

              const CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.yellow,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: AppColors.white,
                ),
              ),

              SizedBox(height: 15.h),

              Center(
                child: Text(
                  'Saud Masood',
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Center(
                child: Text(
                  'saud@example.com',
                  style: TextStyle(
                    color: AppColors.grey,
                  ),
                ),
              ),

              SizedBox(height: 25.h),

              ListTile(
                tileColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                leading: const Icon(Icons.person),
                title: const Text('Edit Profile'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.read<ProfileBloc>().add(
                    EditProfileEvent(),
                  );
                },
              ),

              SizedBox(height: 10.h),

              ListTile(
                tileColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                leading: const Icon(Icons.history),
                title: const Text('Order History'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),

              SizedBox(height: 10.h),

              ListTile(
                tileColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                leading: const Icon(Icons.location_on),
                title: const Text('My Address'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),

              SizedBox(height: 10.h),

              ListTile(
                tileColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                leading: Icon(
                  Icons.logout,
                  color: AppColors.error,
                ),
                title: const Text('Logout'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.read<ProfileBloc>().add(
                    LogoutEvent(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}