enum PngEnum {
  dummyProfilImage1('dummy_profil_image1'),
  dummyProfilImage2('dummy_profil_image2'),
  partners('partners'),
  whoWeAre('whoWeAre'),
  askQuestionBanner('ask_question_banner'),
  paymentBannerBg('payment_banner_bg'),
  paymentBodyPink('payment_body_pink'),
  paymentBodyPurple('payment_body_purple'),
  paymentBodyBlue('payment_body_blue'),
  paymentSuccessImage('payment_success_image'),
  paymentFooterBg('payment_footer_bg'),
  loginBottomBg('login_bottom_bg'),
  point('point'),
  pageHeaderBg('page-header-bg'),
  joinTeamProfile('join_team_profile'),
  usefulBanner('useful_banner'),
  howToUse('how_to_use_banner'),
  articlesHeader('articles_header'),
  paymentSuccessBg('payment_success_bg'),
  joinTeamPrice1('join_team_price1'),
  joinTeamPrice2('join_team_price2'),
  joinTeamPrice3('join_team_price3'),
  joinTeamPrice4('join_team_price4'),
  psychologistBody1('psychologist_body1'),
  psychologistBody2('psychologist_body2'),
  psychologistBody3('psychologist_body3'),
  psychologistPrice('psychologist_price'),
  sendMessage('send_message'),
  askQuestionCardBg('ask_question_card_bg'),
  userTherapyBanner('user_therapy_banner'),
  userTherapyCard('user_therapy_card'),
  usefulArticlesBanner('useful_articles_bannner'),

  usefulBodyImage('useful_body_image');

  const PngEnum(this.value);
  final String value;
  String get rawValue => 'assets/png/$value.png';
}
