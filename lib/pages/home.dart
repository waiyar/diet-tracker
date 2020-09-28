import 'package:diet_tracker/data/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  final Widget titleSection = Container(
    padding: const EdgeInsets.all(20),
    child: Text(
      'Today',
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 64.0, fontWeight: FontWeight.bold),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Widget mainSection = Container(
      padding: const EdgeInsets.all(20),
      child: Provider<MyDatabase>(
        create: (context) => MyDatabase(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMealColumn(mealType.breakfast),
            _buildMealColumn(mealType.lunch),
            _buildMealColumn(mealType.dinner),
          ],
        ),
        dispose: (context, db) => db.close(),
      ),
    );

    return Scaffold(
      // Allow scrolling
      body: ListView(
        children: [
          titleSection,
          mainSection,
        ],
      ),
    );
  }

  Container _buildMealColumn(mealType type) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: FoodList(type),
    );
  }
}

class FoodList extends StatelessWidget {
  final mealType type;
  FoodList(this.type);

  @override
  Widget build(BuildContext context) {
    final myDatabase = Provider.of<MyDatabase>(context);

    return FutureBuilder<MealWithEntries>(
        future: myDatabase.createEmptyMeal(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Column();
          }
          return Column(
            // Children to fill entire row
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title and + icon
              Row(
                children: [
                  Expanded(
                    child: Text(
                      type.title,
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  AddFoodButton(snapshot.data),
                ],
              ),
              // List of Food
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: StreamBuilder<List<Food>>(
                  stream: myDatabase.watchFoodInMeal(snapshot.data.meal),
                  builder: (context, s) {
                    if (s.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List<Text>.generate(
                          s.data.length,
                          (index) => Text(
                            s.data[index].name,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    );
                  },
                ),
              ),
            ],
          );
        });
  }
}

class AddFoodButton extends StatefulWidget {
  final meal;
  AddFoodButton(this.meal);
  @override
  _AddFoodButtonState createState() => _AddFoodButtonState(meal);
}

class _AddFoodButtonState extends State<AddFoodButton> {
  final addContoller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final MealWithEntries meal;
  _AddFoodButtonState(this.meal);

  _addFood() async {
    // TODO: implement tags
    final myDatabase = Provider.of<MyDatabase>(context, listen: false);

    final int foodId = await myDatabase.insertFood(addContoller.text);
    meal.foods.add(Food(id: foodId, name: addContoller.text));
    await myDatabase.insertMealWithFood(meal);
  }

  Future<void> _showAddDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: AlertDialog(
            title: Text('Add Food'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'What did you eat'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter something';
                      }
                      return null;
                    },
                    controller: addContoller,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  addContoller.clear();
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Add'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _addFood();
                    addContoller.clear();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: IconButton(
        icon: Icon(Icons.add),
        color: Colors.black,
        onPressed: _showAddDialog,
        // onPressed: _addFood,
        iconSize: 30.0,
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    addContoller.dispose();
    super.dispose();
  }
}
