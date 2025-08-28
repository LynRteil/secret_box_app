import 'dart:async';
import 'package:flutter/material.dart';
import 'package:secret_box/widgets/triangle_painter.dart';

Future<void> showFaceIdPopup(
  BuildContext context, {
  required String message,
  String? iconAsset,
  Duration duration = const Duration(seconds: 2),
  double bottom = 120,
  EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 24),

  Color dimColor = Colors.white,
  double dimOpacity = 0.55,
}) async {
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (ctx) => _PopupOverlay(
      message: message,
      iconAsset: iconAsset,
      bottom: bottom,
      margin: margin,
      dimColor: dimColor.withValues(alpha:dimOpacity),
      onFinished: () => entry.remove(),
      duration: duration,
    ),
  );

  Overlay.of(context).insert(entry);
}

class _PopupOverlay extends StatefulWidget {
  const _PopupOverlay({
    required this.message,
    required this.bottom,
    required this.margin,
    required this.dimColor,
    required this.onFinished,
    required this.duration,
    this.iconAsset,
  });

  final String message;
  final String? iconAsset;
  final double bottom;
  final EdgeInsets margin;
  final Color dimColor;
  final Duration duration;
  final VoidCallback onFinished;

  @override
  State<_PopupOverlay> createState() => _PopupOverlayState();
}

class _PopupOverlayState extends State<_PopupOverlay> {
  double _opacity = 0;
  @override
  void dispose() {
    widget.onFinished();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() => _opacity = 1);

      Future.delayed(widget.duration, () {
        if (!mounted) return;
        setState(() => _opacity = 0);
        Future.delayed(const Duration(milliseconds: 200), widget.onFinished);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      opacity: _opacity,
      child: Stack(
        children: [
          ModalBarrier(color: widget.dimColor, dismissible: false),

          Positioned(
            left: widget.margin.left,
            right: widget.margin.right,
            bottom: widget.bottom,
            child: Material(
              color: Colors.transparent,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3859C5),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black26,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.iconAsset != null) ...[
                          Image.asset(widget.iconAsset!, width: 18, height: 18),
                          const SizedBox(width: 8),
                        ],
                        Flexible(
                          child: Text(
                            widget.message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    left: 20,
                    bottom: -8,
                    child: CustomPaint(
                      size: const Size(12, 8),
                      painter: TrianglePainter(const Color(0xFF3859C5)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
