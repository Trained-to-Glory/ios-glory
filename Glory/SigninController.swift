import UIKit
import AWSMobileHubHelper
import GoogleSignIn
import AWSGoogleSignIn
import AWSCognitoIdentityProvider

class SigninController: UIViewController {
    
    
    @IBOutlet weak var tableFormView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgotButton: UIButton!
    
    var canCancel : Bool = true
    @objc var didCompleteSignIn: ((_ success: Bool) -> Void)? = nil
    var passwordRow : FormTableCell?
    var userNameRow : FormTableCell?
    var tableDelegate : FormTableDelegate?
    var passwordAuthenticationCompletion: AWSTaskCompletionSource<AnyObject>?
    
    var profileModel = [ProfileJSON]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set up the navigation controller
        self.setUpNavigationController()
        // set up username and password UI if user pools enabled
        self.setUpUserPoolsUI()
        // set up background
        self.setUpBackground()
    }
    
    func setUpUserPoolsUI() {
        passwordRow = FormTableCell(placeHolder: "Password", type: InputType.password)
        userNameRow = FormTableCell(placeHolder: "User Name", type: InputType.text)
        tableDelegate = FormTableDelegate()
        tableDelegate?.add(cell: userNameRow!)
        tableDelegate?.add(cell: passwordRow!)
        tableView?.delegate = tableDelegate
        tableView?.dataSource = tableDelegate
        tableView.reloadData()
        UserPoolsUIHelper.setUpFormShadow(view: tableFormView)
        self.setUpResponders()
    }
    
    func setUpBackground() {
        self.view.backgroundColor = UIColor.white
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y:0, width: self.view.frame.width, height: self.tableFormView.center.y))
        backgroundImageView.autoresizingMask = UIViewAutoresizing.flexibleWidth
        self.view.insertSubview(backgroundImageView, at: 0)
    }
    
    
    func setUpNavigationController() {
        // set up title bar
        self.navigationController?.navigationBar.topItem?.title = "Sign In"
        // allow user to cancel sign in flow if sign in not mandatory
        if (self.canCancel) {
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(barButtonClosePressed))
            cancelButton.tintColor = UIColor.white
            self.navigationController?.navigationBar.topItem?.leftBarButtonItem = cancelButton;
        }
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.darkGray
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    @objc func barButtonClosePressed() {
        self.dismiss(animated: true, completion: nil)
        if let didCompleteSignIn = self.didCompleteSignIn {
            didCompleteSignIn(false)
        }
    }
    
    func handleLoginWithSignInProvider(_ signInProvider: AWSSignInProvider) {
        AWSSignInManager.sharedInstance().login(signInProviderKey: signInProvider.identityProviderName, completionHandler: {(result: Any?, authState: AWSIdentityManagerAuthState, error: Error?) in
            print("result = \(String(describing: result)), error = \(String(describing: error))")
            // If no error reported by SignInProvider, discard the sign-in view controller.
            if error == nil {
                DispatchQueue.main.async(execute: {
                    self.dismiss(animated: true, completion: nil)
                    if let didCompleteSignIn = self.didCompleteSignIn {
                        didCompleteSignIn(true)
                    }
                })
                return
            }
            self.showErrorDialog(signInProvider.identityProviderName, withError: error! as NSError)
        })
    }
    
    func showErrorDialog(_ loginProviderName: String, withError error: NSError) {
        print("\(loginProviderName) failed to sign in w/ error: \(error)")
        let alertController = UIAlertController(title: NSLocalizedString("Sign-in Provider Sign-In Error", comment: "Sign-in error for sign-in failure."), message: NSLocalizedString("\(loginProviderName) failed to sign in w/ error: \(error)", comment: "Sign-in message structure for sign-in failure."), preferredStyle: .alert)
        let doneAction = UIAlertAction(title: NSLocalizedString("Ok", comment: "Label to cancel sign-in failure."), style: .cancel, handler: nil)
        alertController.addAction(doneAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func setUpResponders() {
        signUpButton.addTarget(self, action: #selector(handleUserPoolSignUp), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(handleUserPoolSignIn), for: .touchUpInside)
        forgotButton.addTarget(self, action: #selector(handleUserPoolForgotPassword), for: .touchUpInside)
    }
    
    
}

extension SigninController: AWSSignInDelegate {
    // delegate handler for facebook / google sign in.
    func onLogin(signInProvider: AWSSignInProvider, result: Any?, authState: AWSIdentityManagerAuthState, error: Error?) {
        // dismiss view controller if no error
        if error == nil {
            print("Signed in with: \(signInProvider)")
            self.presentingViewController?.dismiss(animated: true, completion: nil)
            if let didCompleteSignIn = self.didCompleteSignIn {
                didCompleteSignIn(true)
            }
            return
        }
        self.showErrorDialog(signInProvider.identityProviderName, withError: error! as NSError)
    }
}


