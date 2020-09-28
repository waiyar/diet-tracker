import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database.g.dart';

enum mealType {
  breakfast,
  lunch,
  dinner,
}

extension mealTypeExtension on mealType {
  String get title {
    switch (this) {
      case mealType.breakfast:
        return 'Breakfast';
      case mealType.lunch:
        return 'Lunch';
      case mealType.dinner:
        return 'Dinner';
      default:
        return null;
    }
  }
}

class Foods extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class Tags extends Table {
  IntColumn get tagId => integer().autoIncrement()();
  TextColumn get name => text()();
}

// Maps tags to foods
class FoodTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get foodId => integer()();
  IntColumn get tagId => integer()();
}

class Meals extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get type => integer()();
}

@DataClassName('MealEntry')
class MealEntries extends Table {
  IntColumn get mealId => integer()();
  IntColumn get foodId => integer()();
}

class MealWithEntries {
  final Meal meal;
  final List<Food> foods;

  MealWithEntries(this.meal, this.foods);
}

// TODO: implement tags later
class FoodWithTags {
  final Food food;
  final List<Tag> tags;

  FoodWithTags(this.food, this.tags);
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Foods, Tags, FoodTags, Meals, MealEntries])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Future<void> insertMealWithFood(MealWithEntries fullMeal) async {
    return transaction(() async {
      // Delete old entries
      await (delete(mealEntries)
            ..where((row) => row.mealId.equals(fullMeal.meal.id)))
          .go();
      // Write to food-meal map
      for (final food in fullMeal.foods) {
        // Write to mapping table
        await into(mealEntries)
            .insert(MealEntry(mealId: fullMeal.meal.id, foodId: food.id));
      }
    });
  }

  Future<int> insertFood(String foodName) =>
      into(foods).insert(FoodsCompanion(name: Value(foodName)));

  Future<MealWithEntries> createEmptyMeal(mealType type) async {
    final DateTime now = new DateTime.now();
    // Use only date portion
    final DateTime date = new DateTime(
      now.year,
      now.month,
      now.day,
    );
    // Check if meal already exists
    final Meal currentMeal = await (select(meals)
          ..where((m) => m.date.equals(date) & m.type.equals(type.index)))
        .getSingle();
    if (currentMeal != null) {
      final query = select(foods).join(
          [innerJoin(mealEntries, mealEntries.foodId.equalsExp(foods.id))])
        ..where(mealEntries.mealId.equals(currentMeal.id));

      final List<Food> existingFoods =
          await query.map((row) => row.readTable(foods)).get();
      return MealWithEntries(currentMeal, existingFoods);
    }

    final int id = await into(meals)
        .insert(new MealsCompanion(date: Value(date), type: Value(type.index)));
    final Meal meal = new Meal(id: id, date: date, type: type.index);
    return MealWithEntries(meal, []);
  }

  // Future<int> insertTag(TagsCompanion tag) => into(tags).insert(tag);

  Stream<List<Food>> watchFoodInMeal(Meal meal) {
    final query = select(foods)
        .join([innerJoin(mealEntries, mealEntries.foodId.equalsExp(foods.id))])
          ..where(mealEntries.mealId.equals(meal.id));
    return query.map((row) => row.readTable(foods)).watch();
  }
}
