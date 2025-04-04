// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomHomeButton extends StatefulWidget {
  final String label;
  final String assetsPath;
  final bool isAddButton;
  final void Function()? onTap;

  const CustomHomeButton({
    Key? key,
    required this.label,
    required this.assetsPath,
    required this.isAddButton,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomHomeButton> createState() => _CustomHomeButtonState();
}

class _CustomHomeButtonState extends State<CustomHomeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration:
                widget.isAddButton
                    ? BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    )
                    : BoxDecoration(borderRadius: BorderRadius.circular(14)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding:
                    widget.isAddButton
                        ? const EdgeInsets.all(8.0)
                        : EdgeInsets.all(0),
                child: Image.asset(
                  widget.assetsPath,
                  color:
                      widget.isAddButton
                          ? Theme.of(context).colorScheme.onInverseSurface
                          : null,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onInverseSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
