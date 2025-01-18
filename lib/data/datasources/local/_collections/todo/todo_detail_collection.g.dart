// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_detail_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTodoDetailCollectionCollection on Isar {
  IsarCollection<TodoDetailCollection> get todoDetailCollections =>
      this.collection();
}

const TodoDetailCollectionSchema = CollectionSchema(
  name: r'TodoDetailCollection',
  id: 5407583293540590795,
  properties: {
    r'completed': PropertySchema(
      id: 0,
      name: r'completed',
      type: IsarType.bool,
    ),
    r'todo': PropertySchema(
      id: 1,
      name: r'todo',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 2,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _todoDetailCollectionEstimateSize,
  serialize: _todoDetailCollectionSerialize,
  deserialize: _todoDetailCollectionDeserialize,
  deserializeProp: _todoDetailCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _todoDetailCollectionGetId,
  getLinks: _todoDetailCollectionGetLinks,
  attach: _todoDetailCollectionAttach,
  version: '3.1.0+1',
);

int _todoDetailCollectionEstimateSize(
  TodoDetailCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.todo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _todoDetailCollectionSerialize(
  TodoDetailCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.completed);
  writer.writeString(offsets[1], object.todo);
  writer.writeLong(offsets[2], object.userId);
}

TodoDetailCollection _todoDetailCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TodoDetailCollection(
    completed: reader.readBoolOrNull(offsets[0]),
    id: id,
    todo: reader.readStringOrNull(offsets[1]),
    userId: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _todoDetailCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _todoDetailCollectionGetId(TodoDetailCollection object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _todoDetailCollectionGetLinks(
    TodoDetailCollection object) {
  return [];
}

void _todoDetailCollectionAttach(
    IsarCollection<dynamic> col, Id id, TodoDetailCollection object) {}

extension TodoDetailCollectionQueryWhereSort
    on QueryBuilder<TodoDetailCollection, TodoDetailCollection, QWhere> {
  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TodoDetailCollectionQueryWhere
    on QueryBuilder<TodoDetailCollection, TodoDetailCollection, QWhereClause> {
  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TodoDetailCollectionQueryFilter on QueryBuilder<TodoDetailCollection,
    TodoDetailCollection, QFilterCondition> {
  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> completedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completed',
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> completedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completed',
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> completedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completed',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> todoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'todo',
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> todoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'todo',
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> todoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> todoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'todo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> todoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'todo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> todoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'todo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> todoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'todo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> todoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'todo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
          QAfterFilterCondition>
      todoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'todo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
          QAfterFilterCondition>
      todoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'todo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> todoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todo',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> todoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'todo',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> userIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> userIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> userIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection,
      QAfterFilterCondition> userIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TodoDetailCollectionQueryObject on QueryBuilder<TodoDetailCollection,
    TodoDetailCollection, QFilterCondition> {}

extension TodoDetailCollectionQueryLinks on QueryBuilder<TodoDetailCollection,
    TodoDetailCollection, QFilterCondition> {}

extension TodoDetailCollectionQuerySortBy
    on QueryBuilder<TodoDetailCollection, TodoDetailCollection, QSortBy> {
  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      sortByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      sortByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      sortByTodo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todo', Sort.asc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      sortByTodoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todo', Sort.desc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension TodoDetailCollectionQuerySortThenBy
    on QueryBuilder<TodoDetailCollection, TodoDetailCollection, QSortThenBy> {
  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      thenByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      thenByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      thenByTodo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todo', Sort.asc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      thenByTodoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todo', Sort.desc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension TodoDetailCollectionQueryWhereDistinct
    on QueryBuilder<TodoDetailCollection, TodoDetailCollection, QDistinct> {
  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QDistinct>
      distinctByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completed');
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QDistinct>
      distinctByTodo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'todo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TodoDetailCollection, TodoDetailCollection, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension TodoDetailCollectionQueryProperty on QueryBuilder<
    TodoDetailCollection, TodoDetailCollection, QQueryProperty> {
  QueryBuilder<TodoDetailCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TodoDetailCollection, bool?, QQueryOperations>
      completedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completed');
    });
  }

  QueryBuilder<TodoDetailCollection, String?, QQueryOperations> todoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'todo');
    });
  }

  QueryBuilder<TodoDetailCollection, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
