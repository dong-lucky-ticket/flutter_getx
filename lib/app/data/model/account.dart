import 'dart:convert';

class AccountModal {
  String id;
  String type;
  String recordDate;
  double money;
  String desc;
  String category;


  AccountModal({
    required this.id,
    required this.type,
    required this.recordDate,
    required this.money,
    required this.desc,
    required this.category,
  });

  AccountModal copyWith({
    String? id,
    String? type,
    String? recordDate,
    double? money,
    String? desc,
    String? category,
  }) {
    return AccountModal(
      id: id ?? this.id,
      type: type ?? this.type,
      recordDate: recordDate ?? this.recordDate,
      money: money ?? this.money,
      desc: desc ?? this.desc,
      category: category ?? this.category,
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
    };
  }

  factory AccountModal.fromMap(Map<String, dynamic> map) {
    return AccountModal(
      id: map['id'] as String,
      type: map['type'] as String,
      recordDate: map['recordDate'] as String,
      money: map['money'].toDouble(),
      desc: map['desc'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModal.fromJson(String source) => AccountModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountModal(id: $id, type: $type, recordDate: $recordDate, money: $money, desc: $desc, category: $category)';
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
      other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      type.hashCode ^
      recordDate.hashCode ^
      money.hashCode ^
      desc.hashCode ^
      category.hashCode;
  }
  
}
