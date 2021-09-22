import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pattern_bloc/data/model/model.dart';

abstract class ProductState extends Equatable {}

class ProductInitialState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadinglState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  final ProductModel? product;
  ProductLoadedState({@required this.product});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ProductErrorState extends ProductState {
  String? message;

  ProductErrorState({@required this.message});

  @override
  List<Object?> get props => throw UnimplementedError();
}
