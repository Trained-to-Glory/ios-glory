import UIKit

class ProfileController: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var userBio: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
   
    var profileModel = [ProfileJSON]()
    var profileDetails = [ProfileJSON]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get Users Account Info
        userBio.text = "Some words"
        profilePicture.image = #imageLiteral(resourceName: "batman")
    }
    
    // MARK: - Create/Update Profile Picture
    // On-click allow user to access resources
    
    @IBAction func activateCamera(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Profile Picture", message: "Select A Profile Picture.", preferredStyle: .actionSheet)
        let accessLibrary = UIAlertAction(title: "Photo Library", style: .default, handler: { (action) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
        })
        
        let accessCamera = UIAlertAction(title: "Camera", style: .default, handler: { (action) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        })
        
        alertController.addAction(accessCamera)
        alertController.addAction(accessLibrary)
        present(alertController, animated: true, completion: nil)
    }
    
    // Select/Save Image
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        let chosenImage = image
        profilePicture.contentMode = .scaleAspectFit
        profilePicture.image = chosenImage
        // Send image data to data model
        
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Get Account Info
    
    func getAccount(){
        profileModel = ProfileJSON.readListOfAccounts()
        profileDetails = ProfileJSON.readAccountDetailJson()
        profilePicture.image = UIImage(named: profileModel[0].userPhoto!)
        userBio.text = profileDetails[0].userBio
        userName.text = profileModel[0].userName
    }
    
}
