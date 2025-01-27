import 'dart:convert';

import 'package:home_work_four/blok.dart/universities_events.dart';
import 'package:home_work_four/blok.dart/univertsities_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class UniversitiesBloc extends Bloc<UniversitiesEvent, UnivertsitiesState> {
  UniversitiesBloc() : super(UniversitiesInitial()) {
    on<FetchUniversities>(_onFetchUniversities);
  }

  Future<void> _onFetchUniversities (FetchUniversities event, Emitter<UnivertsitiesState> emit) async {
    emit(UniversitiesLoading());

    try {
      final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=Kazakhstan'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        emit(UniversitiesLoaded(universities: data));
      } else {
        emit(UniversitiesError(massage: 'Произошла ошибка, статус ошибки - ${response.statusCode}'));
      }
    }
    catch (e) {
      emit(UniversitiesError(massage: 'Произошла ошибка, сообщение - $e'));
    }

  }
}