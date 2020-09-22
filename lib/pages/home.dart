import 'package:diet_tracker/models/Food.dart';
import 'package:diet_tracker/models/foodListModel.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMealColumn('Breakfast'),
          _buildMealColumn('Lunch'),
          _buildMealColumn('Dinner'),
        ],
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

  Container _buildMealColumn(String label) {
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
      child: ChangeNotifierProvider(
        create: (context) => FoodListModel(),
        child: FoodList(label),
      ),
    );
  }
}

class FoodList extends StatelessWidget {
  final String label;
  FoodList(this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      // Children to fill entire row
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title and + icon
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            AddFoodButton(),
          ],
        ),
        // List of Food
        Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: Consumer<FoodListModel>(
            builder: (context, foodList, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Text>.generate(
                foodList.foods.length,
                (index) => Text(
                  foodList.foods[index].name,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddFoodButton extends StatefulWidget {
  @override
  _AddFoodButtonState createState() => _AddFoodButtonState();
}

class _AddFoodButtonState extends State<AddFoodButton> {
  final addContoller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _addFood() {
    // TODO: id from database;
    // TODO: implement tags
    final Food food = new Food(1, "test", [1, 2, 3]);
    Provider.of<FoodListModel>(context, listen: false).add(food);
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
