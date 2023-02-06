import 'package:flutter/material.dart';
import 'package:patryk_sewastianowicz/helpers/download_cv.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/open_site.dart';
import '../../../../providers/my_theme.dart';
import 'about_me_item.dart';

class AboutMeContent extends StatelessWidget {
  const AboutMeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<MyTheme>(context).current.background,
      child: Column(
        children: [
          const SizedBox(height: 60),
          const AboutMeItem(
            text:
                "Od zawsze interesowałem się technologią. Wcześniej w moim centrum zainteresowań było tworzenie gier komputerowych, jednak z czasem zdecydowałem się skupić na tworzeniu aplikacji webowych oraz mobile.",
            image: "laptop_drawing",
          ),
          const AboutMeItem(
            text:
                "W 2019 r. rozpocząłem studia informatyczne na Politechnice Warszawskiej, jednak zrezygnowałem z nich po pierwszym roku, ponieważ mój styl nauki opiera się bardziej na praktyce niż teorii. Dodatkowo chciałem skupić się na front-endzie, w szczególności na Flutterze. Od tego czasu zdobyłem wiedzę i doświadczenie pracy z różnymi projektami, od prostych stron internetowych po aplikacje mobilne. ",
            imageRight: false,
            image: "smartphone",
          ),
          const AboutMeItem(
            text:
                "Potrafię pracować i uczyć się samodzielnie, ale też lubię współpracować z innymi programistami, dzielić się swoją wiedzą, ale też korzystać z umiejętności innych. W pracy cenię sobie dokładność, rzetelność, ale przede wszystkim elastyczność. Uważam, że praca zespołowa jest kluczem do sukcesu i zawsze staram się być dobrym kolegą oraz współpracownikiem.",
            image: "man_with_coffe_laptop",
          ),
          ElevatedButton.icon(
            onPressed: () {
              downloadCv(Localizations.localeOf(context).languageCode);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Provider.of<MyTheme>(context).current.primary2,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            icon: const Icon(Icons.download, size: 40),
            label: const Text(
              "Pobierz CV",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
