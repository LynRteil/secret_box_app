import 'package:flutter/material.dart';
import 'package:secret_box/widgets/import_Success_sheet.dart';

class PictureSheet extends StatefulWidget {
  const PictureSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const PictureSheet(),
    );
  }

  @override
  State<PictureSheet> createState() => _PictureSheetState();
}

class _PictureSheetState extends State<PictureSheet> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Future.delayed(const Duration(milliseconds: 200), () {
                      ImportSuccessSheet.show(context);
                    });
                  },
                  child: const Text(
                    "Import",
                    style: TextStyle(
                      color: Color(0xFF3859C5),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
              ),
              itemCount: 15,
              itemBuilder: (ctx, index) {
                if (index == 0) {
                  return Container(
                    color: const Color(0xFF1A1D22),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white.withOpacity(0.5),
                      size: 30,
                    ),
                  );
                }

                final isSelected = _selectedIndex == index;

                return GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.network(
                          "https://picsum.photos/id/${index + 30}/200/200",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      if (isSelected)
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF3859C5),
                              width: 3,
                            ),
                          ),
                        ),
                      if (index % 5 == 0)
                        const Positioned(
                          bottom: 4,
                          left: 4,
                          child: Icon(
                            Icons.videocam,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      if (isSelected)
                        const Positioned(
                          bottom: 4,
                          right: 4,
                          child: Icon(
                            Icons.check,
                            color: Color(0xFF3859C5),
                            size: 22,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
