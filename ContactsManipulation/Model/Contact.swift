//
//  ContentView.swift
//  ContactsManipulation
//
//  Created by Singh, Akash | RIEPL on 08/08/22.
//

import SwiftUI
import RealmSwift

class Contact: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var imageName: String = ""
    @Persisted var name: String = ""
    @Persisted var phone: String = ""
    @Persisted var email: String = ""
    @Persisted var bought = false

    convenience init(imgName: String, userName: String, userNumber: String, userEmail: String) {
        self.init()
        
        self.imageName = imgName
        self.name = userName
        self.phone = userNumber
        self.email = userEmail
    }
}




