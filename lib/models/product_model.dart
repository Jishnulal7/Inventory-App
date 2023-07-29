// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String title;
  final String id;
  final String description;
  final String quantity;
  final String date;
  final String rate;

  bool? isDone;
  bool? isDeleted;
  bool? isOutofStock;

  Product(
      {required this.date,
      required this.rate,
      required this.quantity,
      required this.description,
      required this.title,
      required this.id,
      this.isDone,
      this.isDeleted,
      this.isOutofStock}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isOutofStock = isOutofStock ?? false;
  }

  Product copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
    bool? isOutofStock,
    String? id,
    String? description,
    String? quantity,
    String? date,
    String? rate,
  }) {
    return Product(
      id: id ?? this.id,
      date: date ?? this.date,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isOutofStock: isOutofStock ?? this.isOutofStock,
      isDeleted: isDeleted ?? this.isDeleted,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      rate: rate ?? this.rate,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'title': title,
  //     'id': id,
  //     'isDone': isDone,
  //     'isDeleted': isDeleted,
  //     'description': description,
  //     'quantity': quantity,
  //     'isOutofStock': isOutofStock,
  //     'date': date,
  //   };
  // }
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'quantity': quantity});
    result.addAll({'id': id});
    result.addAll({'date': date});
    result.addAll({'rate': rate});
    if (isDone != null) {
      result.addAll({'isDone': isDone});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }
    if (isOutofStock != null) {
      result.addAll({'isOutofStock': isOutofStock});
    }

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      isDone: map['isDone'],
      isOutofStock: map['isOutofStock'],
      isDeleted: map['isDeleted'],
      description: map['description'] ?? '',
      quantity: map['quantity'] ?? '',
      date: map['date'] ?? '',
      rate: map['rate'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        quantity,
        id,
        isDone,
        isDeleted,
        date,
        rate,
        isOutofStock,
      ];
}
