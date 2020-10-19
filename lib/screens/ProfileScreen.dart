import 'package:flutter/material.dart';
import 'package:league_of_legends_app/models/Champion.dart';
import 'package:league_of_legends_app/screens/widgets/CircleProfile.dart';
import 'package:league_of_legends_app/screens/widgets/Feed.dart';
import 'package:league_of_legends_app/screens/widgets/TextStats.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Champion champ = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(champ.name),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                  tag: champ.id,
                  child:
                      CircleProfile(height: 80, width: 80, image: champ.image)),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextStats(
                    statusNumber: champ.stats.armor,
                    statusName: "AR",
                  ),
                  TextStats(
                    statusNumber: champ.stats.hp,
                    statusName: "HP",
                  ),
                  TextStats(
                    statusNumber: champ.stats.moveSpeed,
                    statusName: "MS",
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextStats(
                    statusNumber: champ.stats.attackDamage,
                    statusName: "AD",
                  ),
                  TextStats(
                    statusNumber: champ.stats.mp,
                    statusName: "MP",
                  ),
                  TextStats(
                    statusNumber: champ.stats.crit,
                    statusName: "Crit",
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextStats(
                    statusNumber: champ.stats.attackSpeed,
                    statusName: "AS",
                  ),
                  TextStats(
                    statusNumber: champ.stats.spellBlock,
                    statusName: "SB",
                  ),
                  TextStats(
                    statusNumber: champ.stats.attackRange,
                    statusName: "Range",
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                height: 20,
                thickness: 2,
                color: Colors.white,
              ),
              Feed(
                champion: champ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
