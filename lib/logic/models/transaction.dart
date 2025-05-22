import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction extends Equatable {
  final String id;
  final String date;
  final String sum;
  final TransactionType type;
  final TransactionCategory category;

  const Transaction({
    required this.id,
    required this.date,
    required this.sum,
    required this.type,
    required this.category,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  @override
  List<Object?> get props => [id];
}

List<Map<String, dynamic>> parseTransactionsListToJson(
    List<Transaction> transactions) {
  return transactions.map((t) => t.toJson()).toList();
}

List<Transaction> parseJsonToTransactionsList(List<Map<String, dynamic>> json) {
  return json.map((j) => Transaction.fromJson(j)).toList();
}

enum TransactionType {
  replenishment,
  writeoff;

  String get name {
    switch (this) {
      case TransactionType.replenishment:
        return 'Зачисление';
      case TransactionType.writeoff:
        return 'Списание';
    }
  }
}

enum TransactionCategory {
  transport,
  health,
  food,
  clothes,
  other;

  String get name {
    switch (this) {
      case TransactionCategory.transport:
        return 'Транспорт';
      case TransactionCategory.health:
        return 'Здоровье';
      case TransactionCategory.food:
        return 'Еда';
      case TransactionCategory.clothes:
        return 'Одежда';
      case TransactionCategory.other:
        return 'Другое';
    }
  }

  IconData get icon {
    switch (this) {
      case TransactionCategory.transport:
        return CupertinoIcons.train_style_two;
      case TransactionCategory.health:
        return CupertinoIcons.heart_fill;
      case TransactionCategory.food:
        return CupertinoIcons.cart;
      case TransactionCategory.clothes:
        return CupertinoIcons.tag;
      case TransactionCategory.other:
        return CupertinoIcons.creditcard;
    }
  }

  Color get color {
    switch (this) {
      case TransactionCategory.transport:
        return Colors.blue;
      case TransactionCategory.health:
        return Colors.red;
      case TransactionCategory.food:
        return Colors.orange;
      case TransactionCategory.clothes:
        return Colors.lightGreen;
      case TransactionCategory.other:
        return Colors.blueGrey;
    }
  }
}
