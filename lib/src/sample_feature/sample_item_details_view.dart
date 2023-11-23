import 'package:flutter/material.dart';

class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ViewerGestureDetector(),
    );
  }
}

class ViewerGestureDetector extends StatefulWidget {
  const ViewerGestureDetector({
    super.key,
  });

  @override
  State<ViewerGestureDetector> createState() => _ViewerGestureDetectorState();
}

class _ViewerGestureDetectorState extends State<ViewerGestureDetector> {
  bool _isLocked = false;
  bool _isPaused = false;
  bool _isShuffle = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final disabledColor = Theme.of(context).disabledColor;

        showModalBottomSheet(
            context: context,
            builder: (builder) {
              return StatefulBuilder(builder: (context, setState) {
                void handleLockPressed() {
                  setState(() {
                    _isLocked = !_isLocked;
                  });

                  if (_isLocked) {
                    Navigator.pop(context);
                  }
                }

                void handlePlayPausePressed() {
                  setState(() {
                    _isPaused = !_isPaused;
                  });
                }

                void handleShufflePressed() {
                  setState(() {
                    _isShuffle = !_isShuffle;
                  });
                }

                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: handleLockPressed,
                                color: _isLocked
                                    ? Theme.of(context).colorScheme.tertiary
                                    : null,
                                icon: const Icon(
                                  Icons.lock,
                                  size: 32,
                                )),
                            if (_isLocked)
                              const Text('Unlock')
                            else
                              const Text('Lock'),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed:
                                    _isLocked ? null : handlePlayPausePressed,
                                icon: Icon(
                                    _isPaused ? Icons.play_arrow : Icons.pause,
                                    size: 32)),
                            Text(_isPaused ? 'Play' : 'Pause',
                                style: _isLocked
                                    ? TextStyle(color: disabledColor)
                                    : null)
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed:
                                  _isLocked ? null : handleShufflePressed,
                              icon: const Icon(
                                Icons.shuffle,
                                size: 32,
                              ),
                              color: _isShuffle
                                  ? Theme.of(context).colorScheme.tertiary
                                  : null,
                            ),
                            Text('Shuffle',
                                style: _isLocked
                                    ? TextStyle(color: disabledColor)
                                    : null)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
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
