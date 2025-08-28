import 'package:flutter/material.dart';
import 'package:secret_box/widgets/show_import_success.dart';

Future<void> showDocumentPicker(BuildContext parentContext) {
  return showModalBottomSheet(
    context: parentContext,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (sheetCtx) {
      const blue = Color(0xFF3859C5);
      final height = MediaQuery.of(sheetCtx).size.height;

      return Container(
        height: height * 0.85,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(sheetCtx).pop();
                    Future.microtask(() {
                      showImportSuccess(parentContext);
                    });
                  },
                  child: const Text(
                    "Import",
                    style: TextStyle(
                      color: blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Color(0xFF777777)),
                    prefixIcon: Icon(Icons.search, color: Color(0xFF777777)),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.60, 
                ),
                itemBuilder: (ctx, index) {
                  final ext = (index % 4 == 0)
                      ? ".pdf"
                      : (index % 4 == 1)
                          ? ".ppt"
                          : (index % 4 == 2)
                              ? ".mp3"
                              : ".zip";

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 90,
                        width: 60,
                        decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              ext,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Lorem",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "20/02/2023",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "iCloud Drive",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  );
                },
              ),
            ),
            SafeArea(
              top: false,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black12, width: 1),
                  ),
                ),
                child: BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.access_time),
                      label: "Recents",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.share),
                      label: "Shared",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.folder),
                      label: "Browse",
                    ),
                  ],
                  currentIndex: 0,
                  selectedItemColor: blue,
                  unselectedItemColor: Colors.grey,
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
