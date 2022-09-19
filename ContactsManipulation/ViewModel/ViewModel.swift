//
//  ViewModel.swift
//  ContactsManipulation
//
//  Created by Singh, Akash | RIEPL on 08/08/22.
//

import Foundation
import RealmSwift

class ContactViewModel{
    var models: [Contact] = []
    init(){
        let model1 = Contact(imgName: "3", userName: "Akash Singh", userNumber: "123456789", userEmail: "akash@gmail.com")
        let model2 = Contact(imgName: "1", userName: "Sandeep", userNumber: "123456789", userEmail: "sandeep@gmail.com")
        let model3 = Contact(imgName: "2", userName: "Prashant Singh", userNumber: "123456789", userEmail: "prashant@gmail.com")
        let model4 = Contact(imgName: "4", userName: "Shubham", userNumber: "123456789", userEmail: "shubham@gmail.com")
        let model5 = Contact(imgName: "6", userName: "Manoj Rana", userNumber: "123456789", userEmail: "manoj@gmail.com")
        let model6 = Contact(imgName: "5", userName: "Abhishek Singh", userNumber: "123456789", userEmail: "abhi@gmail.com")
        self.models = [model1, model2, model3, model4, model5, model6]
    }
}


