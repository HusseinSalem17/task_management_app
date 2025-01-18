// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTodoCollectionCollection on Isar {
  IsarCollection<TodoCollection> get todoCollections => this.collection();
}

const TodoCollectionSchema = CollectionSchema(
  name: r'TodoCollection',
  id: -4470367552813224413,
  properties: {
    r'limit': PropertySchema(
      id: 0,
      name: r'limit',
      type: IsarType.long,
    ),
    r'skip': PropertySchema(
      id: 1,
      name: r'skip',
      type: IsarType.long,
    ),
    r'total': PropertySchema(
      id: 2,
      name: r'total',
      type: IsarType.long,
    )
  },
  estimateSize: _todoCollectionEstimateSize,
  serialize: _todoCollectionSerialize,
  deserialize: _todoCollectionDeserialize,
  deserializeProp: _todoCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'todos': LinkSchema(
      id: 455991384362251924,
      name: r'todos',
      target: r'TodoDetailCollection',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _todoCollectionGetId,
  getLinks: _todoCollectionGetLinks,
  attach: _todoCollectionAttach,
  version: '3.1.0+1',
);

int _todoCollectionEstimateSize(
  TodoCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _todoCollectionSerialize(
  TodoCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.limit);
  writer.writeLong(offsets[1], object.skip);
  writer.writeLong(offsets[2], object.total);
}

TodoCollection _todoCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TodoCollection(
    limit: reader.readLongOrNull(offsets[0]),
    skip: reader.readLongOrNull(offsets[1]),
    total: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _todoCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _todoCollectionGetId(TodoCollection object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _todoCollectionGetLinks(TodoCollection object) {
  return [object.todos];
}

void _todoCollectionAttach(
    IsarCollection<dynamic> col, Id id, TodoCollection object) {
  object.todos
      .attach(col, col.isar.collection<TodoDetailCollection>(), r'todos', id);
}

extension TodoCollectionQueryWhereSort
    on QueryBuilder<TodoCollection, TodoCollection, QWhere> {
  QueryBuilder<TodoCollection, TodoCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TodoCollectionQueryWhere
    on QueryBuilder<TodoCollection, TodoCollection, QWhereClause> {
  QueryBuilder<TodoCollection, TodoCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<TodoCollection, TodoCollection, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterWhereClause> idBetween(
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

extension TodoCollectionQueryFilter
    on QueryBuilder<TodoCollection, TodoCollection, QFilterCondition> {
  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      limitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'limit',
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      limitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'limit',
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      limitEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'limit',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      limitGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'limit',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      limitLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'limit',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      limitBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'limit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      skipIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skip',
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      skipIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skip',
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      skipEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skip',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      skipGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skip',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      skipLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skip',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      skipBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skip',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      totalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      totalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      totalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      totalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TodoCollectionQueryObject
    on QueryBuilder<TodoCollection, TodoCollection, QFilterCondition> {}

extension TodoCollectionQueryLinks
    on QueryBuilder<TodoCollection, TodoCollection, QFilterCondition> {
  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition> todos(
      FilterQuery<TodoDetailCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'todos');
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      todosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'todos', length, true, length, true);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      todosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'todos', 0, true, 0, true);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      todosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'todos', 0, false, 999999, true);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      todosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'todos', 0, true, length, include);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      todosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'todos', length, include, 999999, true);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterFilterCondition>
      todosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'todos', lower, includeLower, upper, includeUpper);
    });
  }
}

extension TodoCollectionQuerySortBy
    on QueryBuilder<TodoCollection, TodoCollection, QSortBy> {
  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> sortByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.asc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> sortByLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.desc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> sortBySkip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skip', Sort.asc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> sortBySkipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skip', Sort.desc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension TodoCollectionQuerySortThenBy
    on QueryBuilder<TodoCollection, TodoCollection, QSortThenBy> {
  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> thenByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.asc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> thenByLimitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'limit', Sort.desc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> thenBySkip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skip', Sort.asc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> thenBySkipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skip', Sort.desc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension TodoCollectionQueryWhereDistinct
    on QueryBuilder<TodoCollection, TodoCollection, QDistinct> {
  QueryBuilder<TodoCollection, TodoCollection, QDistinct> distinctByLimit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'limit');
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QDistinct> distinctBySkip() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skip');
    });
  }

  QueryBuilder<TodoCollection, TodoCollection, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }
}

extension TodoCollectionQueryProperty
    on QueryBuilder<TodoCollection, TodoCollection, QQueryProperty> {
  QueryBuilder<TodoCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TodoCollection, int?, QQueryOperations> limitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'limit');
    });
  }

  QueryBuilder<TodoCollection, int?, QQueryOperations> skipProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skip');
    });
  }

  QueryBuilder<TodoCollection, int?, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }
}
