class PaymentP {
  final String uid;
  final String paymentType;
  final String donation;
  final bool isRecurring;
  final double amount;
  final String description;
  final String deviceInfo;

  PaymentP(
      {this.uid,
      this.paymentType,
      this.amount,
      this.description,
      this.deviceInfo,
      this.donation,
      this.isRecurring});

  PaymentP.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        paymentType = data['paymentType'],
        amount = data['amount'],
        description = data['description'],
        deviceInfo = data['deviceInfo'],
        donation = data['donation'],
        isRecurring = data['isRecurring'];
}

class Payment {
  Map<String, dynamic> payment;

  Payment({this.payment});

  Payment.fromData(Map<String, dynamic> data) : payment = data;
}
