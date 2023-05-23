class Unborn {
  String? unbornBabyName;
  String? dueDate;
  bool? isEnter = false;

  Unborn({this.unbornBabyName, this.dueDate});

  factory Unborn.fromJson(Map<String, dynamic> json) => Unborn(
        unbornBabyName: json['unborn_baby_name'],
        dueDate: json['due_date'],
      );

  Map<String, dynamic> toJson() => {
        'unborn_baby_name': unbornBabyName,
        'due_date': dueDate,
      };
}
