import 'package:flutter/material.dart';
import 'package:league_of_legends_app/models/Champion.dart';
import 'package:league_of_legends_app/screens/Top_champions.dart';
import 'package:league_of_legends_app/screens/widgets/Feed.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Champion> champions = Provider.of<List<Champion>>(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.account_box),
                Text(
                  "League of legends",
                  style: TextStyle(fontSize: 15),
                ),
                Icon(Icons.lightbulb_outline),
              ],
            ),
          )),
      body: (champions == null)
          ? CircularProgressIndicator()
          : Container(
              child: Column(
                children: [
                  TopChampionsWidget(
                    champions: champions,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height -
                        AppBar().preferredSize.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom -
                        50,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Feed(champion: champions[index]);
                      },
                      itemCount: champions.length,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
