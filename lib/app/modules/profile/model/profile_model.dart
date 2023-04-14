class ProfileModel {
  final String? success;
  final Data? data;
  final dynamic message;
  final dynamic error;

  ProfileModel({
    this.success,
    this.data,
    this.message,
    this.error,
  });

  ProfileModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null,
        message = json['message'],
        error = json['error'];

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
        'error': error
      };
}

class Data {
  final String? id;
  final String? code;
  final String? fullName;
  final dynamic nameAlias;
  final String? birthDate;
  final dynamic gender;
  final String? avatar;
  final dynamic slugName;
  final dynamic aboutMe;
  final Pregnancy? pregnancy;
  final List<Interests>? interests;
  final User? user;

  Data({
    this.id,
    this.code,
    this.fullName,
    this.nameAlias,
    this.birthDate,
    this.gender,
    this.avatar,
    this.slugName,
    this.aboutMe,
    this.pregnancy,
    this.interests,
    this.user,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        code = json['code'] as String?,
        fullName = json['full_name'] as String?,
        nameAlias = json['name_alias'],
        birthDate = json['birth_date'] as String?,
        gender = json['gender'],
        avatar = json['avatar'] as String?,
        slugName = json['slug_name'],
        aboutMe = json['about_me'],
        pregnancy = (json['pregnancy'] as Map<String, dynamic>?) != null
            ? Pregnancy.fromJson(json['pregnancy'] as Map<String, dynamic>)
            : null,
        interests = (json['interests'] as List?)
            ?.map((dynamic e) => Interests.fromJson(e as Map<String, dynamic>))
            .toList(),
        user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'full_name': fullName,
        'name_alias': nameAlias,
        'birth_date': birthDate,
        'gender': gender,
        'avatar': avatar,
        'slug_name': slugName,
        'about_me': aboutMe,
        'pregnancy': pregnancy?.toJson(),
        'interests': interests?.map((e) => e.toJson()).toList(),
        'user': user?.toJson()
      };
}

class Pregnancy {
  final String? id;
  final Status? status;
  final dynamic estimatedDueDate;
  final dynamic childBirthDate;

  Pregnancy({
    this.id,
    this.status,
    this.estimatedDueDate,
    this.childBirthDate,
  });

  Pregnancy.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        status = (json['status'] as Map<String, dynamic>?) != null
            ? Status.fromJson(json['status'] as Map<String, dynamic>)
            : null,
        estimatedDueDate = json['estimated_due_date'],
        childBirthDate = json['child_birth_date'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status?.toJson(),
        'estimated_due_date': estimatedDueDate,
        'child_birth_date': childBirthDate
      };
}

class Status {
  final String? id;
  final String? type;
  final String? name;
  final dynamic parent;
  final dynamic icon;
  final dynamic value;

  Status({
    this.id,
    this.type,
    this.name,
    this.parent,
    this.icon,
    this.value,
  });

  Status.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        type = json['type'] as String?,
        name = json['name'] as String?,
        parent = json['parent'],
        icon = json['icon'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'parent': parent,
        'icon': icon,
        'value': value
      };
}

class Interests {
  final String? id;
  final InterestsInner? interests;

  Interests({
    this.id,
    this.interests,
  });

  Interests.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        interests = (json['interests'] as Map<String, dynamic>?) != null
            ? InterestsInner.fromJson(json['interests'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'id': id, 'interests': interests?.toJson()};
}

class InterestsInner {
  final String? id;
  final String? type;
  final String? name;
  final dynamic parent;
  final dynamic icon;
  final dynamic value;

  InterestsInner({
    this.id,
    this.type,
    this.name,
    this.parent,
    this.icon,
    this.value,
  });

  InterestsInner.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        type = json['type'] as String?,
        name = json['name'] as String?,
        parent = json['parent'],
        icon = json['icon'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'parent': parent,
        'icon': icon,
        'value': value
      };
}

class User {
  final String? id;
  final dynamic username;
  final String? email;
  final dynamic phoneNumber;
  final bool? isVerified;
  final String? lastLogin;

  User({
    this.id,
    this.username,
    this.email,
    this.phoneNumber,
    this.isVerified,
    this.lastLogin,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        username = json['username'],
        email = json['email'] as String?,
        phoneNumber = json['phone_number'],
        isVerified = json['is_verified'] as bool?,
        lastLogin = json['last_login'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'phone_number': phoneNumber,
        'is_verified': isVerified,
        'last_login': lastLogin
      };
}
