import 'package:hitch_hiker_app/providers/auth_user_provider.dart';
import 'package:hitch_hiker_app/providers/bottom_nav_provider.dart';
import 'package:hitch_hiker_app/providers/evert_sorter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitch_hiker_app/repository/mobile_auth_repository.dart';

final eventSorterProvider = ChangeNotifierProvider<EventSorterProvider>((ref) {
  return EventSorterProvider();
});

final bottomNavProvider = ChangeNotifierProvider<BottomNavProvider>((ref) {
  return BottomNavProvider();
});

final authLoginProvider = ChangeNotifierProvider<AuthLoginProvider>((ref) {
  return AuthLoginProvider(mobileAuthRepository: MobileAuthRepository());
});
