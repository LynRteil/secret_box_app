import 'package:flutter/material.dart';
import 'package:secret_box/models/contact.dart';

const _blue = Color(0xFF3859C5);

class SelectContactsSheet extends StatefulWidget {
  final List<Contact> contacts;

  const SelectContactsSheet({
    super.key,
    required this.contacts,
  });

  static Future<List<Contact>?> show(
    BuildContext context, {
    required List<Contact> contacts,
  }) {
    return showModalBottomSheet<List<Contact>?>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SelectContactsSheet(contacts: contacts),
    );
  }

  @override
  State<SelectContactsSheet> createState() => _SelectContactsSheetState();
}

class _SelectContactsSheetState extends State<SelectContactsSheet> {
  final TextEditingController _searchCtrl = TextEditingController();
  final Set<String> _selected = {};

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: FractionallySizedBox(
        heightFactor: 0.9,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context, null),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontFamily: "Gilroy",
                          fontSize: 18,
                          color: _blue,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _selected.isEmpty
                          ? null
                          : () {
                              final result = widget.contacts
                                  .where((c) => _selected.contains(c.phone))
                                  .toList();
                              Navigator.pop(context, result);
                            },
                      child: Text(
                        "Import",
                        style: TextStyle(
                          fontFamily: "Gilroy",
                          fontSize: 16,
                          color: _selected.isEmpty
                              ? _blue.withOpacity(0.5)
                              : _blue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
                child: SizedBox(
                  height: 44,
                  child: TextField(
                    controller: _searchCtrl,
                    decoration: InputDecoration(
                      hintText: "Search Contacts",
                      hintStyle: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 18,
                        color: _blue.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: _blue,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: _blue,
                          width: 2,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 18,
                      color: _blue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 6),
                  itemCount: widget.contacts.length,
                  separatorBuilder: (_, __) => const Divider(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    height: 1,
                    thickness: 1,
                  ),
                  itemBuilder: (_, i) {
                    final c = widget.contacts[i];
                    final isChecked = _selected.contains(c.phone);

                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (isChecked) {
                            _selected.remove(c.phone);
                          } else {
                            _selected.add(c.phone);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          leading: Checkbox(
                            value: isChecked,
                            onChanged: (v) {
                              setState(() {
                                if (v == true) {
                                  _selected.add(c.phone);
                                } else {
                                  _selected.remove(c.phone);
                                }
                              });
                            },
                            checkColor: _blue,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                              (_) => Colors.transparent,
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                              (_) => const BorderSide(color: _blue, width: 2),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: const VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                          ),
                          title: Text(
                            c.name,
                            style: const TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 18,
                              color: _blue,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              c.phone,
                              style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 14,
                                color: _blue.withOpacity(0.4),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                        ),
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
