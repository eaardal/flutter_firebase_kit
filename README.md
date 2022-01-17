# flutter_firebase_kit

Boilerplate stuff for creating flutter + firebase apps

## How to use

- Add `dependencies` from pubspec.yaml to your app.
- Set `minSdkVersion` to 21 or higher in build.gradle (cloud firestore requires >=19 but using 21 [resolves this shit](https://stackoverflow.com/a/56368847)). 
- Add `fonts` from pubspec.yaml to your app.
- Copy the `assets` folder to the root of your app.
- Local use: Add this package via relative path:
```yaml
dependencies:
   flutter_firebase_kit:
     path: ./path/to/flutter_firebase_kit
```
- Production use: TBA
- Copy and adapt template files from `./lib/templates/app/` to bootstrap everything.
- Use the other packages under `./lib/` as needed.
- Make your app :tada:

# Localization

See this guide: https://flutter.dev/docs/development/accessibility-and-localization/internationalization#adding-your-own-localized-messages

- In pubspec.yaml, add 
```yaml
dependencies:
  flutter_localizations:
    sdk: flutter

# (..)

flutter:
  generate: true
```
- Create the file `l10n.yaml`:
```yaml
arb-dir: lib/l10n
template-arb-file: intl_en.arb
output-localization-file: app_localizations.dart
```
- Create the folder `./lib/l10n`.
- Create the base localization file: `./lib/l10n/intl_en.arb`. Example:
```json
{
  "homeScreen_title": "Home",
  "@homeScreen_title": {
    "description": "The main window title for the Home screen",
    "type": "text",
    "placeholders": {}
  },

  "shoppingListsScreen_title": "Shopping Lists",
  "@shoppingListsScreen_title": {
    "description": "The main window title for the Shopping Lists screen",
    "type": "text",
    "placeholders": {}
  }
}  
```
- Create the alternative languages: `./lib/l10n/intl_no.arb`. Example:
```json
{
  "homeScreen_title": "Hjem",
  "shoppingListsScreen_title": "Handlelister"
}
```
- When the app is built, the `generate` flag in pubspec.yaml will tell Flutter to first build the localization files to `./.dart_tool/flutter_gen/gen_l10n/`.
The main file is `app_localizations.dart` containing the class `AppLocalizations`. This includes the translations we can use in code and UI.
- Because the `AppLocalizations` is generated on build time and therefore, by definition, unreliable and buggy as fuck, 
  make another wrapper class around it so we can isolate imports of generated code to it and have a reliable localization interface to work with.
  See `./lib/templates/l10n/localization.dart.txt` for a starting point.
- In the root component, add `localizationsDelegate` and `supportedLocales`:
```dart
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // (..)
      localizationsDelegates: Localization.localizationsDelegates, 
      supportedLocales: Localization.supportedLocales,
    );
  }
```
- Use translations:
```flutter
import 'package:chopshop/localization.dart';
import 'package:chopshop/shopping_lists/shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_kit/widgets/ui.dart';

class ShoppingListsScreenUI extends UI {
  late Localization _i18n;

  ShoppingListsScreenUI(BuildContext context) {
    _i18n = Localization(context);
  }

  Iterable<ShoppingList> shoppingLists = [];

  String get title => _i18n.shoppingListsScreen_title;
}
```

# Firebase

- Android: https://firebase.google.com/docs/flutter/setup?platform=android
- iOS: https://firebase.google.com/docs/flutter/setup?platform=ios