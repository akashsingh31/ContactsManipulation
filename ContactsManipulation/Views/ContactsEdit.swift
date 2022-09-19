//
//  ContactsEdit.swift
//  ContactsManipulation
//
//  Created by Singh, Akash | RIEPL on 11/08/22.
//

import SwiftUI
import RealmSwift

struct ContactsEdit: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    
    @ObservedRealmObject var contact: Contact
    
    var isUpdating: Bool {
        contact.realm != nil
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $contact.name)
                TextField("Number", text: $contact.phone)
                TextField("Email", text: $contact.email)
            }
            .navigationTitle("Edit Your Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(isUpdating ? "Done" : "Save") {
                        if isUpdating {
                            dismiss()
                        } else {
                            save()
                        }
                    }
                    .disabled(contact.phone.isEmpty)
                }
            }
        }
    }
}

extension ContactsEdit {
    func save() {
        try? realm.write {
            realm.add(contact)
        }
        dismiss()
    }
}

struct ContactsEdit_Previews: PreviewProvider {
    static var previews: some View {
        ContactsEdit(contact: Contact())
        ContactsEdit(contact: Contact(imgName: "3", userName: "Akash Singh", userNumber: "123456789", userEmail: "akash@gmail.com"))
    }
}
