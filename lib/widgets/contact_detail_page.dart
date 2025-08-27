import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secret_box/widgets/show_confirm_sheet.dart';

class ContactDetailPage extends StatefulWidget {
  const ContactDetailPage({super.key, required this.name, required this.phone});

  final String name;
  final String phone;

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  static const blue = Color(0xFF3859C5);

  bool answerIt = true;
  bool muteIt = false;

  String _initials(String fullName) {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts.first.characters.first.toUpperCase();
    return (parts[0].isNotEmpty ? parts[0][0] : '').toUpperCase() +
        (parts[1].isNotEmpty ? parts[1][0] : '').toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            CircleAvatar(
              radius: 36,
              backgroundColor: blue,
              child: Text(
                _initials(widget.name),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 18,
                    color: _ContactDetailPageState.blue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 6),
                SvgPicture.asset(
                  'assets/icons/edit.svg',
                  height: 20,
                  width: 20,
                  color: _ContactDetailPageState.blue,
                ),
              ],
            ),

            Text(
              widget.phone,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 16,
                color: blue.withOpacity(0.4),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: blue,
                
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Incoming call action",
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Checkbox(
                          value: answerIt,
                          onChanged: (v) =>
                              setState(() => answerIt = v ?? false),
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) =>
                                const BorderSide(color: Colors.white, width: 1),
                          ),
                        ),
                        const Text(
                          "Answer It",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Checkbox(
                          value: muteIt,
                          onChanged: (v) => setState(() => muteIt = v ?? false),
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) =>
                                const BorderSide(color: Colors.white, width: 1),
                          ),
                        ),
                        const Text(
                          "Mute It",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SafeArea(
                        minimum: const EdgeInsets.all(16),
                        child: Container(
                          width: 340,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 6,
                                  ),
                                  child: const Text(
                                    "Call Now",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: blue,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 18,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                color: blue,
                              ),
                              TextButton(
                                onPressed: () {
                                  showConfirmSheet(
                                    context,
                                    ext: 'contact',
                                    action: FileAction.restore,
                                  );
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: blue,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size.zero,
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Restore',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: blue,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(Icons.restore, size: 16),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showConfirmSheet(
                                    context,
                                    ext: 'contact',
                                    action: FileAction.delete,
                                  );
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: blue,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size.zero,
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Delete',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: blue,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(Icons.delete, size: 16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
