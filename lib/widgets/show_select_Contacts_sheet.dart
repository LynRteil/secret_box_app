import 'package:flutter/material.dart';
import 'package:secret_box/models/contact.dart';

Future<List<Contact>?> showSelectContactsSheet(
  BuildContext context, {
  required List<Contact> contacts,
}) {
  const blue = Color(0xFF3859C5);
  final searchCtrl = TextEditingController();

  final selected = <String>{};

  return showModalBottomSheet<List<Contact>?>(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (ctx, setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom,
            ),
            child: FractionallySizedBox(
              heightFactor: 0.9,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(ctx, null),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 18,
                                color: blue,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: selected.isEmpty
                                ? null
                                : () {
                                    final result = contacts
                                        .where(
                                          (c) => selected.contains(c.phone),
                                        )
                                        .toList();
                                    Navigator.pop(ctx, result);
                                  },
                            child: Text(
                              "Import",
                              style: TextStyle(
                                fontFamily: "Gilroy",
                                fontSize: 16,
                                color: selected.isEmpty
                                    ? blue.withOpacity(0.5)
                                    : blue,
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
                          controller: searchCtrl,
                          decoration: InputDecoration(
                            hintText: "Search Contacts",
                            hintStyle: TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 18,
                              color: blue.withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
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
                          style: const TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 18,
                            color: Color(0xFF3859C5),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 2),

                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.only(top: 6),
                        itemCount: contacts.length,
                        separatorBuilder: (_, __) => const Divider(
                          color: Color.fromRGBO(0, 0, 0, 0.05),
                          height: 1,
                          thickness: 1,
                        ),
                        itemBuilder: (_, i) {
                          final c = contacts[i];
                          final isChecked = selected.contains(c.phone);

                          return InkWell(
                            onTap: () {
                              if (isChecked) {
                                selected.remove(c.phone);
                              } else {
                                selected.add(c.phone);
                              }
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: ListTile(
                                leading: Checkbox(
                                  value: isChecked,
                                  onChanged: (v) {
                                    if (v == true) {
                                      selected.add(c.phone);
                                    } else {
                                      selected.remove(c.phone);
                                    }
                                    setState(() {});
                                  },
                                  checkColor: blue,
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (_) => Colors.transparent,
                                  ),
                                  side: MaterialStateBorderSide.resolveWith(
                                    (_) =>
                                        const BorderSide(color: blue, width: 2),
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
                                    color: Color(0xFF3859C5),
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
                                      color: blue.withOpacity(0.4),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
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
        },
      );
    },
  );
}
