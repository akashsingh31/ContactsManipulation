//
//  ContactCell.swift
//  ContactsManipulation
//
//  Created by Singh, Akash | RIEPL on 10/08/22.
//

import SwiftUI
import RealmSwift


struct ContactCell: View {
    @State private var contactIsSelected = false

    @ObservedRealmObject var contact: Contact

    var body: some View {
        HStack {
        Button(action: toggle) {
            Image(contact.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipped()
                .cornerRadius(50)
                .padding()
            }
            
        Button(action: updateContact) {
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.system(size: 21, weight: .medium))
                Text(contact.phone)
                    .font(.system(size: 15, weight: .light))
                    .keyboardType(.numberPad)

                Text(contact.email)
                    .font(.system(size: 15, weight: .light))
            }
        Spacer()
            }.buttonStyle(.plain)
                .disabled(contact.bought)
                .sheet(isPresented: $contactIsSelected) {
                     DetailView(contact: contact)
                   }
        }
    }
}

extension ContactCell {
  func updateContact() {
    contactIsSelected.toggle()
  }

  func toggle() {
      $contact.bought.wrappedValue.toggle()
  }
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contact: Contact(imgName: "3", userName: "Akash Singh", userNumber: "123456789", userEmail: "akashsingh@gmail.com"))
    }
}
