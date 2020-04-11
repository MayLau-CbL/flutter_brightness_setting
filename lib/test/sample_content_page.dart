import 'package:flutter/material.dart';

class SampleContentPage extends StatelessWidget {
  final bool isDark;

  SampleContentPage({this.isDark = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(
            'Coronavirus: Armed robbers steal hundreds of toilet rolls in Hong Kong',
            style: TextStyle(
                fontSize: 30, color: isDark ? Colors.white : Colors.black87),
          ),
          SizedBox(
            width: 0,
            height: 15,
          ),
          Text(
            '''
Toilet rolls are currently in short supply in Hong Kong due to shortages caused by panic-buying during the coronavirus outbreak.

Knife wielding men robbed a delivery man outside a supermarket in the Mong Kok district, police said.

Police have arrested two men and recovered some of the stolen loo rolls, local media reports said.

The armed robbery took place in Mong Kok, a district of Hong Kong with a history of "triad" crime gangs, early on Monday.

According to local reports, the robbers had threatened a delivery worker who had unloaded rolls of toilet paper outside Wellcome Supermarket.

An Apple Daily report said that 600 toilet paper rolls, valued at around HKD1,695 (\$218; £167), had been stolen.

Stores across the city have seen supplies massively depleted with long queues when new stock arrives.

Coronavirus: A visual guide to the outbreak
Why a global city is so vulnerable to virus spread
Coronavirus: What you need to know
Despite government assurances that supplies remain unaffected by the virus outbreak, residents have been stocking up on toilet paper.

Other household products have also seen panic-buying including rice, pasta and cleaning items.

Face masks and hand sanitisers are almost impossible to get as people try to protect themselves from the coronavirus, which has already claimed more than 1,700 lives.
            ''',
            style: TextStyle(
                fontSize: 14, color: isDark ? Colors.white : Colors.black54),
          )
        ],
      ),
    );
  }
}
