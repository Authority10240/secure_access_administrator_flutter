enum Flavor {
  dev,
  uat,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Secure Access Administrator dev';
      case Flavor.uat:
        return 'Secure Access Administrator uat';
      case Flavor.prod:
        return 'Secure Access Administrator';
      default:
        return 'title';
    }
  }

}
