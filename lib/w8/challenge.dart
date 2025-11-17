import 'package:flutter/material.dart';

enum Season{
  winter(image:'assets/seasons/winter.jpg'),
  spring(image:'assets/seasons/spring.jpg'),
  summer(image:'assets/seasons/summer.jpg'),
  fall(image:'assets/seasons/fall.jpg');

  final String image;
  const Season({required this.image});
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SeasonContainer(children: [
            SeasonCard(country: "Cambodia",),
            SeasonCard(country: "France",),
          ],)
        ),
      ),
    ),
  ),
);

class SeasonContainer extends StatelessWidget {
  final List<Widget> children;
  const SeasonContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18)), border: Border.all(), color: Colors.white),
      child: Column(
        children: [
          const Text("SEASONS"),
          const SizedBox(height: 10,),
          Row(spacing: 10, mainAxisAlignment: MainAxisAlignment.center, children: [
            ... children.map((c) => c)
          ],)
        ]
      ),
    );
  }
}

class SeasonCard extends StatefulWidget {
  final Season initialSeasons;
  final String country;
  
  const SeasonCard({super.key, this.initialSeasons = Season.winter, required this.country,});

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  late Season season;

  @override
  void initState() {

    super.initState();
    season = widget.initialSeasons;
  }

  void pressed() {
  setState(() {
    switch (season) {
      case Season.winter:
        season = Season.spring;
        break;
      case Season.spring:
        season = Season.summer;
        break;
      case Season.summer:
        season = Season.fall;
        break;
      case Season.fall:
        season = Season.winter;
        break;
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Container(width:150, decoration: BoxDecoration(border: Border.all(), color: Colors.white), child: Column(
      children: [
        SizedBox(
         height: 400,
          child: GestureDetector(onTap: pressed, child: Image(image: AssetImage(season.image), fit: BoxFit.cover,))),
        Center(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(widget.country),
        ),)
      ],
    ),);
  }
}