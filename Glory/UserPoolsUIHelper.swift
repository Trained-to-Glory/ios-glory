import Foundation
import UIKit

class UserPoolsUIHelper {
    // set up shadow around specified view
    static func setUpFormShadow(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5
        view.layer.cornerRadius = 10.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.masksToBounds = false
    }
}
