import 'package:flutter/material.dart';

class ProfileDraggableSheet extends StatelessWidget {
  const ProfileDraggableSheet({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: EdgeInsets.all(size.width / 30),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: Theme.of(context).colorScheme.background,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 4,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: size.height / 1.45,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Javed Pathan',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'We used bloc clean architecture in this project. We are not foccussing on ui thats why we are using very minimal ui design.',
                            softWrap: true,
                            textAlign: TextAlign.center,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                '78',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                '138',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              Text(
                                'Following',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                '35',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              Text(
                                'Posts',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
