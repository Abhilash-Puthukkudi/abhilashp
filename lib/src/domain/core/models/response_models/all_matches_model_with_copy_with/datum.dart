import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'interest_status.dart';
import 'user.dart';

part 'datum.g.dart';

@JsonSerializable()
class UserData extends Equatable {
  final int? id;
  final User? user;
  @JsonKey(name: 'current_user')
  final int? currentUser;
  @JsonKey(name: 'customer_uid')
  final String? customerUid;
  @JsonKey(name: 'profile_creation_for')
  final String? profileCreationFor;
  final String? dob;
  final String? gender;
  final String? fair;
  @JsonKey(name: 'profile_video')
  final dynamic profileVideo;
  final dynamic address;
  final dynamic corporation;
  @JsonKey(name: 'ward_number')
  final dynamic wardNumber;
  @JsonKey(name: 'document_type')
  final dynamic documentType;
  @JsonKey(name: 'document_number')
  final dynamic documentNumber;
  @JsonKey(name: 'document_file')
  final dynamic documentFile;
  final int? height;
  final int? weight;
  @JsonKey(name: 'social_media_account')
  final String? socialMediaAccount;
  @JsonKey(name: 'physically_challenged')
  final String? physicallyChallenged;
  @JsonKey(name: 'about_family')
  final String? aboutFamily;
  final dynamic citizenship;
  @JsonKey(name: 'ancestral_origin')
  final dynamic ancestralOrigin;
  @JsonKey(name: 'annual_income')
  final String? annualIncome;
  @JsonKey(name: 'college_name')
  final dynamic collegeName;
  @JsonKey(name: 'is_prime')
  final bool? isPrime;
  @JsonKey(name: 'interest_in_intercast')
  final bool? interestInIntercast;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic location;
  @JsonKey(name: 'tell_us_about_you')
  final String? tellUsAboutYou;
  final dynamic horoscope;
  @JsonKey(name: 'horoscope_birth_date')
  final dynamic horoscopeBirthDate;
  @JsonKey(name: 'horoscope_birth_time')
  final dynamic horoscopeBirthTime;
  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;
  final String? star;
  final dynamic raasi;
  @JsonKey(name: 'completed_pages')
  final String? completedPages;
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @JsonKey(name: 'created_time')
  final String? createdTime;
  @JsonKey(name: 'modified_date')
  final String? modifiedDate;
  @JsonKey(name: 'modified_time')
  final String? modifiedTime;
  final bool? flag;
  @JsonKey(name: 'is_verified')
  final bool? isVerified;
  @JsonKey(name: 'device_id')
  final dynamic deviceId;
  @JsonKey(name: 'deactivate_options')
  final dynamic deactivateOptions;
  @JsonKey(name: 'deactivated_date')
  final dynamic deactivatedDate;
  @JsonKey(name: 'last_seen')
  final dynamic lastSeen;
  final int? religion;
  final int? caste;
  @JsonKey(name: 'sub_caste')
  final dynamic subCaste;
  final dynamic education;
  @JsonKey(name: 'employed_in')
  final dynamic employedIn;
  final dynamic occupation;
  @JsonKey(name: 'work_country')
  final dynamic workCountry;
  @JsonKey(name: 'work_state')
  final dynamic workState;
  @JsonKey(name: 'work_city')
  final dynamic workCity;
  final int? country;
  final int? state;
  final int? city;
  @JsonKey(name: 'mother_toungue')
  final dynamic motherToungue;
  @JsonKey(name: 'physical_status')
  final dynamic physicalStatus;
  @JsonKey(name: 'body_type')
  final dynamic bodyType;
  @JsonKey(name: 'eating_habit')
  final dynamic eatingHabit;
  @JsonKey(name: 'drinking_habit')
  final dynamic drinkingHabit;
  @JsonKey(name: 'smoking_habit')
  final dynamic smokingHabit;
  @JsonKey(name: 'family_value')
  final dynamic familyValue;
  @JsonKey(name: 'family_type')
  final dynamic familyType;
  @JsonKey(name: 'family_status')
  final dynamic familyStatus;
  @JsonKey(name: 'marital_status')
  final dynamic maritalStatus;
  @JsonKey(name: 'father_employement')
  final dynamic fatherEmployement;
  @JsonKey(name: 'mother_employement')
  final dynamic motherEmployement;
  @JsonKey(name: 'father_occupation')
  final dynamic fatherOccupation;
  @JsonKey(name: 'mother_occupation')
  final dynamic motherOccupation;
  @JsonKey(name: 'father_education')
  final dynamic fatherEducation;
  @JsonKey(name: 'mother_education')
  final dynamic motherEducation;
  @JsonKey(name: 'interest_category')
  final List<dynamic>? interestCategory;
  final List<dynamic>? interests;
  @JsonKey(name: 'interest_status')
  final InterestStatus? interestStatus;
  @JsonKey(name: 'short_listed')
  final bool? shortListed;

