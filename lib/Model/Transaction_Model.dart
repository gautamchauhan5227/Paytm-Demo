class Transactions {
  int id;
  String number;
  String transactionID;
  String transactionMoney;
  String transactionTime;

  Transactions(this.id, this.number, this.transactionID, this.transactionMoney, this.transactionTime);

  //Convert a User into a map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['number'] = number;
    map['transactionID'] = transactionID;
    map['transactionMoney'] = transactionMoney;
    map['transactionTime'] = transactionTime;
    return map;
  }

  //Extract a User object from Map object
  Transactions.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.number = map['number'];
    this.transactionID = map['transactionID'];
    this.transactionMoney = map['transactionMoney'];
    this.transactionTime = map['transactionTime'];
  }
}
