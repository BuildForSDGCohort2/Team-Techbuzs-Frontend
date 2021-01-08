class Payment {
  final String uid;
  final String paymentType;
  final String donation;
  final bool isRecurring;
  final double amount;
  final String description;
  final String deviceInfo;

  Payment(
      {this.uid,
      this.paymentType,
      this.amount,
      this.description,
      this.deviceInfo,
      this.donation,
      this.isRecurring});

  Payment.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        paymentType = data['paymentType'],
        amount = data['amount'],
        description = data['description'],
        deviceInfo = data['deviceInfo'],
        donation = data['donation'],
        isRecurring = data['isRecurring'];
}
