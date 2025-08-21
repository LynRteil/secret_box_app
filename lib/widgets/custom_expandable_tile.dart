import 'package:flutter/material.dart';

class CustomExpandableTile extends StatefulWidget {
  final String title;
  final List<String> options;

  const CustomExpandableTile({
    super.key,
    required this.title,
    required this.options,
  });

  @override
  State<CustomExpandableTile> createState() => _CustomExpandableTileState();
}

class _CustomExpandableTileState extends State<CustomExpandableTile> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: widget.options.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 12,
              childAspectRatio: 5,
            ),
            itemBuilder: (context, index) {
              final option = widget.options[index];
              final isSelected = selectedOption == option;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = option;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        checkboxTheme: CheckboxThemeData(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                              color: Colors.white.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                          fillColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                          checkColor: MaterialStateProperty.all(Colors.white),
                        ),
                      ),
                      child: Checkbox(
                        value: isSelected,
                        onChanged: (_) {
                          setState(() {
                            selectedOption = option;
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: Text(
                        option,
                        style: TextStyle(
                          fontFamily: "Gilroy",
                          fontWeight: isSelected
                              ? FontWeight.w800
                              : FontWeight.w300,
                          fontSize: 18,
                          color: Colors.white.withOpacity(isSelected ? 1 : 0.4),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
