//
//  DetailView.swift
//  ContactsManipulation
//
//  Created by Singh, Akash | RIEPL on 10/08/22.
//

import SwiftUI
import RealmSwift

struct DetailView: View {
    @Environment(\.realm) var realm
    @State private var contactIsSelected = false
    @ObservedRealmObject var contact: Contact
    
    var body: some View {
        VStack {
            Button(action: toggleBought){
                Image(contact.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(150)
                Text(contact.name)
                    .font(.title)
                    .fontWeight(.medium)
            }
            
            Button(action: UpdateContact) {
                Form {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(contact.name)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Phone")
                        Spacer()
                        Text(contact.phone)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(contact.email)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                }
            }.buttonStyle(.plain)
                .disabled(contact.bought)
                .sheet(isPresented: $contactIsSelected) {
                    ContactsEdit(contact: contact)
                }
        }
    }
}

extension DetailView {
    func UpdateContact() {
        contactIsSelected.toggle()
    }
    
    func toggleBought() {
        $contact.bought.wrappedValue.toggle()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(contact: Contact(imgName: "3", userName: "Akash Singh", userNumber: "9415664815", userEmail: "akash@gmail.com"))
    }
}
