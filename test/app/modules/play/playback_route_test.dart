import 'package:catmovie/app/modules/play/playback_route.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xi/xi.dart';

void main() {
  test('desktop webview opens a video page in WebView', () {
    expect(
      selectDesktopPlayback(VideoType.iframe, 'https://example.com/watch?id=1'),
      DesktopPlayback.webview,
    );
  });

  test('desktop webview plays direct HLS even with a query string', () {
    expect(
      selectDesktopPlayback(
        VideoType.iframe,
        'https://example.com/live/stream.m3u8?token=abc',
      ),
      DesktopPlayback.mediaKit,
    );
  });

  test('desktop webview plays direct MP4 with MediaKit', () {
    expect(
      selectDesktopPlayback(VideoType.mp4, 'https://example.com/video.mp4'),
      DesktopPlayback.mediaKit,
    );
  });
}
