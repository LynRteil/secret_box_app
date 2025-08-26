import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:secret_box/widgets/show_confirm_sheet.dart';

class VideoDetailPage extends StatefulWidget {
  final String title;
  final String path;
  final VoidCallback onRestore;
  final VoidCallback onDelete;

  final String? initialDurationLabel;

  const VideoDetailPage({
    super.key,
    required this.title,
    required this.path,
    required this.onRestore,
    required this.onDelete,
    this.initialDurationLabel,
  });

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  static const blue = Color(0xFF3859C5);

  late final VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.path)
      ..setLooping(true)
      ..initialize().then((_) {
        if (!mounted) return;
        _controller.pause();
        setState(() => _initialized = true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (!_initialized) return;
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    if (h > 0) {
      return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
    return '${m}:${s.toString().padLeft(2, '0')}';
  }

  Widget _durationBadge({required String label}) {
    return Positioned(
      left: 8,
      bottom: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.45),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.videocam, size: 12, color: Colors.white),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final durationLabel = _initialized
        ? _formatDuration(_controller.value.duration)
        : (widget.initialDurationLabel ?? '');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 12,
                      color: blue,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: _togglePlay,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width - 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              if (_initialized)
                                FittedBox(
                                  fit: BoxFit.cover,
                                  child: SizedBox(
                                    width: _controller.value.size.width,
                                    height: _controller.value.size.height,
                                    child: VideoPlayer(_controller),
                                  ),
                                )
                              else
                                Container(color: Colors.black12),

                              if (!_initialized || !_controller.value.isPlaying)
                                Container(
                                  width: 78,
                                  height: 78,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.35),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 46,
                                  ),
                                ),

                              if (durationLabel.isNotEmpty)
                                _durationBadge(label: durationLabel),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: SafeArea(
                    minimum: const EdgeInsets.all(16),
                    child: Container(
                      width: 330,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: blue.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              child: Text(
                                widget.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 18,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          TextButton(
                            onPressed: () async {
                              final ok = await showConfirmSheet(
                                context,
                                ext: 'video',
                                action: FileAction.restore,
                              );
                              if (ok == true) widget.onRestore();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: Size.zero,
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Restore',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.restore, size: 16),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              final ok = await showConfirmSheet(
                                context,
                                ext: 'video',
                                action: FileAction.delete,
                              );
                              if (ok == true) widget.onDelete();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: Size.zero,
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Delete',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.delete, size: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
