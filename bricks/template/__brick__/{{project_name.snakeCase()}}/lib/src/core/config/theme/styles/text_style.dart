part of 'styles.dart';

enum _Fonts {
  f8(fontSize: Sizes.font8, height: Sizes.lineHeight),
  f10(fontSize: Sizes.font10, height: Sizes.lineHeight),
  f12(fontSize: Sizes.font12, height: Sizes.lineHeight),
  f14(fontSize: Sizes.font14, height: Sizes.lineHeight),
  f16(fontSize: Sizes.font16, height: Sizes.lineHeight),
  f18(fontSize: Sizes.font18, height: Sizes.lineHeight),
  f20(fontSize: Sizes.font20, height: Sizes.lineHeight),
  f24(fontSize: Sizes.font24, height: Sizes.lineHeight),
  f30(fontSize: Sizes.font30, height: Sizes.lineHeight),
  f32(fontSize: Sizes.font32, height: Sizes.lineHeight),
  f35(fontSize: Sizes.font35, height: Sizes.lineHeight);

  const _Fonts({required this.fontSize, required this.height});

  final double fontSize;
  final double height;

  TextStyle get baseStyle => TextStyle(
        fontSize: fontSize,
        height: height,
        fontWeight: FontStyles.fontWeightNormal,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle style(BuildContext context) => baseStyle.copyWith(
        // fontFamily: context.tr.fontFamily,
      );
}

final class TextStyles {
  static TextStyle f8(BuildContext context) => _Fonts.f8.style(context);
  static TextStyle f10(BuildContext context) => _Fonts.f10.style(context);
  static TextStyle f12(BuildContext context) => _Fonts.f12.style(context);
  static TextStyle f14(BuildContext context) => _Fonts.f14.style(context);
  static TextStyle f16(BuildContext context) => _Fonts.f16.style(context);
  static TextStyle f18(BuildContext context) => _Fonts.f18.style(context);
  static TextStyle f20(BuildContext context) => _Fonts.f20.style(context);
  static TextStyle f24(BuildContext context) => _Fonts.f24.style(context);
  static TextStyle f30(BuildContext context) => _Fonts.f30.style(context);
  static TextStyle f32(BuildContext context) => _Fonts.f32.style(context);
  static TextStyle f35(BuildContext context) => _Fonts.f35.style(context);

  static TextStyle inputDecorationHint(Color color) => _Fonts.f12.baseStyle.copyWith(color: color);
  static TextStyle inputDecorationError(Color color) => _Fonts.f14.baseStyle.copyWith(color: color);
  static TextStyle appBarTitle(Color color) => _Fonts.f18.baseStyle.copyWith(
        color: color,
        fontWeight: FontStyles.fontWeightMedium,
      );
  static TextStyle listTitle(Color color) => _Fonts.f14.baseStyle.copyWith(
        color: color,
      );
  static TextStyle subListTitle(Color color) => _Fonts.f12.baseStyle.copyWith(
        color: color,
      );

  static TextStyle navigationLabel(Color color) =>
      TextStyle(color: color, fontSize: Sizes.font14, height: 0.5);
}

extension TextStyleX on TextStyle {
  /// 700
  TextStyle get bold => copyWith(fontWeight: FontStyles.fontWeightBold);

  /// 600
  TextStyle get semiBold => copyWith(fontWeight: FontStyles.fontWeightSemiBold);

  /// 500
  TextStyle get medium => copyWith(fontWeight: FontStyles.fontWeightMedium);

  /// 400
  TextStyle get normal => copyWith(fontWeight: FontStyles.fontWeightNormal);

  /// Color 0XFFE8E9EA
  TextStyle neutral60(BuildContext context) =>
      copyWith(color: appSwitcherColors(context).neutralColors.shade60);

  /// Color 0XFFB7BABE
  TextStyle neutral70(BuildContext context) =>
      copyWith(color: appSwitcherColors(context).neutralColors.shade70);

  /// Color 0XFF95989E
  TextStyle neutral80(BuildContext context) =>
      copyWith(color: appSwitcherColors(context).neutralColors.shade80);

  ///Color 0XFFB6B8BB
  TextStyle neutral200(BuildContext context) =>
      copyWith(color: appSwitcherColors(context).neutralColors.shade200);

  ///Color 0XFFE7E8E9
}
