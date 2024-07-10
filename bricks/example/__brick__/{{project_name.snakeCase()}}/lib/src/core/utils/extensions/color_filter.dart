import 'dart:ui';

extension ColorFilterX on Color {
  ColorFilter toColorFilter([BlendMode? blendMode]) =>
      ColorFilter.mode(this, blendMode ?? BlendMode.srcIn);
}
