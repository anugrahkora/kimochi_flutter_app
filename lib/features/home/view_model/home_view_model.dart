import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kimochi_flutter_app/models/university.dart';
import 'package:kimochi_flutter_app/repositories/university_repository.dart';

class HomeViewState {
  final List<University> universities;
  final bool isLoading;
  final String? error;

  HomeViewState({
    this.universities = const [],
    this.isLoading = false,
    this.error,
  });

  HomeViewState copyWith({
    List<University>? universities,
    bool? isLoading,
    String? error,
  }) {
    return HomeViewState(
      universities: universities ?? this.universities,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeViewState> {
  final UniversityRepository repository;

  HomeViewModel(this.repository) : super(HomeViewState());

  Future<void> fetchUniversities(String country) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await repository.getUniversities(country);
      state = state.copyWith(universities: result, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}