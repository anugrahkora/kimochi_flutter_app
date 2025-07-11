import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kimochi_flutter_app/core/provider/providers.dart';
import 'package:kimochi_flutter_app/features/home/view_model/home_view_model.dart';
import 'package:url_launcher/url_launcher.dart';


// HomeView is the main view for the home screen
// It allows users to search for universities by country
// and displays a list of universities with their details

class HomeView extends ConsumerWidget {
  HomeView({super.key});

  final TextEditingController _countryTextController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // Listen for changes in the HomeViewState and show error messages if any
       ref.listen<HomeViewState>(homeViewModelProvider,
        (previous, next) {
      if (next.error != null && next.error != previous?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
        );

   // Reset the error state 
        ref.read(homeViewModelProvider.notifier).clearError();
      }
    });
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 50, child: Icon(Icons.person, size: 48)),
              Text(
                'Anugrah K',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _countryTextController,
                decoration: InputDecoration(
                  labelText: 'Enter Country',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_countryTextController.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();
                    viewModel.fetchUniversities(_countryTextController.text);
                  }
                },
                icon: Icon(Icons.search),
                label: Text('Search'),
              ),
              if (state.isLoading)
                const CircularProgressIndicator()
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: state.universities.length,
                    itemBuilder: (_, index) {
                      final university = state.universities[index];
                      late Uri? url;
                      if (university.webPages != null &&
                          university.webPages!.isNotEmpty) {
                        url = Uri.tryParse(university.webPages!.first);
                      }
                      return ListTile(
                        title: Text(university.name ?? ''),
                        subtitle: InkWell(
                          onTap: () async {
                            if (url != null) {
                              await launchUrl(url);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: const Text(
                              'Website',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        leading: university.alphaTwoCode != null
                            ? CountryFlag.fromCountryCode(
                                university.alphaTwoCode!,
                              )
                            : null,
                        trailing: TextButton(
                          onPressed: () {
                            // Navigate to the details view with the selected university
                            context.push('/details', extra: university);
                          },
                          child: const Text('Details'),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
