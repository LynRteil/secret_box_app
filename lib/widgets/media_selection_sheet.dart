import 'package:flutter/material.dart';
import 'package:secret_box/widgets/build_option.dart';

class MediaSelectionSheet extends StatefulWidget {
  final String action;

  const MediaSelectionSheet({super.key, required this.action});

  @override
  State<MediaSelectionSheet> createState() => _MediaSelectionSheetState();
}

class _MediaSelectionSheetState extends State<MediaSelectionSheet> {
  bool all = false;
  bool images = false;
  bool videos = false;
  bool audios = false;
  bool documents = false;
  bool contacts = false;

  bool get hasSelection =>
      all || images || videos || audios || documents || contacts;

  void _toggleAll(bool? value) {
    setState(() {
      all = value ?? false;
      images = all;
      videos = all;
      audios = all;
      documents = all;
      contacts = all;
    });
  }

  @override
  Widget build(BuildContext context) {
    const optionStyle = TextStyle(
      color: Colors.white70,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF3859C5),
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Select Media Type",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              BuildOption("All", optionStyle, all, _toggleAll),
              BuildOption("Images", optionStyle, images, (val) {
                setState(() => images = val ?? false);
              }),
              BuildOption("Videos", optionStyle, videos, (val) {
                setState(() => videos = val ?? false);
              }),
              BuildOption("Audios", optionStyle, audios, (val) {
                setState(() => audios = val ?? false);
              }),
              BuildOption("Documents", optionStyle, documents, (val) {
                setState(() => documents = val ?? false);
              }),
              BuildOption("Contacts", optionStyle, contacts, (val) {
                setState(() => contacts = val ?? false);
              }),
            ],
          ),
          const SizedBox(height: 12),
          Center(
            child: ElevatedButton(
              onPressed: hasSelection
                  ? () {
                      Navigator.pop(context);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: hasSelection
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
                foregroundColor: const Color(0xFF3859C5),
                minimumSize: const Size(310, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                widget.action,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF3859C5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}