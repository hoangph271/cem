import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('Item Details'),
      // ),
      body: ViewerGestureDetector(),
    );
  }
}

class ViewerGestureDetector extends StatelessWidget {
  const ViewerGestureDetector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (builder) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.lock,
                        size: 32,
                      ),
                      label: const Text('Lock'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.pause,
                        size: 32,
                      ),
                      label: const Text('Lock'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.shuffle,
                        size: 32,
                      ),
                      label: const Text('Suffle'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              );
            });
      },
      child: const Gallery(),
    );
  }
}

class Gallery extends StatelessWidget {
  const Gallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: SafeArea(
        child: Center(
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.network(
              'https://www.runicgames.com/images/torchlight2/tl2-marquee-hero@2x.png',
            ),
          ),
        ),
      ),
    );
  }
}
