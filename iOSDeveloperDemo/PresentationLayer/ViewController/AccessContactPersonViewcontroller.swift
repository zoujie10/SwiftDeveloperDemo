//
//  AccessContactPersonViewcontroller.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2019/4/6.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit
//import AddressBook
//import AddressBookUI
import Contacts
import ContactsUI

class AccessContactPersonViewcontroller: UIViewController,CNContactPickerDelegate,CNContactViewControllerDelegate {
	
	

	@IBOutlet var saerchBar: UISearchBar!
	
	override func viewDidLoad() {
        super.viewDidLoad()
//		ABAddressBook 弃用
    }
	@IBAction func addContactPerson(_ sender: UIButton) {
		let saveRequest = CNSaveRequest()
		saveRequest.add(self.createNewContact(), toContainerWithIdentifier: nil)
		let store = CNContactStore()
		do {
			try store.execute(saveRequest)
		} catch let error {
			print(error)
		}
	}
	//MARK:新增联系人
	func createNewContact()->CNMutableContact{
		let contact = CNMutableContact()
		//联系人头像
//		let path = Bundle.main.path(forResource:"Expression_1", ofType: nil)
//		contact.imageData = NSData(contentsOfFile: path!) as Data?
		contact.imageData = UIImagePNGRepresentation(UIImage.init(named: "Expression_1")!)
		//联系人姓名
		contact.givenName = "Chen Yu"
		contact.familyName = "Zhang"
		//联系人email
		let stringOne = "88881231231@qq.com"
		let homeEmail  = CNLabeledValue<NSString>(label: CNLabelHome, value:stringOne as NSString)

		let workEmail = CNLabeledValue<NSString>(label: CNLabelWork, value: "ivychen@xxxx.com")
		contact.emailAddresses = [homeEmail,workEmail]
		//联系人电话
		contact.phoneNumbers = [CNLabeledValue(label: CNLabelPhoneNumberiPhone, value:CNPhoneNumber(stringValue:"13089172112") )]
		//联系人住址
		let address = CNMutablePostalAddress()
		address.street = "zahojiabang 29#"
		address.city = "TaiZhong"
		address.state = "china"
		address.postalCode = "95032"
		contact.postalAddresses = [CNLabeledValue(label: CNLabelHome,
												  value: address)]
		//生日
		let birthday = NSDateComponents()
		birthday.day = 1
		birthday.month = 4
		birthday.year = 1988 // can omit for a year-less birthday
		contact.birthday = birthday as DateComponents
		//打印
		//打印联系人姓名
		let fullName = CNContactFormatter.string(from: contact,
												 style: .fullName)
		print(fullName as Any)
		//打印联系人住址
		let postalString = CNPostalAddressFormatter.string(from: address, style: .mailingAddress)
		print(postalString)
		return contact
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func ToContactDetail(_ sender: UIButton) {
		//		let contact = CNContactStore.unifiedContacts("123", keysToFetch: 	[CNContactViewController.descriptorForRequiredKeys])   //就是这里啦
		let temp =  CNContactStore()
		var contact = CNContact()
		do{
			contact = try temp.unifiedContact(withIdentifier: "test", keysToFetch: [CNContactViewController.descriptorForRequiredKeys()])
			
		}catch{
			
		}
		let viewController = CNContactViewController(for: contact)
		//		viewController.contactStore = self.contactStore
		viewController.delegate = self
		self.navigationController?.pushViewController(viewController, animated: true)
	}
	
	@IBAction func ToContactList(_ sender: UIButton) {
		let vc = CNContactPickerViewController()
		vc.delegate = self as CNContactPickerDelegate
		self.present(vc, animated: true, completion: nil)
	}
	
	
	@IBAction func getListData(_ sender: UIButton) {
		let predicate = CNContact.predicateForContacts(matchingName: "J")
		let keyToFetch = [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactEmailAddressesKey]
		let store = CNContactStore()
		
		let status = CNContactStore.authorizationStatus(for: .contacts)
		print("\(status)")
		
		let contacts = try?store.unifiedContacts(matching: predicate, keysToFetch: keyToFetch as [CNKeyDescriptor])
		
		for contact in contacts!{
			print("\(contact.givenName)\(contact.familyName)")
		}
	}
	

	//MARK:CNContactPickerDelegate
	func contactPickerDidCancel(_ picker: CNContactPickerViewController) {

		
		
	}
	func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
		
		let viewController = CNContactViewController(for: contact)
		viewController.delegate = self
		self.navigationController?.pushViewController(viewController, animated: true)
	}
}
