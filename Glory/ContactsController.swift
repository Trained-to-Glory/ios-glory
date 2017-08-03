import Foundation
import Contacts
import ContactsUI

class ContactsController: UITableViewController, CNContactPickerDelegate {
    
//    func getContacts( )  {
//        let store = CNContactStore()
//        if CNContactStore.authorizationStatus(for: .contacts) == .notDetermined {
//            store.requestAccess(for: .contacts, completionHandler: { (authorized: Bool, error: NSError?) -> Void in
//                if authorized {
//                    self.retrieveContactsWithStore(store: store)
//                } else if CNContactStore.authorizationStatus(for: .contacts) == .authorized {
//                    self.retrieveContactsWithStore(store: store)
//                }
//                } as! (Bool, Error?) -> Void)
//        }
//    }
//    
//    func addExistingContact(){
//        let contactPicker = CNContactPickerViewController()
//        contactPicker.delegate = self
//        self.present(contactPicker, animated: true, completion: nil)
//    }
    
//    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
//        NotificationCenter.defaultCenter.postNotificationName("addNewContact", object: nil, userInfo: contact)
//    }
//
//    func retrieveContactsWithStore(store: CNContactStore){
//        do {
//           let groups = try store.groups(matching: nil)
//           let predicate = CNContact.predicateForContactsInGroup(withIdentifier: groups[0].identifier)
//            let keysToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactEmailAddressesKey] as [Any]
//            let contacts = try store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
//           // Retrieved contacts objects
//           self.objects = contacts
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                self.tableView.reloadDatat()
//            })
//        } catch {
//            print(error)
//        }
//    }
//
//    // Displaying user contacts
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
//
//        let contact = self.objects[indexPath.row]
//        let formatter = CNContactFormatter()
//
//        cell.textLabel?.text = formatter.stringFromContact(contact)
//        cell.detailTextLabel?.text = contact.emailAddresses.first?.value as? String
//
//        return cell
//    }
}
