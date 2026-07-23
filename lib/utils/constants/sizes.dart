/// Consistent spacing, sizing, and radius scale used across every screen.
/// Never hardcode a raw number like 16.0 for padding in a widget —
/// reference GSizes so the whole app's spacing rhythm stays consistent
/// and easy to adjust globally.
class GSizes {
  GSizes._();

  // ============================================================
  // PADDING / MARGIN — spacing scale
  // ============================================================
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;

  // Common shorthand
  static const double defaultSpace = 16.0; // standard screen padding
  static const double spaceBtwItems = 8.0; // between list items, form fields
  static const double spaceBtwSections = 24.0; // between major page sections
  static const double spaceBtwInputFields = 4.0;
  static const double searchbarHeight = 40.0;

  // ============================================================
  // BORDER RADIUS
  // ============================================================
  static const double radiusXs = 6.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0; // cards (transactions, accounts)
  static const double radiusLg = 16.0; // large cards (balance hero card)
  static const double radiusXl = 20.0; // sheets, modals, screen frame

  // ============================================================
  // ICON SIZES
  // ============================================================
  static const double iconXs = 14.0;
  static const double iconSm = 18.0;
  static const double iconMd = 22.0;
  static const double iconLg = 28.0;

  // ============================================================
  // BUTTON HEIGHTS
  // ============================================================
  static const double buttonHeight = 48.0;
  static const double buttonRadius = 12.0;
  static const double buttonWidth = 120.0;
  static const double buttonElevation = 0.0; // flat design, no shadows

  // ============================================================
  // INPUT FIELD
  // ============================================================
  static const double inputFieldRadius = 12.0;
  static const double inputFieldHeight = 48.0;

  // ============================================================
  // CARD
  // ============================================================
  static const double cardRadiusSm = 12.0;
  static const double cardRadiusLg = 16.0;
  static const double cardElevation = 0.0; // flat design per mockups


  // ============================================================
  // Container 
  // ============================================================
    static const double containerHeight = 50; // login image container
    static const double  containerWidth = 50;



  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================
  static const double bottomNavHeight = 64.0;
  static const double bottomNavIconSize = 22.0;
  static const double centerFabSize = 56.0;

  // ============================================================
  // FONT SIZES — mirrors what's used in TextTheme, kept here too
  // for one-off cases (chips, pills, badges) that don't use TextTheme
  // ============================================================
  static const double fontSizeXs = 10.0; // bottom nav labels, timestamps
  static const double fontSizeSm = 12.0; // captions, subtitles
  static const double fontSizeMd = 14.0; // body text, list titles
  static const double fontSizeLg = 16.0; // section titles
  static const double fontSizeXl = 20.0; // screen titles
  static const double fontSizeXxl = 28.0; // hero balance figure

  // ============================================================
  // APP BAR / SCREEN
  // ============================================================
  static const double appBarHeight = 56.0;
  static const double screenPadding = 16.0;

  // ============================================================
  // DIVIDER
  // ============================================================
  static const double dividerHeight = 0.5; // hairline, matches mockup style
}
