class Permission {
  final String? id;
  final String? expirationDate;
  final int? isFreePlan;

  const Permission({this.id, this.isFreePlan, this.expirationDate});

  static Permission fromJson(dynamic doc) => Permission(
        id: doc['id'] as String?,
        isFreePlan: doc['is_free_plan'] as int?,
        expirationDate: doc['expiration_date'] as String?,
      );

  static Permission fromDB(Map<String, Object?> json) => Permission(
        id: json['id'] as String?,
        expirationDate: json['expiration_date'] as String?,
        isFreePlan: json['is_free_plan'] as int?,
      );
}
