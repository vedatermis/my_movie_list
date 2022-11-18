import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline3,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.red),
              ),
            ),
          ],
        ));
  }
}

// Align(
//         alignment: Alignment.topLeft,
//         child: 
//       ),
