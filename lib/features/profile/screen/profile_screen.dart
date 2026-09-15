import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              const SnackBar(
                content: Text('Edit Profile'),
              ),
            );
          }

          if (state is ProfileLogoutSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Logged out successfully'),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
            elevation: 0,
            centerTitle: false,
            titleSpacing: 16.w,
            title: Row(
              children: [
                Container(
                  width: 42.w,
                  height: 42.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.amber.shade800,
                    size: 23.sp,
                  ),
                ),

                SizedBox(width: 10.w),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Account',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'My Profile 👤',
                      style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                SizedBox(height: 15.h),

                Center(
                  child: CircleAvatar(
                    radius: 55.r,
                    backgroundColor: Colors.amber,
                    child: Icon(
                      Icons.person,
                      size: 65.sp,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                Center(
                  child: Text(
                    'Saud Masood',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 5.h),

                Center(
                  child: Text(
                    'saud@example.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                _profileItem(
                  context,
                  icon: Icons.person,
                  title: 'Edit Profile',
                  onTap: () {
                    context.read<ProfileBloc>().add(
                      EditProfileEvent(),
                    );
                  },
                ),

                _profileItem(
                  context,
                  icon: Icons.history,
                  title: 'Order History',
                  onTap: () {},
                ),

                _profileItem(
                  context,
                  icon: Icons.location_on,
                  title: 'My Address',
                  onTap: () {},
                ),

                _profileItem(
                  context,
                  icon: Icons.logout,
                  title: 'Logout',
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
      ),
    );
  }

  Widget _profileItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 5.h,
        ),
        leading: Container(
          width: 42.w,
          height: 42.h,
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            icon,
            size: 22.sp,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16.sp,
        ),
        onTap: onTap,
      ),
    );
  }
}