import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapbook/core/common/widgets/loader.dart';
import 'package:snapbook/core/utils/show_snackbar.dart';
import 'package:snapbook/features/home_features/profile/presentation/bloc/profile_bloc.dart';

class EditProfileView extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const EditProfileView());
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController bioTextController = TextEditingController();
  @override
  void dispose() {
    bioTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSuccess) {
            Navigator.of(context).pop();
          }
          if (state is ProfileFailed) {
            showSnackbar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Loader();
          }
          return Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(size.width / 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: bioTextController,
                      maxLength: 150,
                      maxLines: null,
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        hintText: 'Update Bio',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                      cursorColor: Theme.of(context).colorScheme.primary,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Bio can not be empty!';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ProfileBloc>().add(UpdateProfileBioEvent(
                              bio: bioTextController.text));
                        }
                      },
                      child: const Text('Update Bio'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
