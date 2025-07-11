import 'package:flutter/material.dart';
import 'package:kimochi_flutter_app/models/university.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsView extends StatelessWidget {
  final University? universityDetails;
  const DetailsView({super.key, required this.universityDetails});

  @override
  Widget build(BuildContext context) {
    final name = universityDetails?.name ?? 'University Details';
    final country = universityDetails?.country ?? 'N/A';
    final webPages = universityDetails?.webPages?.isNotEmpty == true
        ? universityDetails!.webPages!.first
        : null;
    final stateProvince = universityDetails?.stateProvince ?? 'N/A';
    final alphaTwoCode = universityDetails?.alphaTwoCode ?? 'N/A';
    return Scaffold(
      appBar: AppBar(
        title: Text(universityDetails?.name ?? 'University Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              _buildValues('Name', name),
              _buildValues('Country', country),
              _buildValues(
                'Website',
                webPages,
                onTap: () async {
                  final url = webPages != null ? Uri.tryParse(webPages) : null;
                  if (url != null) {
                    await launchUrl(url);
                  }
                },
              ),
              const SizedBox(height: 24),
              Text('Other Details', style: const TextStyle(fontSize: 19)),
              const Divider(),
              _buildValues('State Province', stateProvince),
              _buildValues('Alpha Two Code', alphaTwoCode),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildValues(String label, String? value, {Function()? onTap}) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
      Expanded(
        flex: 2,
        child: InkWell(
          onTap: onTap,
          child: Text(value ?? '', style: const TextStyle(fontSize: 18)),
        ),
      ),
    ],
  );
}
