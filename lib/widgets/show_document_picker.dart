import 'package:flutter/material.dart';
import 'package:secret_box/widgets/show_import_success.dart';

Future<void> showDocumentPicker(BuildContext parentContext) {
  return showModalBottomSheet(
    context: parentContext,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (sheetCtx) {
      final height = MediaQuery.of(sheetCtx).size.height;
      const blue = Color(0xFF3859C5);

      return Container(
        height: height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50, top: 12),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Color(0xFF777777)),
                    prefixIcon: Icon(Icons.search, color: Color(0xFF777777)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 142,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (ctx, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 90,
                        width: 70,
                        decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              index % 2 == 0 ? ".pdf" : ".ppt",
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

                      Flexible(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Lorem",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "20/02/2023",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "iCloud Drive",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          
            Container(
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
          ],
        ),
      );
    },
  );
}
