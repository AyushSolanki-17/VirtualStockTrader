class MyStock{
  final String Code;
  final int UserId;
  final String Name;
  final int Quantity;
  final double BuyingPrice;
  final double TotalAmount;
  String? BuyingDateTS;
  final String BuyingDateTMZ;

  MyStock(this.Code,this.UserId,this.Name,this.Quantity,this.BuyingPrice,this.TotalAmount,this.BuyingDateTS,this.BuyingDateTMZ);
  MyStock.newStock(this.Code, this.UserId,this.Name, this.Quantity, this.BuyingPrice,this.TotalAmount, this.BuyingDateTMZ);

  factory MyStock.fromMap(Map<String, dynamic> json) => new MyStock(json["Code"],json["UserId"],json["Name"],json["Quantity"],json["BuyingPrice"],json["TotalAmount"],json["BuyingDateTS"],json["BuyingDateTMZ"]);

  Map<String, dynamic> toMap() => {
    "Code": Code,
    "UserId":UserId,
    "Name": Name,
    "Quantity": Quantity,
    "BuyingPrice": BuyingPrice,
    "TotalAmount": TotalAmount,
    "BuyingDateTS": BuyingDateTS,
    "BuyingDateTMZ": BuyingDateTMZ,
  };

}