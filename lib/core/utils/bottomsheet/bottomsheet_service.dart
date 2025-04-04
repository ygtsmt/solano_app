import "package:flutter/material.dart";

class BottomSheetService {
  Future<void> show(final BuildContext context, final Widget child) {
    return showModalBottomSheet(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (final BuildContext context) {
        return child;
      },
    );
  }
}
