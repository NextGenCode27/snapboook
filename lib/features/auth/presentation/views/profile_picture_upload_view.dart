import 'package:flutter/material.dart';
import 'package:snapbook/features/auth/presentation/widgets/auth_button.dart';
import 'package:snapbook/features/home/presentation/views/home_view.dart';

class ProfilePictureUploadView extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ProfilePictureUploadView());
  const ProfilePictureUploadView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushAndRemoveUntil(HomeView.route(), (route) => false);
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: 2.0,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    height: size.width / 2,
                    width: size.width / 2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_2_outlined,
                      size: 75,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Positioned(
                    top: size.width / 2.9,
                    bottom: 0,
                    left: size.width / 2.9,
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              AuthButton(
                lable: 'Upload',
                onPressed: () {},
                icon: Icons.upload,
              )
            ],
          ),
        ),
      ),
    );
  }
}
