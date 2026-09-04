abstract class Payment {
  void pay();
}

class UpiPayment implements Payment {
  @override
  void pay() {
    print("UPI Payment");
  }
}

class CardPayment implements Payment {
  @override
  void pay() {
    print("Card Payment");
  }
}
class CashPayment implements Payment {
  @override
  void pay() {
    print("Cash Payment");
  }
}

main(){
  Payment payment =UpiPayment();
  payment.pay();

  payment=CardPayment();
  payment.pay();
}