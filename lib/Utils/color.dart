import 'dart:ui';

class _MyColor {
  const _MyColor(this.color, this.name);

  final Color color;
  final String name;

  static const List<_MyColor> myBgColors = const <_MyColor>[
    const _MyColor(null, 'Clear'),
    const _MyColor(const Color(0xFFFFC100), 'Orange'),
    const _MyColor(const Color(0xFF91FAFF), 'Light Blue'),
    const _MyColor(const Color(0xFF00D1FF), 'Cyan'),
    const _MyColor(const Color(0xFF00BCFF), 'Cerulean'),
    const _MyColor(const Color(0xFF009BEE), 'Blue'),
  ];
}

