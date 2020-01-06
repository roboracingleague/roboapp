import 'package:flavor_banner/flavor_banner.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(FlavorConfig flavor) {
  locator.registerSingleton(flavor);
}
