import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class PaypalWeb extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var kHtml = '''
<div id="paypal-button"></div>
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<script>
  paypal.Button.render({
    // Configure environment
    env: 'production',
    client: {
      sandbox: 'demo_sandbox_client_id',
      production: 'ATEWCOiV1_r1lirHruJEPVQhkon534MTBAs7lGWyTGvQihhUi8DfLnxw2FnYCOQlctV0fVPJAR28OsvJ'
    },
    // Customize button (optional)
    locale: 'en_US',
    style: {
      size: 'small',
      color: 'gold',
      shape: 'pill',
    },

    // Enable Pay Now checkout flow (optional)
    commit: true,

    // Set up a payment
    payment: function(data, actions) {
      return actions.payment.create({
        transactions: [{
          amount: {
            total: '10',
            currency: 'USD'
          }
        }]
      });
    },
    // Execute the payment
    onAuthorize: function(data, actions) {
      return actions.payment.execute().then(function() {
        // Show a confirmation message to the buyer
        window.alert('Thank you for your purchase!');
      });
    }
  }, '#paypal-button');

</script>
''';
    return Container(
      
          child: HtmlWidget(kHtml),
       
    );
  }
}
