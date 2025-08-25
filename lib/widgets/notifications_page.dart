import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secret_box/widgets/notification_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secret_box/widgets/show_confirm_sheet.dart'; 

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  static const blue = Color(0xFF3859C5);

  bool selectionMode = false;
  final Set<int> selected = {};

  final List<Map<String, String>> notifications = List.generate(6, (_) => {
        'title': 'Cloud Backup',
        'message': 'Lorem ipsum dolor sit amet,\nsadipscing elitr, sed diam nonumy',
        'time': '2:00PM',
      });

  bool get _allSelected =>
      selected.length == notifications.length && notifications.isNotEmpty;

  void _toggleSelectionMode() {
    setState(() {
      selectionMode = !selectionMode;
      selected.clear();
    });
  }

  void _toggleSelect(int i, bool v) {
    setState(() {
      if (v) {
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
        ..addAll(List.generate(notifications.length, (i) => i));
    });
  }

  void _clearSelection() {
    setState(selected.clear);
  }

  Future<void> _bulkDelete() async {
    if (selected.isEmpty) return;
    final ok = await showConfirmSheet(
      context,
      ext: 'notification',
      action: FileAction.delete,
    );
    if (!mounted) return;
    if (ok == true) {
      final toRemove = selected.toList()..sort((a, b) => b.compareTo(a));
      setState(() {
        for (final i in toRemove) {
          notifications.removeAt(i);
        }
        selected.clear();
      });
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
        toolbarHeight: 94,
        titleSpacing: 20,
        scrolledUnderElevation: 0,
        title: Container(
          margin: const EdgeInsets.fromLTRB(10, 48, 15, 15),
          child: const Text(
            "Notifications",
            style: TextStyle(
              fontSize: 28,
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w800,
              color: blue,
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 7, top: 30),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/apps_boxes_dashboard_menu_select_icon_with_color.svg",
                height: 18,
                width: 18,
              ),
              onPressed: _toggleSelectionMode,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15, top: 30),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/xbutton.svg",
                height: 12,
                width: 12,
              ),
              onPressed: () {
                Navigator.pop(context);

              },
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 12),

              if (selectionMode)
                Container(
                  height: 51,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 12),
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
                            fontWeight: FontWeight.w600,
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
                      Spacer(),
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
                                color: Colors.white
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.delete_outline, size: 16,color: Colors.white,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final n = notifications[index];
                    final isSelected = selected.contains(index);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: NotificationCard(
                        title: n['title']!,
                        message: n['message']!,
                        time: n['time']!,
                        selectionMode: selectionMode,
                        selected: isSelected,
                        onSelectedChanged: (v) => _toggleSelect(index, v),
                        onTap: () {
                          if (selectionMode) {
                            _toggleSelect(index, !isSelected);
                          } else {
                            
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
