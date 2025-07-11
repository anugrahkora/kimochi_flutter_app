import 'dart:convert';

import 'package:kimochi_flutter_app/core/constants/app_constants.dart';
import 'package:kimochi_flutter_app/models/university.dart';
import 'package:kimochi_flutter_app/services/network_service.dart';

// Repository class for fetching university data
// It uses the NetworkService to make HTTP requests
 class UniversityRepository {
final NetworkService networkService;

  UniversityRepository({required this.networkService});

// Method to fetch universities based on the country
  Future<List<University>> getUniversities(String country) async {
    final response = await networkService.get(
      '${AppConstants.baseUrl}/search?country=$country',
    );
    final data=json.decode(response.body) as List;

    return data.map<University>((json) => University.fromJson(json)).toList();
  }
}