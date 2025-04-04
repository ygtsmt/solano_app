// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthModel _$UserAuthModelFromJson(Map<String, dynamic> json) =>
    UserAuthModel(
      id: json['id'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
      email: json['email'] as String?,
      userAuthAddress: json['userAuthAddress'] == null
          ? null
          : UserAuthAddress.fromJson(
              json['userAuthAddress'] as Map<String, dynamic>),
      userLogo: json['userLogo'] as String?,
      gender: json['gender'] as String?,
      age: (json['age'] as num?)?.toInt(),
      isWorkActivity: json['isWorkActivity'] as bool?,
      phone: json['phone'] as String?,
      isPhoneVerified: json['isPhoneVerified'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool?,
      isCheckBefore: json['isCheckBefore'] as bool?,
      status: json['status'] as bool?,
      accountStatus: json['accountStatus'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      startFirstSession: json['startFirstSession'] as bool?,
      startSecondSession: json['startSecondSession'] as bool?,
      startThirdSession: json['startThirdSession'] as bool?,
      finalSession: json['finalSession'] as bool?,
      userAuthForm: json['userAuthForm'] == null
          ? null
          : UserAuthForm.fromJson(json['userAuthForm'] as Map<String, dynamic>),
      toBeNotify: json['toBeNotify'] as bool?,
      userAuthEvent: (json['userEvent'] as List<dynamic>?)
          ?.map((e) => UserEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      addedById: json['addedById'] as String?,
    );

Map<String, dynamic> _$UserAuthModelToJson(UserAuthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'role': instance.role,
      'email': instance.email,
      'userAuthAddress': instance.userAuthAddress?.toJson(),
      'userLogo': instance.userLogo,
      'gender': instance.gender,
      'age': instance.age,
      'isWorkActivity': instance.isWorkActivity,
      'phone': instance.phone,
      'isPhoneVerified': instance.isPhoneVerified,
      'isEmailVerified': instance.isEmailVerified,
      'isCheckBefore': instance.isCheckBefore,
      'status': instance.status,
      'accountStatus': instance.accountStatus,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'startFirstSession': instance.startFirstSession,
      'startSecondSession': instance.startSecondSession,
      'startThirdSession': instance.startThirdSession,
      'finalSession': instance.finalSession,
      'userAuthForm': instance.userAuthForm?.toJson(),
      'toBeNotify': instance.toBeNotify,
      'userEvent': instance.userAuthEvent?.map((e) => e.toJson()).toList(),
      'addedById': instance.addedById,
    };

UserAuthAddress _$UserAuthAddressFromJson(Map<String, dynamic> json) =>
    UserAuthAddress(
      state: json['state'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      nationality: json['nationality'] as String?,
      identityNumber: json['identityNumber'] as String?,
      idCardFront: json['idCardFront'] as String?,
      idCardBack: json['idCardBack'] as String?,
    );

Map<String, dynamic> _$UserAuthAddressToJson(UserAuthAddress instance) =>
    <String, dynamic>{
      'state': instance.state,
      'city': instance.city,
      'address': instance.address,
      'nationality': instance.nationality,
      'identityNumber': instance.identityNumber,
      'idCardFront': instance.idCardFront,
      'idCardBack': instance.idCardBack,
    };

UserAuthForm _$UserAuthFormFromJson(Map<String, dynamic> json) => UserAuthForm(
      maritalStatus: json['marital_status'] as String?,
      doYouHaveChild: json['do_you_have_child'] as bool?,
      educationDegree: json['education_degree'] as String?,
      occupation: json['occupation'] as String?,
      incomeLevel: json['income_level'] as String?,
      disability: json['disability'] as bool?,
    );

Map<String, dynamic> _$UserAuthFormToJson(UserAuthForm instance) =>
    <String, dynamic>{
      'marital_status': instance.maritalStatus,
      'do_you_have_child': instance.doYouHaveChild,
      'education_degree': instance.educationDegree,
      'occupation': instance.occupation,
      'income_level': instance.incomeLevel,
      'disability': instance.disability,
    };

UserEvent _$UserEventFromJson(Map<String, dynamic> json) => UserEvent(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      eventName: json['eventName'] as String?,
      eventStartDate: json['event_start_date'] as String?,
      eventEndDate: json['event_end_date'] as String?,
      eventImage: json['eventImage'] as String?,
      eventDescription: json['eventDescription'] as String?,
      eventPrice: (json['eventPrice'] as num?)?.toInt(),
      numberOfParticipants: (json['numberOfParticipants'] as num?)?.toInt(),
      eventLocation: json['eventLocation'] as String?,
      eventStatus: json['eventStatus'] as String?,
      price: (json['price'] as num?)?.toInt(),
      joinerEvent: (json['joinerEvent'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isOwner: json['isOwner'] as bool?,
      count: (json['count'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserEventToJson(UserEvent instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'eventName': instance.eventName,
      'event_start_date': instance.eventStartDate,
      'event_end_date': instance.eventEndDate,
      'eventImage': instance.eventImage,
      'eventDescription': instance.eventDescription,
      'eventPrice': instance.eventPrice,
      'numberOfParticipants': instance.numberOfParticipants,
      'eventLocation': instance.eventLocation,
      'eventStatus': instance.eventStatus,
      'price': instance.price,
      'joinerEvent': instance.joinerEvent,
      'isOwner': instance.isOwner,
      'count': instance.count,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
