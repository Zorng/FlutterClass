import 'package:flutter/material.dart';
import 'package:project2/w8/EXERCISE-4/jokes.dart';

Color appColor = Colors.green[300] as Color;

var data = jokes;

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: JokesList(),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  final String title;
  final String body;
  final int index;
  final bool isFavorite;
  final void Function(int index) setFavorite;
  const FavoriteCard({
    super.key,
    required this.title,
    required this.body,
    required this.index,
    required this.setFavorite,
    required this.isFavorite,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool _isFavorite = false;


  // I tried update the _isFavorite here. However, init is called once during not at every rebuild
  // @override
  // void initState() { 
  //
  //   //print("my state $_isFavorite");
  //   super.initState();
  // _isFavorite = widget.isFavorite
  // }

  void onFavoriteClick() {
    setState(() {
      _isFavorite = !_isFavorite;
      // And undo other favorites if _isFavorite == true

      // return new favorite index
      
    });
    if (_isFavorite) {
        widget.setFavorite(widget.index);
    }
  }




  @override
  Widget build(BuildContext context) {
    _isFavorite = widget.isFavorite;
    //print("my state $_isFavorite, my index ${widget.index}");
    return Container(
      
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(widget.body),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// 2 ways to ensure only one favorite
// 1 = rebuild other children as not favorite except the clicked child

// 2 = undo the last favorite child .. we can have a state of an index of the currently favorite child. setting favorite simply update this index
// initially it should be -1, indicating no favorites yet
// we need callback for the child to pass back its index on clicked
// the favoriteCard is not aware of index, but the JokeList does
// we can make the Card aware by passing the index

class JokesList extends StatefulWidget {
  const JokesList({super.key});

  @override
  State<JokesList> createState() => _JokesListState();
}

class _JokesListState extends State<JokesList> {
  int favoriteIndex = -1;

  void setFavorite(int index) {
    setState(() {
      favoriteIndex = index;
    });
    //print("\nclicked $index");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        //print( "favorite index $index , $favoriteIndex"); // this confirms everything is rebuilt
        var item = data[index];
        return  FavoriteCard(
          title: item.title,
          body: item.body,
          index: index,
          isFavorite: index == favoriteIndex,
          setFavorite: setFavorite,
        );
      },
    );
  }
}
