class Account {
  String type;
  String recordDate;
  double money;
  String desc;
  String category;

  Account(this.type, this.recordDate, this.money, this.desc, this.category);

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      json['type'],
      json['recordDate'],
      json['money'],
      json['desc'],
      json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'recordDate': recordDate,
      'money': money,
      'desc': desc,
      'category': category,
    };
  }

  @override
  String toString() {
    return 'Account{type: $type, recordDate: $recordDate, money: $money, desc: $desc, category: $category}';    
  }
}