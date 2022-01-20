import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map currentFilters;

  const FilterScreen(this.saveFilters, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchTile(
      String title, String description, bool currentvalue, var updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.pink,
        ),
      ),
      value: currentvalue,
      subtitle: Text(
        description,
        style: TextStyle(
          fontSize: 10,
        ),
      ),
      onChanged: updateValue,
      activeColor: Colors.pink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your Meal selection",
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchTile(
                  "Gluten-free",
                  "Only include gluten-free meals",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchTile(
                  "Lactose-free",
                  "Only include Lactose-free meals",
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchTile(
                  "Vegan",
                  "Only include vegan meals",
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                buildSwitchTile(
                  "Vegetarian",
                  "Only include Vegetarian meals",
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
