// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Memo extends DataClass implements Insertable<Memo> {
  final String supplementName;
  final String quantity;
  final String bestBefore;
  Memo(
      {required this.supplementName,
      required this.quantity,
      required this.bestBefore});
  factory Memo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Memo(
      supplementName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}supplement_name'])!,
      quantity: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity'])!,
      bestBefore: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}best_before'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['supplement_name'] = Variable<String>(supplementName);
    map['quantity'] = Variable<String>(quantity);
    map['best_before'] = Variable<String>(bestBefore);
    return map;
  }

  MemosCompanion toCompanion(bool nullToAbsent) {
    return MemosCompanion(
      supplementName: Value(supplementName),
      quantity: Value(quantity),
      bestBefore: Value(bestBefore),
    );
  }

  factory Memo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Memo(
      supplementName: serializer.fromJson<String>(json['supplementName']),
      quantity: serializer.fromJson<String>(json['quantity']),
      bestBefore: serializer.fromJson<String>(json['bestBefore']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'supplementName': serializer.toJson<String>(supplementName),
      'quantity': serializer.toJson<String>(quantity),
      'bestBefore': serializer.toJson<String>(bestBefore),
    };
  }

  Memo copyWith(
          {String? supplementName, String? quantity, String? bestBefore}) =>
      Memo(
        supplementName: supplementName ?? this.supplementName,
        quantity: quantity ?? this.quantity,
        bestBefore: bestBefore ?? this.bestBefore,
      );
  @override
  String toString() {
    return (StringBuffer('Memo(')
          ..write('supplementName: $supplementName, ')
          ..write('quantity: $quantity, ')
          ..write('bestBefore: $bestBefore')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(supplementName, quantity, bestBefore);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Memo &&
          other.supplementName == this.supplementName &&
          other.quantity == this.quantity &&
          other.bestBefore == this.bestBefore);
}

class MemosCompanion extends UpdateCompanion<Memo> {
  final Value<String> supplementName;
  final Value<String> quantity;
  final Value<String> bestBefore;
  const MemosCompanion({
    this.supplementName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.bestBefore = const Value.absent(),
  });
  MemosCompanion.insert({
    required String supplementName,
    required String quantity,
    required String bestBefore,
  })  : supplementName = Value(supplementName),
        quantity = Value(quantity),
        bestBefore = Value(bestBefore);
  static Insertable<Memo> custom({
    Expression<String>? supplementName,
    Expression<String>? quantity,
    Expression<String>? bestBefore,
  }) {
    return RawValuesInsertable({
      if (supplementName != null) 'supplement_name': supplementName,
      if (quantity != null) 'quantity': quantity,
      if (bestBefore != null) 'best_before': bestBefore,
    });
  }

  MemosCompanion copyWith(
      {Value<String>? supplementName,
      Value<String>? quantity,
      Value<String>? bestBefore}) {
    return MemosCompanion(
      supplementName: supplementName ?? this.supplementName,
      quantity: quantity ?? this.quantity,
      bestBefore: bestBefore ?? this.bestBefore,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (supplementName.present) {
      map['supplement_name'] = Variable<String>(supplementName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<String>(quantity.value);
    }
    if (bestBefore.present) {
      map['best_before'] = Variable<String>(bestBefore.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemosCompanion(')
          ..write('supplementName: $supplementName, ')
          ..write('quantity: $quantity, ')
          ..write('bestBefore: $bestBefore')
          ..write(')'))
        .toString();
  }
}

class $MemosTable extends Memos with TableInfo<$MemosTable, Memo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemosTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _supplementNameMeta =
      const VerificationMeta('supplementName');
  @override
  late final GeneratedColumn<String?> supplementName = GeneratedColumn<String?>(
      'supplement_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<String?> quantity = GeneratedColumn<String?>(
      'quantity', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _bestBeforeMeta = const VerificationMeta('bestBefore');
  @override
  late final GeneratedColumn<String?> bestBefore = GeneratedColumn<String?>(
      'best_before', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [supplementName, quantity, bestBefore];
  @override
  String get aliasedName => _alias ?? 'memos';
  @override
  String get actualTableName => 'memos';
  @override
  VerificationContext validateIntegrity(Insertable<Memo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('supplement_name')) {
      context.handle(
          _supplementNameMeta,
          supplementName.isAcceptableOrUnknown(
              data['supplement_name']!, _supplementNameMeta));
    } else if (isInserting) {
      context.missing(_supplementNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('best_before')) {
      context.handle(
          _bestBeforeMeta,
          bestBefore.isAcceptableOrUnknown(
              data['best_before']!, _bestBeforeMeta));
    } else if (isInserting) {
      context.missing(_bestBeforeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {supplementName};
  @override
  Memo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Memo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MemosTable createAlias(String alias) {
    return $MemosTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MemosTable memos = $MemosTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [memos];
}