  const UserData({
    this.id,
    this.user,
    this.currentUser,
    this.customerUid,
    this.profileCreationFor,
    this.dob,
    this.gender,
    this.fair,
    this.profileVideo,
    this.address,
    this.corporation,
    this.wardNumber,
    this.documentType,
    this.documentNumber,
    this.documentFile,
    this.height,
    this.weight,
    this.socialMediaAccount,
    this.physicallyChallenged,
    this.aboutFamily,
    this.citizenship,
    this.ancestralOrigin,
    this.annualIncome,
    this.collegeName,
    this.isPrime,
    this.interestInIntercast,
    this.latitude,
    this.longitude,
    this.location,
    this.tellUsAboutYou,
    this.horoscope,
    this.horoscopeBirthDate,
    this.horoscopeBirthTime,
    this.placeOfBirth,
    this.star,
    this.raasi,
    this.completedPages,
    this.createdDate,
    this.createdTime,
    this.modifiedDate,
    this.modifiedTime,
    this.flag,
    this.isVerified,
    this.deviceId,
    this.deactivateOptions,
    this.deactivatedDate,
    this.lastSeen,
    this.religion,
    this.caste,
    this.subCaste,
    this.education,
    this.employedIn,
    this.occupation,
    this.workCountry,
    this.workState,
    this.workCity,
    this.country,
    this.state,
    this.city,
    this.motherToungue,
    this.physicalStatus,
    this.bodyType,
    this.eatingHabit,
    this.drinkingHabit,
    this.smokingHabit,
    this.familyValue,
    this.familyType,
    this.familyStatus,
    this.maritalStatus,
    this.fatherEmployement,
    this.motherEmployement,
    this.fatherOccupation,
    this.motherOccupation,
    this.fatherEducation,
    this.motherEducation,
    this.interestCategory,
    this.interests,
    this.interestStatus,
    this.shortListed,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  UserData copyWith({
    int? id,
    User? user,
    int? currentUser,
    String? customerUid,
    String? profileCreationFor,
    String? dob,
    String? gender,
    String? fair,
    dynamic profileVideo,
    dynamic address,
    dynamic corporation,
    dynamic wardNumber,
    dynamic documentType,
    dynamic documentNumber,
    dynamic documentFile,
    int? height,
    int? weight,
    String? socialMediaAccount,
    String? physicallyChallenged,
    String? aboutFamily,
    dynamic citizenship,
    dynamic ancestralOrigin,
    String? annualIncome,
    dynamic collegeName,
    bool? isPrime,
    bool? interestInIntercast,
    dynamic latitude,
    dynamic longitude,
    dynamic location,
    String? tellUsAboutYou,
    dynamic horoscope,
    dynamic horoscopeBirthDate,
    dynamic horoscopeBirthTime,
    String? placeOfBirth,
    String? star,
    dynamic raasi,
    String? completedPages,
    String? createdDate,
    String? createdTime,
    String? modifiedDate,
    String? modifiedTime,
    bool? flag,
    bool? isVerified,
    dynamic deviceId,
    dynamic deactivateOptions,
    dynamic deactivatedDate,
    dynamic lastSeen,
    int? religion,
    int? caste,
    dynamic subCaste,
    dynamic education,
    dynamic employedIn,
    dynamic occupation,
    dynamic workCountry,
    dynamic workState,
    dynamic workCity,
    int? country,
    int? state,
    int? city,
    dynamic motherToungue,
    dynamic physicalStatus,
    dynamic bodyType,
    dynamic eatingHabit,
    dynamic drinkingHabit,
    dynamic smokingHabit,
    dynamic familyValue,
    dynamic familyType,
    dynamic familyStatus,
    dynamic maritalStatus,
    dynamic fatherEmployement,
    dynamic motherEmployement,
    dynamic fatherOccupation,
    dynamic motherOccupation,
    dynamic fatherEducation,
    dynamic motherEducation,
    List<dynamic>? interestCategory,
    List<dynamic>? interests,
    InterestStatus? interestStatus,
    bool? shortListed,
  }) {
    return UserData(
      id: id ?? this.id,
      user: user ?? this.user,
      currentUser: currentUser ?? this.currentUser,
      customerUid: customerUid ?? this.customerUid,
      profileCreationFor: profileCreationFor ?? this.profileCreationFor,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      fair: fair ?? this.fair,
      profileVideo: profileVideo ?? this.profileVideo,
      address: address ?? this.address,
      corporation: corporation ?? this.corporation,
      wardNumber: wardNumber ?? this.wardNumber,
      documentType: documentType ?? this.documentType,
      documentNumber: documentNumber ?? this.documentNumber,
      documentFile: documentFile ?? this.documentFile,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      socialMediaAccount: socialMediaAccount ?? this.socialMediaAccount,
      physicallyChallenged: physicallyChallenged ?? this.physicallyChallenged,
      aboutFamily: aboutFamily ?? this.aboutFamily,
      citizenship: citizenship ?? this.citizenship,
      ancestralOrigin: ancestralOrigin ?? this.ancestralOrigin,
      annualIncome: annualIncome ?? this.annualIncome,
      collegeName: collegeName ?? this.collegeName,
      isPrime: isPrime ?? this.isPrime,
      interestInIntercast: interestInIntercast ?? this.interestInIntercast,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      location: location ?? this.location,
      tellUsAboutYou: tellUsAboutYou ?? this.tellUsAboutYou,
      horoscope: horoscope ?? this.horoscope,
      horoscopeBirthDate: horoscopeBirthDate ?? this.horoscopeBirthDate,
      horoscopeBirthTime: horoscopeBirthTime ?? this.horoscopeBirthTime,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      star: star ?? this.star,
      raasi: raasi ?? this.raasi,
      completedPages: completedPages ?? this.completedPages,
      createdDate: createdDate ?? this.createdDate,
      createdTime: createdTime ?? this.createdTime,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      modifiedTime: modifiedTime ?? this.modifiedTime,
      flag: flag ?? this.flag,
      isVerified: isVerified ?? this.isVerified,
      deviceId: deviceId ?? this.deviceId,
      deactivateOptions: deactivateOptions ?? this.deactivateOptions,
      deactivatedDate: deactivatedDate ?? this.deactivatedDate,
      lastSeen: lastSeen ?? this.lastSeen,
      religion: religion ?? this.religion,
      caste: caste ?? this.caste,
      subCaste: subCaste ?? this.subCaste,
      education: education ?? this.education,
      employedIn: employedIn ?? this.employedIn,
      occupation: occupation ?? this.occupation,
      workCountry: workCountry ?? this.workCountry,
      workState: workState ?? this.workState,
      workCity: workCity ?? this.workCity,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      motherToungue: motherToungue ?? this.motherToungue,
      physicalStatus: physicalStatus ?? this.physicalStatus,
      bodyType: bodyType ?? this.bodyType,
      eatingHabit: eatingHabit ?? this.eatingHabit,
      drinkingHabit: drinkingHabit ?? this.drinkingHabit,
      smokingHabit: smokingHabit ?? this.smokingHabit,
      familyValue: familyValue ?? this.familyValue,
      familyType: familyType ?? this.familyType,
      familyStatus: familyStatus ?? this.familyStatus,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      fatherEmployement: fatherEmployement ?? this.fatherEmployement,
      motherEmployement: motherEmployement ?? this.motherEmployement,
      fatherOccupation: fatherOccupation ?? this.fatherOccupation,
      motherOccupation: motherOccupation ?? this.motherOccupation,
      fatherEducation: fatherEducation ?? this.fatherEducation,
      motherEducation: motherEducation ?? this.motherEducation,
      interestCategory: interestCategory ?? this.interestCategory,
      interests: interests ?? this.interests,
      interestStatus: interestStatus ?? this.interestStatus,
      shortListed: shortListed ?? this.shortListed,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      user,
      currentUser,
      customerUid,
      profileCreationFor,
      dob,
      gender,
      fair,
      profileVideo,
      address,
      corporation,
      wardNumber,
      documentType,
      documentNumber,
      documentFile,
      height,
      weight,
      socialMediaAccount,
      physicallyChallenged,
      aboutFamily,
      citizenship,
      ancestralOrigin,
      annualIncome,
      collegeName,
      isPrime,
      interestInIntercast,
      latitude,
      longitude,
      location,
      tellUsAboutYou,
      horoscope,
      horoscopeBirthDate,
      horoscopeBirthTime,
      placeOfBirth,
      star,
      raasi,
      completedPages,
      createdDate,
      createdTime,
      modifiedDate,
      modifiedTime,
      flag,
      isVerified,
      deviceId,
      deactivateOptions,
      deactivatedDate,
      lastSeen,
      religion,
      caste,
      subCaste,
      education,
      employedIn,
      occupation,
      workCountry,
      workState,
      workCity,
      country,
      state,
      city,
      motherToungue,
      physicalStatus,
      bodyType,
      eatingHabit,
      drinkingHabit,
      smokingHabit,
      familyValue,
      familyType,
      familyStatus,
      maritalStatus,
      fatherEmployement,
      motherEmployement,
      fatherOccupation,
      motherOccupation,
      fatherEducation,
      motherEducation,
      interestCategory,
      interests,
      interestStatus,
      shortListed,
    ];
  }
}
