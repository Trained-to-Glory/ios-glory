import Foundation
import AWSCognitoIdentityProvider
import AWSMobileHubHelper

class UpdatePassword : UIViewController {
    
    var user: AWSCognitoIdentityUser?
    var newPasswordRow: FormTableCell?
    var confirmationCodeRow: FormTableCell?
    var tableDelegate: FormTableDelegate?
    
    @IBOutlet weak var tableFormView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    func setUp() {
        newPasswordRow = FormTableCell(placeHolder: "New Password", type: InputType.password)
        confirmationCodeRow = FormTableCell(placeHolder: "Confirmation Code", type: InputType.text)
        
        tableDelegate = FormTableDelegate()
        tableDelegate?.add(cell: newPasswordRow!)
        tableDelegate?.add(cell: confirmationCodeRow!)
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
        self.view.insertSubview(backgroundImageView, at: 0)
    }
    
    
}
