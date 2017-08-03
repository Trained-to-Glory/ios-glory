import UIKit
import Stripe
import AFNetworking

class PaymentController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let stripePublishableKey = "pk_test_86ybhlRNQgVLyNlBjTp33Rqp"
    let backendBaseURL : String? = "https://glory-test.herokuapp.com/"
    
    let paymentContext : STPPaymentContext
    let theme : STPTheme
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

