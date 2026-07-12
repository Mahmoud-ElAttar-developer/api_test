import 'dart:convert';


import 'package:flutter/material.dart';

import 'address.dart';
import 'company.dart';

@immutable
class UsersModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  const UsersModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  @override
  String toString() {
    return 'UsersModel(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
  }

  factory UsersModel.fromMap(Map<String, dynamic> data) => UsersModel(
    id: data['id'] as int?,
    name: data['name'] as String?,
    username: data['username'] as String?,
    email: data['email'] as String?,
    address: data['address'] == null
        ? null
        : Address.fromMap(data['address'] as Map<String, dynamic>),
    phone: data['phone'] as String?,
    website: data['website'] as String?,
    company: data['company'] == null
        ? null
        : Company.fromMap(data['company'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'address': address?.toMap(),
    'phone': phone,
    'website': website,
    'company': company?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UsersModel].
  factory UsersModel.fromJson(String data) {
    return UsersModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UsersModel] to a JSON string.
  String toJson() => json.encode(toMap());

  UsersModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return UsersModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }
}
