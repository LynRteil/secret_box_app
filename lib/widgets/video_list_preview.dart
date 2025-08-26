import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoListPreview extends StatefulWidget {
  final String path;
  final double width;
  final double height;

  const VideoListPreview({
    super.key,
    required this.path,
    this.width = 68,
    this.height = 62,
  });

  @override
  State<VideoListPreview> createState() => _VideoListPreviewState();
}

class _VideoListPreviewState extends State<VideoListPreview> {
  late final VideoPlayerController _c;
  bool _ready = false;
  String _durationLabel = '';

  @override
  void initState() {
    super.initState();
    _c = VideoPlayerController.asset(widget.path)
      ..setLooping(false)
      ..setVolume(0.0)
      ..initialize().then((_) async {
        if (!mounted) return;
        await _c.play();
        await Future.delayed(const Duration(milliseconds: 50));
        await _c.pause();

        final d = _c.value.duration;
        _durationLabel = _formatDuration(d);
        setState(() => _ready = true);
      });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            Positioned.fill(
              child: _ready
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _c.value.size.width,
                        height: _c.value.size.height,
                        child: VideoPlayer(_c),
                      ),
                    )
                  : Container(color: Colors.black12),
            ),

            if (_durationLabel.isNotEmpty)
              Positioned(
                left: 5,
                bottom: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.videocam, size: 12, color: Colors.white),
                    ],
                  ),
                ),
              ),
            if (_durationLabel.isNotEmpty)
              Positioned(
                left: 24,
                bottom: 6,
                child: Text(
                  _durationLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
