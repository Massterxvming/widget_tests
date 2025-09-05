import 'package:quick_actions/quick_actions.dart';

class QuickActionTool {
  // Singleton pattern
  QuickActionTool._privateConstructor();
  static final QuickActionTool _instance = QuickActionTool._privateConstructor();
  factory QuickActionTool() {
    return _instance;
  }
  static QuickActionTool get instance => _instance;

  final QuickActions quickActions = const QuickActions();

  // Method to initialize quick actions
  void initialize() {
    quickActions.initialize((shortcutType) {
      if (shortcutType == 'action_main') {
        print('The user tapped on the "Main view" action.');
      }
      if (shortcutType == 'action_help') {
        print('The user tapped on the "Help" action.');
      }
      if (shortcutType == 'action_one') {
        print('The user tapped on the "Action one" action.');
      }
      if (shortcutType == 'action_two') {
        print('The user tapped on the "Action two" action.');
      }
    });
  }

  void setQuickActions(List<String> actions) {
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(type: 'action', localizedTitle: '主页', icon: 'icon_main',),
      const ShortcutItem(type: 'action_help', localizedTitle: 'Help', localizedSubtitle: 'Tap to get help', icon: 'icon_help',),
      const ShortcutItem(
        type: 'action_one',
        localizedTitle: 'Action one',
        localizedSubtitle: 'Action one subtitle',
        icon: 'AppIcon',
      ),
      const ShortcutItem(
        type: 'action_two',
        localizedTitle: 'Action two',
        icon: 'ic_launcher',
      ),
    ]).then((v){
      print('set quick actions');
    });
  }

  // Method to clear quick actions
  void clearQuickActions() {
    quickActions.clearShortcutItems();
  }
}