import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secret_box/models/option_item.dart';

class CheckOptionSection extends StatefulWidget {
  final void Function(String selected)? onDone;

  const CheckOptionSection({super.key, this.onDone});

  @override
  State<CheckOptionSection> createState() => _CheckOptionSectionState();
}

class _CheckOptionSectionState extends State<CheckOptionSection> {
  String selectedOption = 'Documents';

  final List<OptionItem> options = [
    OptionItem('Documents', 'assets/icons/documents.svg'),
    OptionItem('Photos', 'assets/icons/photos.svg'),
    OptionItem('Videos', 'assets/icons/videos.svg'),
    OptionItem('Contacts', 'assets/icons/contacts.svg'),
    OptionItem('Music', 'assets/icons/music.svg'),
    OptionItem('Audios', 'assets/icons/audios.svg'),
    OptionItem('Folders', 'assets/icons/folders.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 531,
      width: 390,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 34),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: options.length,
              separatorBuilder: (_, __) => const Divider(
                color: Color(0x0D000000),
                thickness: 1,
                height: 1,
              ),
              itemBuilder: (_, index) {
                final item = options[index];
                return ListTile(
                  leading: SvgPicture.asset(
                    item.iconPath,
                    width: 17,
                    height: 21,
                  ),
                  title: Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF898989),
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      setState(() => selectedOption = item.title);
                    },
                    child: selectedOption == item.title
                        ? const Icon(
                            Icons.check_circle,
                            size: 28,
                            color: Color(0xFF3859C5),
                          )
                        : Container(
                            width: 24,
                            height: 24,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              border: Border.all(
                                color: Color(0xFF3859C5),
                                width: 2,
                              ),
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC8C8C8),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.onDone != null) {
                      widget.onDone!(selectedOption);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3859C5),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
