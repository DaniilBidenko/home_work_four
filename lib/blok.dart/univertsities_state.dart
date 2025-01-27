import 'package:equatable/equatable.dart';

abstract class UnivertsitiesState extends Equatable{
  @override
  List<Object> get props => [];
}

class UniversitiesInitial extends UnivertsitiesState {}

class UniversitiesLoading extends UnivertsitiesState {}

class UniversitiesLoaded extends UnivertsitiesState {
  final List<dynamic> universities;

  UniversitiesLoaded({required this.universities});
  @override
  List<Object> get props => [universities];
}


class UniversitiesError extends UnivertsitiesState {
  final String massage;

  UniversitiesError({required this.massage});
  @override
  List<Object> get props => [massage];
}