class CaseModel {

  int id;
  String name;

  CaseModel({ required this.id, required this.name });

  factory CaseModel.fromJson(Map<String, dynamic> json){
    return CaseModel(
      id: json['id'],
      name: json['name']
    );
      
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}