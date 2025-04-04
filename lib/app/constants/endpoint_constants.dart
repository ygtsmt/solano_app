/// Holds all the endpoints of the app
abstract final class EndpointConstants {
  static const String getMine = 'auth/me';

  static const String registerUser = 'auth/register';
  static const String loginUser = 'auth/login';
  static const String psychologistAppointment = 'appointments/psychologist/';
  static const String userAppointment = 'appointments/user/';
  static const String getPsychologistByFilter = '/auth/psychologists';
  static const String sendPhoneVerificationCode = '/auth/phone/send';
  static const String checkPhoneVerification = '/auth/phone/check';
  static const String checkEmailVerification = '/auth/email/check';

  static const String getPsychologistAvailableDays = '/appointments/days';
  static const String sendEmailVerificationCode = '/auth/email/send';

  static const String sendForgotEmail = '/auth/sendForgetEmail';

  static const String appointments = 'appointments';
  static const String getUserCreditCards = '/invoices/cards/getMine';
  static const String psychologicalTest = '/psychologicalTest/getAll';

  static const String psychologistTestStart = '/psychologicalTest/start';

  static const String psychologistTypesByUser = '/psychologist/typesByUser';

  static const String createAppointmentWithPayment = '/appointments/create';

  static const String forgotPasswordUpdate = '/auth/updateForgetPassword';

  static const String getPsychologistPrice = '/psychologist/types';
  static const String joinTeam = '/auth/apply';
  static const String getEvent = '/event/getAll';
  static const String joinEvent = '/event/join';
  static const String addCard = '/invoices/cards/add';
  static const String getCardInvoice = '/invoices/cards/';
  static const String deleteCard = '/invoices/cards/delete/';

  static const String invoiceCardUpdate = '/invoices/cards/update';

  static const String userCompletedAppointment = '/appointments/user/completed';
  static const String psychologistProfile = '/auth/psychologists/profile';
  static const String psychologistTurnOnOff = 'auth/psychologist/turnOnOff';

  // static const String googleMeet =
  //     'meet-psikologofisim.mindmons.com/create-meet?';

  // static const String googleMeetUrl =
  //     'https://tradesight-google-2.mindmons.com/create-meet?';

  static const String getPscyhologistAppointment =
      '/appointments/psychologist/';

  static const String getMessageMetaData = '/appointments/byMessageId';

  static const String askQuestions = '/psychologist/question/ask';
  static const String mostResponded = '/psychologist/question/mostResponded';
  static const String getUserQuestion = '/psychologist/question/getMine';
  static const String getUserExpertQuestion = '/psychologist/question/experts';
  static const String getPsychologistAllAnswer =
      '/psychologist/question/getAll';
  static const String getPsychologistAnswered =
      '/psychologist/question/myAnswers/';
  static const String replyAnswerPsychologist = 'psychologist/question/reply';
  static const String userAuth = '/auth/';
  static const String psychologistDetail = '/auth/psychologist/';
  static const String psychologistReview = '/rate/psychologist/comments/';
  static const String updateUser = '/auth/update';
  static const String cancelAppointment = '/appointments/cancel';
  static const String getAllBlog = '/Blog/GetAllBlogs';
  static const String commentBlog = '/Blog/AddCommentToBlog';

}
