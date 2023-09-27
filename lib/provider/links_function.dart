import 'package:url_launcher/url_launcher.dart';

// Function to open a URL using the url_launcher package.
// It checks if the URL can be launched and then launches it.
// If the URL cannot be launched, it throws an exception.
openLink(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
