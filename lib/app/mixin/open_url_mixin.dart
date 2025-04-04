import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

mixin OpenUrlMixin {
  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('❌ URL açılamadı: $url');
    }
  }
}
