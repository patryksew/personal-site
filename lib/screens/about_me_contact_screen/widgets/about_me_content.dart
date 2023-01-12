import 'package:cv/providers/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutMeContent extends StatelessWidget {
  const AboutMeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<MyTheme>(context).current.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 60),
        child: Column(
          children: [
            const _Item(
              text:
                  "Od zawsze interesowałem się technologią. Wcześniej w moim centrum zainteresowań było tworzenie gier komputerowych, jednak z czasem zdecydowałem się skupić na tworzeniu aplikacji webowych oraz mobile.",
            ),
            const _Item(
              text:
                  "W 2019 r. rozpocząłem studia informatyczne na Politechnice Warszawskiej, jednak zrezygnowałem z nich po pierwszym roku, ponieważ mój styl nauki opiera się bardziej na praktyce niż teorii. Dodatkowo chciałem skupić się na front-endzie, w szczególności na Flutterze. Od tego czasu zdobyłem wiedzę i doświadczenie pracy z różnymi projektami, od prostych stron internetowych po aplikacje mobilne. ",
              imageRight: false,
            ),
            const _Item(
              text:
                  "Potrafię pracować i uczyć się samodzielnie, ale też lubię współpracować z innymi programistami, dzielić się swoją wiedzą, ale też korzystać z umiejętności innych. W pracy cenię sobie dokładność, rzetelność, ale przede wszystkim elastyczność. Uważam, że praca zespołowa jest kluczem do sukcesu i zawsze staram się być dobrym kolegą oraz współpracownikiem.",
            ),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Provider.of<MyTheme>(context).current.primary,
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              icon: const Icon(Icons.download, size: 40),
              label: const Text(
                "Pobierz CV",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String text;
  final bool imageRight;

  const _Item({super.key, required this.text, this.imageRight = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 60),
      child: Row(
        textDirection: !imageRight ? TextDirection.rtl : null,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Provider.of<MyTheme>(context).current.onBackground,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            color: Colors.red,
            width: 200,
            height: 200,
          ),
        ],
      ),
    );
  }
}
