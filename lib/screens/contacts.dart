import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secret_box/screens/dashboard.dart';
import 'package:secret_box/widgets/check_option_section.dart';
import 'package:secret_box/widgets/contact_card.dart';
import 'package:secret_box/widgets/custom_bottom_navbar.dart';
import 'package:secret_box/screens/notifications_page.dart';
import 'package:secret_box/screens/settings_page.dart';
import 'package:secret_box/widgets/confirm_sheet.dart';
import 'package:secret_box/widgets/upload_options_bottom_sheet.dart';


class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  static const blue = Color(0xFF3859C5);

  final contacts = const [
    {"name": "Andrew Anderson", "phone": "+961 71 123 456"},
    {"name": "Benjamin Adams", "phone": "+961 71 342 632"},
    {"name": "Charlotte", "phone": "+961 03 592 591"},
  ];

  bool selectionMode = false;
  final Set<int> selected = {};

  bool get _allSelected =>
      selected.length == contacts.length && contacts.isNotEmpty;

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
        ..addAll(List.generate(contacts.length, (i) => i));
    });
  }

  void _clearSelection() => setState(selected.clear);

  Future<void> _bulkRestore() async {
ConfirmSheet( ext: 'contact', action: FileAction.restore);
  }

  Future<void> _bulkDelete() async {
    if (selected.isEmpty) return;
ConfirmSheet( ext: 'contact', action: FileAction.delete);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 164,
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
                  "Contacts",
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

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    width: 272,
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
                          borderSide: const BorderSide(
                            color: blue,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: blue,
                            width: 2,
                          ),
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
        ),
      ),

      body: Column(
        children: [
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
                    child: const Row(
                      children: [
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
                    child: const Row(
                      children: [
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
                        Icon(Icons.delete_outline, size: 16, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              itemCount: contacts.length,
              itemBuilder: (context, i) {
                final c = contacts[i];
                final isSelected = selected.contains(i);

                return ContactCard(
                  name: c['name']!,
                  phone: c['phone']!,
                  selectionMode: selectionMode,
                  selected: isSelected,
                  onSelectedChanged: (v) => _toggleSelect(i, v),
                  onTap: () {
                  },
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
bottomNavigationBar: CustomBottomNavBar(
  currentIndex: 0, 
  onTap: (i) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => Dashboard(initialIndex: i)),
      (route) => false,
    );
  },
),
    );
  }
}
