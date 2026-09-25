import 'package:xi/xi.dart';

enum DesktopPlayback { webview, mediaKit }

/// Keep HTML player pages in the desktop WebView; use MediaKit for media URLs.
DesktopPlayback selectDesktopPlayback(VideoType type, String url) {
  final path = Uri.tryParse(url)?.path.toLowerCase() ?? '';
  if (type == VideoType.iframe &&
      !path.endsWith('.m3u8') &&
      !path.endsWith('.mp4')) {
    return DesktopPlayback.webview;
  }
  return DesktopPlayback.mediaKit;
}
