// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Food extends DataClass implements Insertable<Food> {
  final int id;
  final String name;
  Food({@required this.id, @required this.name});
  factory Food.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Food(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  FoodsCompanion toCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Food copyWith({int id, String name}) => Food(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Food && other.id == this.id && other.name == this.name);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<int> id;
  final Value<String> name;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<Food> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  FoodsCompanion copyWith({Value<int> id, Value<String> name}) {
    return FoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $FoodsTable extends Foods with TableInfo<$FoodsTable, Food> {
  final GeneratedDatabase _db;
  final String _alias;
  $FoodsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $FoodsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'foods';
  @override
  final String actualTableName = 'foods';
  @override
  VerificationContext validateIntegrity(Insertable<Food> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Food map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Food.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FoodsTable createAlias(String alias) {
    return $FoodsTable(_db, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final int tagId;
  final String name;
  Tag({@required this.tagId, @required this.name});
  factory Tag.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Tag(
      tagId: intType.mapFromDatabaseResponse(data['${effectivePrefix}tag_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || tagId != null) {
      map['tag_id'] = Variable<int>(tagId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      tagId:
          tagId == null && nullToAbsent ? const Value.absent() : Value(tagId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Tag(
      tagId: serializer.fromJson<int>(json['tagId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tagId': serializer.toJson<int>(tagId),
      'name': serializer.toJson<String>(name),
    };
  }

  Tag copyWith({int tagId, String name}) => Tag(
        tagId: tagId ?? this.tagId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('tagId: $tagId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(tagId.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Tag && other.tagId == this.tagId && other.name == this.name);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<int> tagId;
  final Value<String> name;
  const TagsCompanion({
    this.tagId = const Value.absent(),
    this.name = const Value.absent(),
  });
  TagsCompanion.insert({
    this.tagId = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<Tag> custom({
    Expression<int> tagId,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (tagId != null) 'tag_id': tagId,
      if (name != null) 'name': name,
    });
  }

  TagsCompanion copyWith({Value<int> tagId, Value<String> name}) {
    return TagsCompanion(
      tagId: tagId ?? this.tagId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('tagId: $tagId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  final GeneratedDatabase _db;
  final String _alias;
  $TagsTable(this._db, [this._alias]);
  final VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  GeneratedIntColumn _tagId;
  @override
  GeneratedIntColumn get tagId => _tagId ??= _constructTagId();
  GeneratedIntColumn _constructTagId() {
    return GeneratedIntColumn('tag_id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [tagId, name];
  @override
  $TagsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tags';
  @override
  final String actualTableName = 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id'], _tagIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tagId};
  @override
  Tag map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Tag.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(_db, alias);
  }
}

class FoodTag extends DataClass implements Insertable<FoodTag> {
  final int id;
  final int foodId;
  final int tagId;
  FoodTag({@required this.id, @required this.foodId, @required this.tagId});
  factory FoodTag.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return FoodTag(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      foodId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}food_id']),
      tagId: intType.mapFromDatabaseResponse(data['${effectivePrefix}tag_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || foodId != null) {
      map['food_id'] = Variable<int>(foodId);
    }
    if (!nullToAbsent || tagId != null) {
      map['tag_id'] = Variable<int>(tagId);
    }
    return map;
  }

  FoodTagsCompanion toCompanion(bool nullToAbsent) {
    return FoodTagsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      foodId:
          foodId == null && nullToAbsent ? const Value.absent() : Value(foodId),
      tagId:
          tagId == null && nullToAbsent ? const Value.absent() : Value(tagId),
    );
  }

  factory FoodTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FoodTag(
      id: serializer.fromJson<int>(json['id']),
      foodId: serializer.fromJson<int>(json['foodId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'foodId': serializer.toJson<int>(foodId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  FoodTag copyWith({int id, int foodId, int tagId}) => FoodTag(
        id: id ?? this.id,
        foodId: foodId ?? this.foodId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('FoodTag(')
          ..write('id: $id, ')
          ..write('foodId: $foodId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(foodId.hashCode, tagId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FoodTag &&
          other.id == this.id &&
          other.foodId == this.foodId &&
          other.tagId == this.tagId);
}

class FoodTagsCompanion extends UpdateCompanion<FoodTag> {
  final Value<int> id;
  final Value<int> foodId;
  final Value<int> tagId;
  const FoodTagsCompanion({
    this.id = const Value.absent(),
    this.foodId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  FoodTagsCompanion.insert({
    this.id = const Value.absent(),
    @required int foodId,
    @required int tagId,
  })  : foodId = Value(foodId),
        tagId = Value(tagId);
  static Insertable<FoodTag> custom({
    Expression<int> id,
    Expression<int> foodId,
    Expression<int> tagId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (foodId != null) 'food_id': foodId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  FoodTagsCompanion copyWith(
      {Value<int> id, Value<int> foodId, Value<int> tagId}) {
    return FoodTagsCompanion(
      id: id ?? this.id,
      foodId: foodId ?? this.foodId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (foodId.present) {
      map['food_id'] = Variable<int>(foodId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodTagsCompanion(')
          ..write('id: $id, ')
          ..write('foodId: $foodId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $FoodTagsTable extends FoodTags with TableInfo<$FoodTagsTable, FoodTag> {
  final GeneratedDatabase _db;
  final String _alias;
  $FoodTagsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _foodIdMeta = const VerificationMeta('foodId');
  GeneratedIntColumn _foodId;
  @override
  GeneratedIntColumn get foodId => _foodId ??= _constructFoodId();
  GeneratedIntColumn _constructFoodId() {
    return GeneratedIntColumn(
      'food_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  GeneratedIntColumn _tagId;
  @override
  GeneratedIntColumn get tagId => _tagId ??= _constructTagId();
  GeneratedIntColumn _constructTagId() {
    return GeneratedIntColumn(
      'tag_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, foodId, tagId];
  @override
  $FoodTagsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'food_tags';
  @override
  final String actualTableName = 'food_tags';
  @override
  VerificationContext validateIntegrity(Insertable<FoodTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('food_id')) {
      context.handle(_foodIdMeta,
          foodId.isAcceptableOrUnknown(data['food_id'], _foodIdMeta));
    } else if (isInserting) {
      context.missing(_foodIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id'], _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodTag map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FoodTag.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FoodTagsTable createAlias(String alias) {
    return $FoodTagsTable(_db, alias);
  }
}

class Meal extends DataClass implements Insertable<Meal> {
  final int id;
  final DateTime date;
  final int type;
  Meal({@required this.id, @required this.date, @required this.type});
  factory Meal.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Meal(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      type: intType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<int>(type);
    }
    return map;
  }

  MealsCompanion toCompanion(bool nullToAbsent) {
    return MealsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  factory Meal.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Meal(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<int>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<int>(type),
    };
  }

  Meal copyWith({int id, DateTime date, int type}) => Meal(
        id: id ?? this.id,
        date: date ?? this.date,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(date.hashCode, type.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Meal &&
          other.id == this.id &&
          other.date == this.date &&
          other.type == this.type);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> type;
  const MealsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
  });
  MealsCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime date,
    @required int type,
  })  : date = Value(date),
        type = Value(type);
  static Insertable<Meal> custom({
    Expression<int> id,
    Expression<DateTime> date,
    Expression<int> type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
    });
  }

  MealsCompanion copyWith(
      {Value<int> id, Value<DateTime> date, Value<int> type}) {
    return MealsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $MealsTable extends Meals with TableInfo<$MealsTable, Meal> {
  final GeneratedDatabase _db;
  final String _alias;
  $MealsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedIntColumn _type;
  @override
  GeneratedIntColumn get type => _type ??= _constructType();
  GeneratedIntColumn _constructType() {
    return GeneratedIntColumn(
      'type',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, date, type];
  @override
  $MealsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'meals';
  @override
  final String actualTableName = 'meals';
  @override
  VerificationContext validateIntegrity(Insertable<Meal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Meal map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Meal.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MealsTable createAlias(String alias) {
    return $MealsTable(_db, alias);
  }
}

class MealEntry extends DataClass implements Insertable<MealEntry> {
  final int mealId;
  final int foodId;
  MealEntry({@required this.mealId, @required this.foodId});
  factory MealEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return MealEntry(
      mealId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}meal_id']),
      foodId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}food_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || mealId != null) {
      map['meal_id'] = Variable<int>(mealId);
    }
    if (!nullToAbsent || foodId != null) {
      map['food_id'] = Variable<int>(foodId);
    }
    return map;
  }

  MealEntriesCompanion toCompanion(bool nullToAbsent) {
    return MealEntriesCompanion(
      mealId:
          mealId == null && nullToAbsent ? const Value.absent() : Value(mealId),
      foodId:
          foodId == null && nullToAbsent ? const Value.absent() : Value(foodId),
    );
  }

  factory MealEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MealEntry(
      mealId: serializer.fromJson<int>(json['mealId']),
      foodId: serializer.fromJson<int>(json['foodId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mealId': serializer.toJson<int>(mealId),
      'foodId': serializer.toJson<int>(foodId),
    };
  }

  MealEntry copyWith({int mealId, int foodId}) => MealEntry(
        mealId: mealId ?? this.mealId,
        foodId: foodId ?? this.foodId,
      );
  @override
  String toString() {
    return (StringBuffer('MealEntry(')
          ..write('mealId: $mealId, ')
          ..write('foodId: $foodId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(mealId.hashCode, foodId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MealEntry &&
          other.mealId == this.mealId &&
          other.foodId == this.foodId);
}

class MealEntriesCompanion extends UpdateCompanion<MealEntry> {
  final Value<int> mealId;
  final Value<int> foodId;
  const MealEntriesCompanion({
    this.mealId = const Value.absent(),
    this.foodId = const Value.absent(),
  });
  MealEntriesCompanion.insert({
    @required int mealId,
    @required int foodId,
  })  : mealId = Value(mealId),
        foodId = Value(foodId);
  static Insertable<MealEntry> custom({
    Expression<int> mealId,
    Expression<int> foodId,
  }) {
    return RawValuesInsertable({
      if (mealId != null) 'meal_id': mealId,
      if (foodId != null) 'food_id': foodId,
    });
  }

  MealEntriesCompanion copyWith({Value<int> mealId, Value<int> foodId}) {
    return MealEntriesCompanion(
      mealId: mealId ?? this.mealId,
      foodId: foodId ?? this.foodId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mealId.present) {
      map['meal_id'] = Variable<int>(mealId.value);
    }
    if (foodId.present) {
      map['food_id'] = Variable<int>(foodId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealEntriesCompanion(')
          ..write('mealId: $mealId, ')
          ..write('foodId: $foodId')
          ..write(')'))
        .toString();
  }
}

class $MealEntriesTable extends MealEntries
    with TableInfo<$MealEntriesTable, MealEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $MealEntriesTable(this._db, [this._alias]);
  final VerificationMeta _mealIdMeta = const VerificationMeta('mealId');
  GeneratedIntColumn _mealId;
  @override
  GeneratedIntColumn get mealId => _mealId ??= _constructMealId();
  GeneratedIntColumn _constructMealId() {
    return GeneratedIntColumn(
      'meal_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _foodIdMeta = const VerificationMeta('foodId');
  GeneratedIntColumn _foodId;
  @override
  GeneratedIntColumn get foodId => _foodId ??= _constructFoodId();
  GeneratedIntColumn _constructFoodId() {
    return GeneratedIntColumn(
      'food_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [mealId, foodId];
  @override
  $MealEntriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'meal_entries';
  @override
  final String actualTableName = 'meal_entries';
  @override
  VerificationContext validateIntegrity(Insertable<MealEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('meal_id')) {
      context.handle(_mealIdMeta,
          mealId.isAcceptableOrUnknown(data['meal_id'], _mealIdMeta));
    } else if (isInserting) {
      context.missing(_mealIdMeta);
    }
    if (data.containsKey('food_id')) {
      context.handle(_foodIdMeta,
          foodId.isAcceptableOrUnknown(data['food_id'], _foodIdMeta));
    } else if (isInserting) {
      context.missing(_foodIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  MealEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MealEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MealEntriesTable createAlias(String alias) {
    return $MealEntriesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FoodsTable _foods;
  $FoodsTable get foods => _foods ??= $FoodsTable(this);
  $TagsTable _tags;
  $TagsTable get tags => _tags ??= $TagsTable(this);
  $FoodTagsTable _foodTags;
  $FoodTagsTable get foodTags => _foodTags ??= $FoodTagsTable(this);
  $MealsTable _meals;
  $MealsTable get meals => _meals ??= $MealsTable(this);
  $MealEntriesTable _mealEntries;
  $MealEntriesTable get mealEntries => _mealEntries ??= $MealEntriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [foods, tags, foodTags, meals, mealEntries];
}
