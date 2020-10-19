import 'package:flutter/material.dart';
import 'package:league_of_legends_app/models/Champion.dart';
import 'package:league_of_legends_app/screens/widgets/CircleProfile.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  final Champion champion;
  Feed({this.champion});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: champion,
        child: Consumer<Champion>(builder: (context, champion, child) {
          champion.updateSkins();
          return (champion.skins == null)
              ? CircularProgressIndicator()
              : GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile',
                        arguments: champion);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleProfile(
                                image: champion.image,
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Text(
                                champion.name,
                                style: TextStyle(fontSize: 13),
                              ),
                              Expanded(child: Container()),
                              Icon(Icons.more_horiz),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 270,
                            child: PageView.builder(
                                itemCount: champion.skins.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            champion.skins[index].splashImage,
                                            height: 250,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Container(
                                          color: Colors.black.withOpacity(0.5),
                                          padding: const EdgeInsets.all(5),
                                          child:
                                              Text(champion.skins[index].name),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              champion.blurb,
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      )),
                );
        }));
  }
}
