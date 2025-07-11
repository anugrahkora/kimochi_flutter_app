import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kimochi_flutter_app/features/home/view_model/home_view_model.dart';
import 'package:kimochi_flutter_app/repositories/university_repository.dart';
import 'package:kimochi_flutter_app/services/network_service.dart';

// This file contains the providers used in the application
// It follows the dependency injection pattern using Riverpod


// Provider for the NetworkService
final networkServiceProvider = Provider((ref) => NetworkService());

// Provider for the UniversityRepository
final universityRepositoryProvider = Provider<UniversityRepository>(
  (ref) => UniversityRepository(
    networkService: 
    ref.read(networkServiceProvider)),
);

// Provider for the HomeViewModel
final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeViewState>(
  (ref) => HomeViewModel(ref.read(universityRepositoryProvider)),
);