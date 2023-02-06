import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';

void downloadCv(String langCode) async {
  final ref = FirebaseStorage.instance.ref("$langCode/CV Patryk Sewastianowicz.pdf");

  final url = Uri.parse(await ref.getDownloadURL());
  print(url);
  return;

  launchUrl(url, mode: LaunchMode.externalApplication);
}
