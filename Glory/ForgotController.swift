import Foundation
import UIKit
import AWSCognitoIdentityProvider
import AWSMobileHubHelper
import AWSCognitoUserPoolsSignIn

class ForgotController : UIViewController {
    
    var pool: AWSCognitoIdentityUserPool?
    var user: AWSCognitoIdentityUser?
    var userNameRow: FormTableCell?
    var tableDelegate: FormTableDelegate?
    
    @IBOutlet weak var tableFormView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        self.pool = AWSCognitoIdentityUserPool.default()
    }
    
    func setUp() {
        userNameRow = FormTableCell(placeHolder: "User Name", type: InputType.text)
        tableDelegate = FormTableDelegate()
        tableDelegate?.add(cell: userNameRow!)
        tableView?.delegate = tableDelegate
        tableView?.dataSource = tableDelegate
        tableView.reloadData()
        UserPoolsUIHelper.setUpFormShadow(view: tableFormView)
        
        self.setUpBackground()
    }
    
    func setUpBackground() {
        self.view.backgroundColor = UIColor.white
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y:0, width: self.view.frame.width, height: self.tableFormView.center.y))
        backgroundImageView.autoresizingMask = UIViewAutoresizing.flexibleWidth
        self.title = "Forgot Password"
        self.view.insertSubview(backgroundImageView, at: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newPasswordViewController = segue.destination as? UpdatePassword {
            newPasswordViewController.user = self.user
        }
    }
    
}
