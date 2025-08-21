import 'package:flutter/material.dart';
import 'package:secret_box/widgets/option_tile.dart';

class FakePinExpandableTile extends StatefulWidget {
  const FakePinExpandableTile({super.key});

  @override
  State<FakePinExpandableTile> createState() => _FakePinExpandableTileState();
}

class _FakePinExpandableTileState extends State<FakePinExpandableTile> {
  bool _expanded = false;
  bool _value = true;
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return OptionTile(
      title: 'Fake Pin',
      titleWidget: GestureDetector(
        onTap: () => setState(() => _expanded = !_expanded),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Fake Pin',
              style: TextStyle(
                fontFamily: "Gilroy",
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF3859C5),
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: const Color(0xFF3859C5),
            ),
          ],
        ),
      ),
      subtitle:
          "Create a deceptive fake pin to fool curious eyes and keep your app content a secret.",
      value: _value,
      onChanged: (v) => setState(() => _value = v),
      extraWidget: _expanded
          ? Column(
              children: [
                TextField(
                  obscureText: _obscure,
                  style: const TextStyle(
                    color: Color(0xFF3859C5),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    hintText: '************',
                    hintStyle: const TextStyle(
                      color: Color(0xFF3859C5),
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFF3859C5),
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF3859C5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF3859C5), width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _expanded = false;
                            _obscure = true;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFC8C8C8),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3859C5),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Gilroy",
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : null,
    );
  }
}
