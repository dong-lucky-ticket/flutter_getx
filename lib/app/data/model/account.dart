import 'dart:convert';

class AccountModal {
  String? id;
  String type;
  String category;
  double money;
  String recordDate;
  String desc;
  String? chennel;


  AccountModal({
    required this.type,
    required this.recordDate,
    required this.money,
    required this.desc,
    required this.category,
    this.id,
    this.chennel,
  });

  AccountModal copyWith({
    String? id,
    String? type,
    String? recordDate,
    double? money,
    String? desc,
    String? category,
    String? chennel,
  }) {
    return AccountModal(
      id: id ?? this.id,
      type: type ?? this.type,
      recordDate: recordDate ?? this.recordDate,
      money: money ?? this.money,
      desc: desc ?? this.desc,
      category: category ?? this.category,
      chennel: chennel?? this.chennel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'recordDate': recordDate,
      'money': money,
      'desc': desc,
      'category': category,
      'chennel': chennel,
    };
  }

  factory AccountModal.fromMap(Map<String, dynamic> map) {
    return AccountModal(
      type: map['type'] as String,
      recordDate: map['recordDate'] as String,
      money: map['money'].toDouble(),
      desc: map['desc'] as String,
      category: map['category'] as String,
      id: map['id'] != null? map['id'] as String : null,
      chennel: map['chennel'] != null ? map['chennel'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModal.fromJson(String source) => AccountModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountModal(id: $id, type: $type, recordDate: $recordDate, money: $money, desc: $desc, category: $category, chennel: $chennel)';
  }

  @override
  bool operator ==(covariant AccountModal other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.type == type &&
      other.recordDate == recordDate &&
      other.money == money &&
      other.desc == desc &&
      other.category == category &&
      other.chennel == chennel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      type.hashCode ^
      recordDate.hashCode ^
      money.hashCode ^
      desc.hashCode ^
      category.hashCode ^
      chennel.hashCode;
  }
  
}
