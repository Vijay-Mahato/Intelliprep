import 'package:flutter/material.dart';

import '../main.dart';
import 'content_card.dart';
import 'gooey_carousel.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key, required this.title});

  final String title;

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GooeyCarousel(
        children: <Widget>[
          ContentCard(
            onButtonPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CarouselExampleApp()),
              );
            },
            color: 'Red',
            altColor: Color(0xFF4259B2),
            title: "Data Structures",
            subtitle: 'Relax your mind and create inner peace with soothing sounds of nature.',
          ),
          ContentCard(
            onButtonPressed: (){},
            color: 'Yellow',
            altColor: Color(0xFF904E93),
            title: "Algorithms",
            subtitle: 'Melt your stresses and anxieties away with 50+ breathing exercises.',
          ),
          ContentCard(
            onButtonPressed: (){},
            color: 'Blue',
            altColor: Color(0xFFFFB138),
            title: "System Design",
            subtitle: 'Enjoy a restful night’s sleep with relaxing activities and calm bedtime stories.',
          ),
        ],
      ),
    );
  }
}
