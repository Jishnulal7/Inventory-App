// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String title;
  final String id;

  bool? isDone;
  bool? isDeleted;

  Product({
    required this.title,
    required this.id,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Product copyWith({String? title, bool? isDone, bool? isDeleted, String? id}) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props => [
        title,
        id,
        isDone,
        isDeleted,
      ];
}
