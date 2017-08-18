import Foundation
import UIKit
import AWSCore
import AWSMobileHubHelper
import AWSCognitoUserPoolsSignIn
import AWSGoogleSignIn

class AWSMobileClient: NSObject {
    static let sharedInstance = AWSMobileClient()
    fileprivate var isInitialized: Bool
    static let remoteNotificationKey = "RemoteNotification"
    
    fileprivate override init() {
        isInitialized = false
        super.init()
    }
    
    deinit {
        print("Mobile Client deinitialized. This should not happen.")
    }
    
    
    func withApplication(_ application: UIApplication, withURL url: URL, withSourceApplication sourceApplication: String?, withAnnotation annotation: Any) -> Bool {
        print("withApplication:withURL")
        AWSSignInManager.sharedInstance().interceptApplication(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        
        if (!isInitialized) {
            isInitialized = true
        }
        
        return false;
    }
    
    /**
     * Performs any additional activation steps required of the third party services
     * e.g. Facebook
     *
     * - parameter application: from application delegate.
     */
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive:")
    }
    
    
    /**
     * Configures all the enabled AWS services from application delegate with options.
     *
     * - parameter application: instance from application delegate.
     * - parameter launchOptions: from application delegate.
     */
    func didFinishLaunching(_ application: UIApplication, withOptions launchOptions: [AnyHashable: Any]?) -> Bool {
        print("didFinishLaunching:")
        
        // Register the sign in provider instances with their unique identifier
        AWSSignInManager.sharedInstance().register(signInProvider: AWSGoogleSignInProvider.sharedInstance())
        AWSSignInManager.sharedInstance().register(signInProvider: AWSCognitoUserPoolsSignInProvider.sharedInstance())
        AWSIdentityProfileManager.sharedInstance().register(UserPoolsIdentityProfile.sharedInstance(), forProviderKey: AWSCognitoUserPoolsSignInProvider.sharedInstance().identityProviderName)
        
        // set up Cloud Logic API invocation clients
        setupCloudLogicAPI()
        
        
        let didFinishLaunching: Bool = AWSSignInManager.sharedInstance().interceptApplication(application, didFinishLaunchingWithOptions: launchOptions)
        
        if (!isInitialized) {
            AWSSignInManager.sharedInstance().resumeSession(completionHandler: { (result: Any?, authState: AWSIdentityManagerAuthState, error: Error?) in
                print("Result: \(result) AuthState: \(authState) \n Error:\(error)")
            }) // If you get an EXC_BAD_ACCESS here in iOS Simulator, then do Simulator -> "Reset Content and Settings..."
            // This will clear bad auth tokens stored by other apps with the same bundle ID.
            isInitialized = true
        }
        
        return didFinishLaunching
    }
    
    func setupCloudLogicAPI() {
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "us-east-1:eda0e1f6-58cc-40c8-afb3-347abf632a4e")
        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
    }
}
