// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: (json['id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      currentUser: (json['current_user'] as num?)?.toInt(),
      customerUid: json['customer_uid'] as String?,
      profileCreationFor: json['profile_creation_for'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      fair: json['fair'] as String?,
      profileVideo: json['profile_video'],
      address: json['address'],
      corporation: json['corporation'],
      wardNumber: json['ward_number'],
      documentType: json['document_type'],
      documentNumber: json['document_number'],
      documentFile: json['document_file'],
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      socialMediaAccount: json['social_media_account'] as String?,
      physicallyChallenged: json['physically_challenged'] as String?,
      aboutFamily: json['about_family'] as String?,
      citizenship: json['citizenship'],
      ancestralOrigin: json['ancestral_origin'],
      annualIncome: json['annual_income'] as String?,
      collegeName: json['college_name'],
      isPrime: json['is_prime'] as bool?,
      interestInIntercast: json['interest_in_intercast'] as bool?,
      latitude: json['latitude'],
      longitude: json['longitude'],
      location: json['location'],
      tellUsAboutYou: json['tell_us_about_you'] as String?,
      horoscope: json['horoscope'],
      horoscopeBirthDate: json['horoscope_birth_date'],
      horoscopeBirthTime: json['horoscope_birth_time'],
      placeOfBirth: json['place_of_birth'] as String?,
      star: json['star'] as String?,
      raasi: json['raasi'],
      completedPages: json['completed_pages'] as String?,
      createdDate: json['created_date'] as String?,
      createdTime: json['created_time'] as String?,
      modifiedDate: json['modified_date'] as String?,
      modifiedTime: json['modified_time'] as String?,
      flag: json['flag'] as bool?,
      isVerified: json['is_verified'] as bool?,
      deviceId: json['device_id'],
      deactivateOptions: json['deactivate_options'],
      deactivatedDate: json['deactivated_date'],
      lastSeen: json['last_seen'],
      religion: (json['religion'] as num?)?.toInt(),
      caste: (json['caste'] as num?)?.toInt(),
      subCaste: json['sub_caste'],
      education: json['education'],
      employedIn: json['employed_in'],
      occupation: json['occupation'],
      workCountry: json['work_country'],
      workState: json['work_state'],
      workCity: json['work_city'],
      country: (json['country'] as num?)?.toInt(),
      state: (json['state'] as num?)?.toInt(),
      city: (json['city'] as num?)?.toInt(),
      motherToungue: json['mother_toungue'],
      physicalStatus: json['physical_status'],
      bodyType: json['body_type'],
      eatingHabit: json['eating_habit'],
      drinkingHabit: json['drinking_habit'],
      smokingHabit: json['smoking_habit'],
      familyValue: json['family_value'],
      familyType: json['family_type'],
      familyStatus: json['family_status'],
      maritalStatus: json['marital_status'],
      fatherEmployement: json['father_employement'],
      motherEmployement: json['mother_employement'],
      fatherOccupation: json['father_occupation'],
      motherOccupation: json['mother_occupation'],
      fatherEducation: json['father_education'],
      motherEducation: json['mother_education'],
      interestCategory: json['interest_category'] as List<dynamic>?,
      interests: json['interests'] as List<dynamic>?,
      interestStatus: json['interest_status'] == null
          ? null
          : InterestStatus.fromJson(
              json['interest_status'] as Map<String, dynamic>),
      shortListed: json['short_listed'] as bool?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'current_user': instance.currentUser,
      'customer_uid': instance.customerUid,
      'profile_creation_for': instance.profileCreationFor,
      'dob': instance.dob,
      'gender': instance.gender,
      'fair': instance.fair,
      'profile_video': instance.profileVideo,
      'address': instance.address,
      'corporation': instance.corporation,
      'ward_number': instance.wardNumber,
      'document_type': instance.documentType,
      'document_number': instance.documentNumber,
      'document_file': instance.documentFile,
      'height': instance.height,
      'weight': instance.weight,
      'social_media_account': instance.socialMediaAccount,
      'physically_challenged': instance.physicallyChallenged,
      'about_family': instance.aboutFamily,
      'citizenship': instance.citizenship,
      'ancestral_origin': instance.ancestralOrigin,
      'annual_income': instance.annualIncome,
      'college_name': instance.collegeName,
      'is_prime': instance.isPrime,
      'interest_in_intercast': instance.interestInIntercast,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'location': instance.location,
      'tell_us_about_you': instance.tellUsAboutYou,
      'horoscope': instance.horoscope,
      'horoscope_birth_date': instance.horoscopeBirthDate,
      'horoscope_birth_time': instance.horoscopeBirthTime,
      'place_of_birth': instance.placeOfBirth,
      'star': instance.star,
      'raasi': instance.raasi,
      'completed_pages': instance.completedPages,
      'created_date': instance.createdDate,
      'created_time': instance.createdTime,
      'modified_date': instance.modifiedDate,
      'modified_time': instance.modifiedTime,
      'flag': instance.flag,
      'is_verified': instance.isVerified,
      'device_id': instance.deviceId,
      'deactivate_options': instance.deactivateOptions,
      'deactivated_date': instance.deactivatedDate,
      'last_seen': instance.lastSeen,
      'religion': instance.religion,
      'caste': instance.caste,
      'sub_caste': instance.subCaste,
      'education': instance.education,
      'employed_in': instance.employedIn,
      'occupation': instance.occupation,
      'work_country': instance.workCountry,
      'work_state': instance.workState,
      'work_city': instance.workCity,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'mother_toungue': instance.motherToungue,
      'physical_status': instance.physicalStatus,
      'body_type': instance.bodyType,
      'eating_habit': instance.eatingHabit,
      'drinking_habit': instance.drinkingHabit,
      'smoking_habit': instance.smokingHabit,
      'family_value': instance.familyValue,
      'family_type': instance.familyType,
      'family_status': instance.familyStatus,
      'marital_status': instance.maritalStatus,
      'father_employement': instance.fatherEmployement,
      'mother_employement': instance.motherEmployement,
      'father_occupation': instance.fatherOccupation,
      'mother_occupation': instance.motherOccupation,
      'father_education': instance.fatherEducation,
      'mother_education': instance.motherEducation,
      'interest_category': instance.interestCategory,
      'interests': instance.interests,
      'interest_status': instance.interestStatus,
      'short_listed': instance.shortListed,
    };
