part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoryEntity> category;

  const CategoriesSuccess(this.category);
}

class CategoriesFailure extends CategoriesState {
  final String errMessage;

  const CategoriesFailure(this.errMessage);
}
