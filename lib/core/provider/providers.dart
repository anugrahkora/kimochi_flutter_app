import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kimochi_flutter_app/features/home/view_model/home_view_model.dart';
import 'package:kimochi_flutter_app/repositories/university_repository.dart';
import 'package:kimochi_flutter_app/services/network_service.dart';

final networkServiceProvider = Provider((ref) => NetworkService());

final universityRepositoryProvider = Provider<UniversityRepository>(
  (ref) => UniversityRepository(
    networkService: 
    ref.read(networkServiceProvider)),
);

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeViewState>(
  (ref) => HomeViewModel(ref.read(universityRepositoryProvider)),
);