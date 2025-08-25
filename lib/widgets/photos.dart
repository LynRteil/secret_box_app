import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secret_box/widgets/check_option_section.dart';
import 'package:secret_box/widgets/custom_bottom_navbar.dart';
import 'package:secret_box/widgets/notifications_page.dart';
import 'package:secret_box/widgets/photo_detail_page.dart';
import 'package:secret_box/widgets/settings_page.dart';
import 'package:secret_box/widgets/show_confirm_sheet.dart';
import 'package:secret_box/widgets/upload_options_bottom_sheet.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<Photos> {
  static const blue = Color(0xFF3859C5);

  bool selectionMode = false;
  final Set<int> selected = {};

  final photos = const [
    {
      'title': 'Beach ',
      'date': '30/10/21',
      'size': '1.2 MB',
      'path': 'assets/images/photo1.jpeg',
    },
  ];

  bool get _allSelected =>
      selected.length == photos.length && photos.isNotEmpty;

  void _toggleSelectionMode() {
    setState(() {
      selectionMode = !selectionMode;
      selected.clear();
    });
  }

  void _toggleSelect(int i, bool value) {
    setState(() {
      if (value) {
        selected.add(i);
      } else {
        selected.remove(i);
      }
    });
  }

  void _selectAll() {
    setState(() {
      selected
        ..clear()
        ..addAll(List.generate(photos.length, (i) => i));
    });
  }

  void _clearSelection() {
    setState(selected.clear);
  }

  Future<void> _bulkRestore() async {
    if (selected.isEmpty) return;
    final ok = await showConfirmSheet(
      context,
      ext: 'photo',
      action: FileAction.restore,
    );
    if (!mounted) return;
    if (ok == true) {
      _clearSelection();
    }
  }

  Future<void> _bulkDelete() async {
    if (selected.isEmpty) return;
    final ok = await showConfirmSheet(
      context,
      ext: 'photo',
      action: FileAction.delete,
    );
    if (!mounted) return;
    if (ok == true) {
      _clearSelection();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        titleSpacing: 10,
        scrolledUnderElevation: 0,
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 48, 15, 15),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: blue,
                  size: 15,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              const Expanded(
                child: Text(
                  "Photos",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w800,
                    color: blue,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 40, bottom: 10),
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/apps_boxes_dashboard_menu_select_icon_with_color.svg",
                    height: 18,
                    width: 18,
                  ),
                  onPressed: _toggleSelectionMode,
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/notification_blue.svg",
                    height: 21,
                    width: 21,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsPage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/settings.svg",
                    height: 21,
                    width: 21,
                    color: blue,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Color(0xFF97A1B5)),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: blue,
                          size: 25,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: blue, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/menu.svg",
                        height: 19,
                        width: 20,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => Material(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(24),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: CheckOptionSection(onDone: (selected) {}),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (selectionMode)
            Container(
              height: 40,
              width: 320,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                color: blue.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  TextButton(
                    onPressed: _allSelected ? _clearSelection : _selectAll,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      _allSelected ? 'Deselect All' : 'Select All',
                      style: const TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 16,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.white.withOpacity(0.6),
                  ),
                  TextButton(
                    onPressed: selected.isEmpty ? null : _bulkRestore,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Restore',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.restore, size: 16, color: Colors.white),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: selected.isEmpty ? null : _bulkDelete,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Delete',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.delete_outline,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: photos.length,
              itemBuilder: (context, i) {
                final p = photos[i];
                final isSelected = selected.contains(i);

                return GestureDetector(
                  onTap: () {
                    if (selectionMode) {
                      _toggleSelect(i, !isSelected);
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PhotoDetailPage(
                          title: p['title']!,
                          path: p['path']!,
                          onRestore: () {},
                          onDelete: () {},
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),

                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          p['path']!,
                          width: 68,
                          height: 62,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        p['title']!,
                        style: const TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${p['date']}  "),
                          Text("${p['size']}"),
                        ],
                      ),
                      trailing: selectionMode
                          ? Checkbox(
                              value: isSelected,
                              activeColor: blue,
                              shape: const CircleBorder(),
                              onChanged: (v) => _toggleSelect(i, v ?? false),
                            )
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: SizedBox(
        width: 53,
        height: 53,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
              ),
              builder: (_) => const UploadOptionsBottomSheet(),
            );
          },
          backgroundColor: blue,
          shape: const CircleBorder(),
          elevation: 0,
          child: SvgPicture.asset('assets/icons/add_floating_button.svg'),
        ),
      ),

      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
