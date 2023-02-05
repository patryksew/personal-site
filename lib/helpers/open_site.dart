import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart';

void openSite(Site site) async {
  late final Uri url;

  switch (site) {
    case Site.gitHub:
      url = Uri.parse("https://github.com/patryksew");
      break;
    case Site.linkedin:
      url = Uri.parse("https://www.linkedin.com/in/patryk-sewastianowicz-25352b185/");
      break;
    case Site.cv:
      final ref = FirebaseStorage.instance.ref("CV Patryk Sewastianowicz.pdf");

      url = Uri.parse(await ref.getDownloadURL());
      break;
  }

  launchUrl(url, mode: LaunchMode.externalApplication);
}

enum Site { gitHub, linkedin, cv }
