import UIKit

class SignupController: UIViewController {
    
    let profileModel = ProfileModel()
    
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var fullName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
    //Save user info and create account
    @IBAction func createAccount(_ sender: Any) {
        //Send user input to dynamo
        profileModel.createAccount(email: self.email.text!, fullName: self.fullName.text!, userName: self.userName.text!)
        
    }
    
}
