import 'package:city_pulse/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenLink extends StatelessWidget {
  final URLTitle urlTitle ;

  const OpenLink({super.key, required this.urlTitle});

  Future<void> _launchGame() async {
    final Uri url = Uri.parse(urlTitle.url);

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication, // يفتح في متصفح خارجي
    )) {
      debugPrint("❌ Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomElevatedButton(title : "open the ${urlTitle.title}" , onPressed : () {
          _launchGame();
        }
        )
        ),
      );
    
  }
}

class URLTitle{
  final String title;
  final String url;

  URLTitle({required this.title, required this.url});
}