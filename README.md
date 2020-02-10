# Flutter Challenge Ticketmaster API

### Setup

First, run `flutter pub get` inside the main project. After that, we need to build some files, with `build_runner`.
Run `flutter pub run build_runner build`.

Ready to go. Start this app on a device.

### Tests

Run `flutter test` inside the main project directory.

For you to know, in this short time, it wasn't possible, to add tests for everything. I added the most important testing concepts and ideas. The Mockservices and model parsing tests. Maybe intresting for you: right now, I can't test the DB, sqflite is the problem here. If I had more time, I would build a MockDbProvider, with the same methods of the DefaultDBProvider, but with SharedPreferences as Database.

### Throw an eye on it

- Generic State
- Provider Architecture
- Neumorphism
- Folder Strucutre
- ViewModels
- & so on
