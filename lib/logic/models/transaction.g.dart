// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String,
      date: json['date'] as String,
      sum: json['sum'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      category: $enumDecode(_$TransactionCategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'sum': instance.sum,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'category': _$TransactionCategoryEnumMap[instance.category]!,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.replenishment: 'replenishment',
  TransactionType.writeoff: 'writeoff',
};

const _$TransactionCategoryEnumMap = {
  TransactionCategory.transport: 'transport',
  TransactionCategory.health: 'health',
  TransactionCategory.food: 'food',
  TransactionCategory.clothes: 'clothes',
  TransactionCategory.other: 'other',
};
