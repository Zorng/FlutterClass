import 'package:flutter/material.dart';
import 'package:project2/w10/START/models/grocery.dart';
import 'package:project2/w10/START/ui/groceries/grocery_form.dart';
import '../../data/mock_grocery_repository.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void onCreate() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute<Grocery>(builder: (context) => NewItem()),
    );

    if (result != null) {
      //print(result);
      setState(() {
        dummyGroceryItems.add(result);
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: dummyGroceryItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final groceryItem = dummyGroceryItems[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(43, 158, 158, 158),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: GroceryTile(grocery: groceryItem),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(color: grocery.category.color),
      ),
      title: Text(grocery.name),
      trailing: Text("${grocery.quantity}"),
    );
  }
}
