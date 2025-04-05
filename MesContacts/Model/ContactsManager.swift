//
//  ContactsManager.swift
//  MesContacts
//
//  Created by Artur KNOTHE on 29/04/2023.
//

import Foundation
import Contacts

class ContactsManager {
    
    // MARK: - Properties
    
    static let shared = ContactsManager()
    private let contactsStore = CNContactStore()
    private var contacts = [Contact]()
    
    
    // MARK: - Private Methods
    
    private func fetchContactsFromPhone() {
        let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactEmailAddressesKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: keysToFetch)
        do {
            try contactsStore.enumerateContacts(with: request) { contact, _ in
                let name = contact.givenName + " " + contact.familyName
                var phoneNumber: String?
                if let number = contact.phoneNumbers.first?.value.stringValue {
                    phoneNumber = number
                }
                var emailAddress: String?
                if let email = contact.emailAddresses.first?.value as String? {
                    emailAddress = email
                }
                let newContact = Contact(name: name, phoneNumber: phoneNumber ?? "", mail: emailAddress ?? "")
                self.contacts.append(newContact)
            }
        } catch {
            print("Error fetching contacts from phone: \(error.localizedDescription)")
        }
    }
    
    private func fetchContactsFromAPI() {
        // Code to fetch contacts from API and add them to the 'contacts' array
    }
    
    private func fetchContactsFromDatabase() {
        // Code to fetch contacts from database and add them to the 'contacts' array
    }
    
    
    // MARK: - Public Methods
    
    func fetchContacts() -> [Contact] {
        fetchContactsFromPhone()
        fetchContactsFromAPI()
        fetchContactsFromDatabase()
        return contacts
    }
    
    func addContact(_ contact: Contact) {
        // Code to add contact to the appropriate source of data (phone, API, database)
    }
    
    func deleteContact(_ contact: Contact) {
        // Code to delete contact from the appropriate source of data (phone, API, database)
    }
}
