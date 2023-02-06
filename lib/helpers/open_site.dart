import 'package:url_launcher/url_launcher.dart';

void openSite(Site site) {
  late final Uri url;

  switch (site) {
    case Site.gitHub:
      url = Uri.parse("https://github.com/patryksew");
      break;
    case Site.linkedin:
      url = Uri.parse("https://www.linkedin.com/in/patryk-sewastianowicz-25352b185/");
      break;
  }

  launchUrl(url, mode: LaunchMode.externalApplication);
}

enum Site { gitHub, linkedin }
