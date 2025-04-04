import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_auth_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserAuthModel extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'role')
  final String? role;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'userAuthAddress')
  final UserAuthAddress? userAuthAddress;

  @JsonKey(name: 'userLogo')
  final String? userLogo;

  @JsonKey(name: 'gender')
  final String? gender;

  @JsonKey(name: 'age')
  final int? age;

  @JsonKey(name: 'isWorkActivity')
  final bool? isWorkActivity;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'isPhoneVerified')
  final String? isPhoneVerified;

  @JsonKey(name: 'isEmailVerified')
  final bool? isEmailVerified;

  @JsonKey(name: 'isCheckBefore')
  final bool? isCheckBefore;

  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'accountStatus')
  final String? accountStatus;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  @JsonKey(name: 'startFirstSession')
  final bool? startFirstSession;

  @JsonKey(name: 'startSecondSession')
  final bool? startSecondSession;

  @JsonKey(name: 'startThirdSession')
  final bool? startThirdSession;

  @JsonKey(name: 'finalSession')
  final bool? finalSession;

  @JsonKey(name: 'userAuthForm')
  final UserAuthForm? userAuthForm;

  @JsonKey(name: 'toBeNotify')
  final bool? toBeNotify;

  @JsonKey(name: 'userEvent')
  final List<UserEvent>? userAuthEvent;

  @JsonKey(name: 'addedById')
  final String? addedById;

  const UserAuthModel({
    this.id,
    this.username,
    this.password,
    this.role,
    this.email,
    this.userAuthAddress,
    this.userLogo,
    this.gender,
    this.age,
    this.isWorkActivity,
    this.phone,
    this.isPhoneVerified,
    this.isEmailVerified,
    this.isCheckBefore,
    this.status,
    this.accountStatus,
    this.createdAt,
    this.updatedAt,
    this.startFirstSession,
    this.startSecondSession,
    this.startThirdSession,
    this.finalSession,
    this.userAuthForm,
    this.toBeNotify,
    this.userAuthEvent,
    this.addedById,
  });

  UserAuthModel copyWith({
    String? username,
    String? phone,
    String? email,
  }) {
    return UserAuthModel(
      id: id,
      username: username ?? this.username,
      password: password,
      role: role,
      email: email ?? this.email,
      userAuthAddress: userAuthAddress,
      userLogo: userLogo,
      gender: gender,
      age: age,
      isWorkActivity: isWorkActivity,
      phone: phone ?? this.phone,
      isPhoneVerified: isPhoneVerified,
      isEmailVerified: isEmailVerified,
      isCheckBefore: isCheckBefore,
      status: status,
      accountStatus: accountStatus,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory UserAuthModel.fromJson(Map<String, dynamic> json) =>
      _$UserAuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserAuthModelToJson(this);

  @override
  List<Object?> get props => [id, username, email];

  @override
  String toString() {
    return 'UserAuthModel{id: $id, username: $username, role: $role, email: $email, userAuthAddress: $userAuthAddress, userLogo: $userLogo, gender: $gender, age: $age, phone: $phone, isPhoneVerified: $isPhoneVerified, status: $status, accountStatus: $accountStatus}';
  }
}

@JsonSerializable()
class UserAuthAddress {
  @JsonKey(name: 'state')
  final String? state;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'address')
  final String? address;

  @JsonKey(name: 'nationality')
  final String? nationality;

  @JsonKey(name: 'identityNumber')
  final String? identityNumber;

  @JsonKey(name: 'idCardFront')
  final String? idCardFront;

  @JsonKey(name: 'idCardBack')
  final String? idCardBack;

  const UserAuthAddress({
    this.state,
    this.city,
    this.address,
    this.nationality,
    this.identityNumber,
    this.idCardFront,
    this.idCardBack,
  });

  factory UserAuthAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAuthAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAuthAddressToJson(this);
}

@JsonSerializable()
class UserAuthForm {
  @JsonKey(name: 'marital_status')
  final String? maritalStatus;

  @JsonKey(name: 'do_you_have_child')
  final bool? doYouHaveChild;

  @JsonKey(name: 'education_degree')
  final String? educationDegree;

  @JsonKey(name: 'occupation')
  final String? occupation;

  @JsonKey(name: 'income_level')
  final String? incomeLevel;

  @JsonKey(name: 'disability')
  final bool? disability;

  const UserAuthForm({
    this.maritalStatus,
    this.doYouHaveChild,
    this.educationDegree,
    this.occupation,
    this.incomeLevel,
    this.disability,
  });

  factory UserAuthForm.fromJson(Map<String, dynamic> json) =>
      _$UserAuthFormFromJson(json);
  Map<String, dynamic> toJson() => _$UserAuthFormToJson(this);
}

@JsonSerializable()
class UserEvent {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'eventName')
  final String? eventName;

  @JsonKey(name: 'event_start_date')
  final String? eventStartDate;

  @JsonKey(name: 'event_end_date')
  final String? eventEndDate;

  @JsonKey(name: 'eventImage')
  final String? eventImage;

  @JsonKey(name: 'eventDescription')
  final String? eventDescription;

  @JsonKey(name: 'eventPrice')
  final int? eventPrice;

  @JsonKey(name: 'numberOfParticipants')
  final int? numberOfParticipants;

  @JsonKey(name: 'eventLocation')
  final String? eventLocation;

  @JsonKey(name: 'eventStatus')
  final String? eventStatus;

  @JsonKey(name: 'price')
  final int? price;

  @JsonKey(name: 'joinerEvent')
  final List<String>? joinerEvent;

  @JsonKey(name: 'isOwner')
  final bool? isOwner;

  @JsonKey(name: 'count')
  final int? count;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  const UserEvent({
    this.id,
    this.userId,
    this.eventName,
    this.eventStartDate,
    this.eventEndDate,
    this.eventImage,
    this.eventDescription,
    this.eventPrice,
    this.numberOfParticipants,
    this.eventLocation,
    this.eventStatus,
    this.price,
    this.joinerEvent,
    this.isOwner,
    this.count,
    this.createdAt,
    this.updatedAt,
  });

  factory UserEvent.fromJson(Map<String, dynamic> json) =>
      _$UserEventFromJson(json);
  Map<String, dynamic> toJson() => _$UserEventToJson(this);
}
