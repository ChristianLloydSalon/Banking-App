import 'package:flutter/material.dart';

/// Outfit type scale from the typography guide (Display → Link).
class Outfit {
  const Outfit._();

  static final Outfit instance = Outfit._();

  static const fontFamily = 'Outfit';

  static TextStyle _s(double size, FontWeight weight, double lineHeight) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: weight,
      height: lineHeight / size,
    );
  }

  // --- Display (SemiBold) ---

  /// Display 10xl
  TextStyle get display10xl => _s(64, FontWeight.w600, 72);

  /// Display 9xl
  TextStyle get display9xl => _s(52, FontWeight.w600, 56);

  /// Display 8xl
  TextStyle get display8xl => _s(48, FontWeight.w600, 52);

  // --- Headline (SemiBold) ---

  /// Headline 7xl
  TextStyle get headline7xl => _s(40, FontWeight.w600, 44);

  /// Headline 6xl
  TextStyle get headline6xl => _s(36, FontWeight.w600, 40);

  /// Headline 5xl
  TextStyle get headline5xl => _s(28, FontWeight.w600, 32);

  /// Headline 4xl
  TextStyle get headline4xl => _s(24, FontWeight.w600, 28);

  // --- Title Medium ---

  /// Title 5xl (Medium)
  TextStyle get title5xlMedium => _s(24, FontWeight.w500, 28);

  /// Title 4xl (Medium)
  TextStyle get title4xlMedium => _s(22, FontWeight.w500, 26);

  /// Title 3xl (Medium)
  TextStyle get title3xlMedium => _s(20, FontWeight.w500, 24);

  /// Title 2xl (Medium)
  TextStyle get title2xlMedium => _s(18, FontWeight.w500, 22);

  /// Title xl (Medium)
  TextStyle get titleXlMedium => _s(16, FontWeight.w500, 20);

  /// Title lg (Medium)
  TextStyle get titleLgMedium => _s(14, FontWeight.w500, 20);

  /// Title md (Medium)
  TextStyle get titleMdMedium => _s(13, FontWeight.w500, 17);

  /// Title sm (Medium)
  TextStyle get titleSmMedium => _s(12, FontWeight.w500, 16);

  /// Title xsm (Medium)
  TextStyle get titleXsmMedium => _s(11, FontWeight.w500, 14);

  /// Title Button Base (Medium)
  TextStyle get titleButtonBaseMedium => _s(7, FontWeight.w500, 20);

  // --- Title Regular ---

  /// Title 2xl (Regular)
  TextStyle get title2xlRegular => _s(20, FontWeight.w400, 24);

  /// Title xl (Regular)
  TextStyle get titleXlRegular => _s(18, FontWeight.w400, 22);

  /// Title lg (Regular)
  TextStyle get titleLgRegular => _s(16, FontWeight.w400, 20);

  /// Title md (Regular)
  TextStyle get titleMdRegular => _s(14, FontWeight.w400, 18);

  /// Title sm (Regular)
  TextStyle get titleSmRegular => _s(12, FontWeight.w400, 16);

  /// Title xsm (Regular)
  TextStyle get titleXsmRegular => _s(11, FontWeight.w400, 15);

  // --- Body Regular (Light) ---

  /// Body Regular xl
  TextStyle get bodyRegularXl => _s(18, FontWeight.w300, 22);

  /// Body Regular lg
  TextStyle get bodyRegularLg => _s(16, FontWeight.w300, 20);

  /// Body Regular md
  TextStyle get bodyRegularMd => _s(14, FontWeight.w300, 18);

  /// Body Regular sm
  TextStyle get bodyRegularSm => _s(12, FontWeight.w300, 16);

  /// Body Regular xsm
  TextStyle get bodyRegularXsm => _s(11, FontWeight.w300, 15);

  // --- Link Bold ---

  /// Link Bold lg
  static TextStyle get linkBoldLg => _s(16, FontWeight.w700, 20).copyWith(
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1.0,
  );

  /// Link Bold md
  static TextStyle get linkBoldMd => _s(14, FontWeight.w700, 18).copyWith(
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1.0,
  );

  /// Link Bold sm
  static TextStyle get linkBoldSm => _s(12, FontWeight.w700, 16).copyWith(
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1.0,
  );

  /// Link Bold xsm
  static TextStyle get linkBoldXsm => _s(11, FontWeight.w700, 15).copyWith(
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1.0,
  );
}
