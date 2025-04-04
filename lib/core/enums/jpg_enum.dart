enum JpgEnum {
  infoViewFirst('info_view_first'),
  infoViewSecond('info_view_second'),
  infoViewThird('info_view_third'),
  infoViewFourth('info_view_fourth'),
  infoViewOnboard('info_view_onboard'),
  ;

  const JpgEnum(this.value);
  final String value;
  String get rawValue => 'assets/jpeg/$value.jpg';
}
