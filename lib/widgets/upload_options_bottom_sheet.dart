import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secret_box/models/option_item.dart';

class UploadOptionsBottomSheet extends StatelessWidget {
  const UploadOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OptionItem> options = [
      OptionItem("Upload Documents", "assets/icons/documents.svg"),
      OptionItem("Upload Photos/Videos", "assets/icons/videos.svg"),
      OptionItem("Upload Contacts", "assets/icons/contacts.svg"),
      OptionItem("Upload Music/Audios", "assets/icons/audios.svg"),
      OptionItem("Create Folder", "assets/icons/folders.svg"),
      
    ];

    return Container(
      height: 390,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Wrap(
        children: [
          ...options.expand(
            (item) => [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgPicture.asset(item.iconPath, width: 17, height: 21),
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF898989),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              if (item != options.last)
                const Divider(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  thickness: 1,
                  height: 1,
                ),
             
               
            ],
          ),
          //check this
         const SizedBox(height: 36),
          Center(
            child: SizedBox(
              width: 330,
              height: 55,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF777777).withOpacity(0.4),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


