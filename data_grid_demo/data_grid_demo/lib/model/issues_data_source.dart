import 'dart:math' as math;

math.Random random = math.Random();

class IssueData {
  IssueData({this.title, this.user, this.date, this.tags, this.commentsCount});

  String title;
  String user;
  String tags;
  DateTime date;
  int commentsCount;
}

List<String> title = [
  '''Flutter couldn't start the installed app: couldn't find "libflutter.so"''',
  'flutter crashed in profile mode',
  'Getting error while completing error purchases on iOS 14 (in_app_purchase)',
  ' Web release mode build breaks, but debug mode runs OK',
  'Android Migration',
  'Ignore const constructor modifier for debug builds',
  'Backfilling cron job for untested commits',
  'Update bot config files',
  'Build a web project that depends on all flutter/plugin plugins in CI',
  '''Recent Screen shows flickering and black screen''',
  '''Error: Error when reading ' - ': The system cannot find the file specified.''',
  'Move health checks and autorecovery to bot_config',
  'Enforce consistency of UI attached to FlutterEngine',
  'PageViewController initialPage does not work',
  'gmail integration not working in release apk',
  ''''flutter run crash: 'columnWidth >= 0': is not true''',
  '''Missing required parameter 'client_id' when do deploy to server''',
  'Gold failure locally does not show images',
  '[Proposal] : Color for unselected Button in ToggleButtons',
  'Image Picker Freezes in Android when accessing OneDrive',
  'device_info plugin makes the app crash',
  'Screenshot taken with LiveTestWidgetsFlutterBinding is truncated',
  '[google_sign_in] Programmatically set server clientId with Flutter GoogleSignIn plugin for Android',
  'Engine Unittests are stripped of symbols',
  '[doctor] Add macOS architecture to doctor output',
  '[plugins]Deprecation & Unchecked warning',
  'official plugin for encryption/decryption and signing/verification',
  'Set up special rules for size and tech debt regression alerts',
  'DatePickerEntryMode.calendar -> dont change year',
  'TextPainter.didExceedMaxLines method is always returning false on Web',
  '[in_app_purchase] Get receipt from autorenewal subscription',
  'Document how to load assets in package dependencies',
  '''I can't view build dashboard logs''',
  'flutter build ios always build release version',
  'Validate snap containment in Linux build',
  'The Flokk app needs to be updated for Windows',
  'Photo Search sample update for Windows',
  'Flutter Gallery release for Windows',
  'Video_player displays black screen on iOS',
  '''Failed assertion: 'textCapitalization != null': is not true.''',
  'Cirrus mac failure while installing rubygems',
  'Some high-end devices have bad ListView scrolling performance',
  'Collecting flutter roller status to fuchsia',
  'Flutter update-packages has slowed down 10X',
  '[flutter_tools] Migrate hostonly_devicelab tests to flutter_tools',
  'Replace multiple hero tag exception by grabbing first hero',
  'Integrate Navigator 2.0 and state restoration for the web',
  '''flutter_plugin_tools 'format' doesn't work on Windows ''',
  '''[Web] :Dropdownbutton's menu item position is mis-placed.''',
  '''flutter doctor finds device and flutter run doesn't ''',
  'SIGSEGV 11 on Beta and Dev suddenly',
  '''Failed Assertion: 'hasSize''',
  '''[web] Run screenshot tests on Windows''',
  'Pull perf metrics from FTL',
  '''Swapping an EGL surface doesn't populate ImageReader right away''',
  'Full IME support for Windows',
  'Xiaomi MIUI 12, app flickering issue.',
  'SelecetableRichText',
  'TextFormField onSaved method should be renamed to onSave',
  'New ScrollPhysics type for PageView: support page locking ',
  'Scale flutter on linux Xorg based on Xft.dpi',
  '[web]: Ctrl+F support, finding text on a page',
  'Button: style property overrides parental color when using Theme',
  'Support automatic integration of iOS App Clip',
  'App Crash on release android 5 ',
];

List<String> creatorName = [
  'Anandh',
  'Aswin',
  'Gowtham',
  'Mani',
  'Sakthi',
  'Ashok',
  'Titus',
  'Siva',
  'Pandi',
  'Jaya Prakash',
  'Vishnu'
];

List<String> issueTag = ['P4', 'P3', 'P1', 'iOS', 'Android', 'Web'];

generateList(int count) {
  List<DateTime> loggedDate = _getDateBetween(2018, 2020, 50);

  List<IssueData> employeeData = List<IssueData>();
  for (var i = 1; i <= count; i++) {
    employeeData.add(IssueData(
        title: title[random.nextInt(title.length - 1)],
        user: creatorName[random.nextInt(creatorName.length - 1)],
        tags: issueTag[random.nextInt(issueTag.length - 1)],
        commentsCount: random.nextInt(10),
        date: loggedDate[i-1]));
  }

  return employeeData;
}

int next(int min, int max) => min + random.nextInt(max - min);

List<DateTime> _getDateBetween(int startYear, int endYear, int count) {
  List<DateTime> date = [];

  for (int i = 0; i <= count; i++) {
    int year = next(startYear, endYear);
    int month = random.nextInt(13);
    int day = random.nextInt(31);

    date.add(DateTime(year, month, day));
  }

  return date;
}
