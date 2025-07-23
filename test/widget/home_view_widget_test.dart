import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kimochi_flutter_app/app/main_app.dart';

void main() {
 
  testWidgets('Test Home View', (WidgetTester tester ,)async{

    await tester.pumpWidget(
      const ProviderScope(
        child: MainApp(),
      ),
    );


    final avatar=find.byKey(const Key('avatar'));
    final name=find.byKey(const Key('name'));
    final searchField=find.byKey(const Key('countryInput'));
    final searchButton=find.byKey(const Key('searchButton'));

    expect(avatar, findsOneWidget);
    expect(name, findsOneWidget);
    expect(searchField, findsOneWidget);
    expect(searchButton, findsOneWidget);
    await tester.enterText(searchField, 'India');

    expect(find.text('India'), findsOneWidget);
  });
}
