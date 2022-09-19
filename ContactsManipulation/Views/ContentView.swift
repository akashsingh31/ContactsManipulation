//
//  ContentView.swift
//  ContactsManipulation
//
//  Created by Singh, Akash | RIEPL on 08/08/22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedRealmObject var contact: Contact
    @State private var addContact = false
    
    @State private var contactIsPresented = false
    @State var viewModel = ContactViewModel()
    @Environment(\.realm) var realm
    
    var count:Int
    
    @ViewBuilder var newContact: some View {
        Button(action: AddNewContact) {
            Label("Add New Contact", systemImage: "plus.circle.fill")
        }
        .foregroundColor(.green)
        .sheet(isPresented: $contactIsPresented) {
            ContactsEdit(contact: Contact())
        }
    }
    
    @ObservedResults(
        Contact.self,
        where: { $0.bought == false }
    ) var contacts
    
    @ObservedResults(
        Contact.self,
        where: { $0.bought == true }
    ) var deletedContacts
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(0..<self.count, id: \.self) { index in
                        let dataModel = viewModel.models[index % viewModel.models.count]
                        NavigationLink(destination: DetailView(contact: dataModel)) {
                            ContactCell(contact: Contact(imgName: dataModel.imageName, userName: dataModel.name, userNumber: dataModel.phone, userEmail: dataModel.email))
                            
                        }

                    }
                    ForEach(contacts) { index in
                        ContactCell(contact: index)
                    }
                    .onDelete(perform: $contacts.remove)
                    .onAppear {
                        viewModel = ContactViewModel()
                        realmSchemaUpdate()
                    }
                }.navigationTitle("Contact List")
                    .toolbar {
                        Button {
                            addContact = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    .sheet(isPresented: $addContact) {
                        ContactsEdit(contact: contact)
                    }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

extension ContentView {
    func AddNewContact() {
        contactIsPresented.toggle()
    }
    
    func realmSchemaUpdate(){
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
            })
        Realm.Configuration.defaultConfiguration = config
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contact: Contact(), count: 6)
    }
}

