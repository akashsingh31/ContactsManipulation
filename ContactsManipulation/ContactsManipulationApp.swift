//
//  ContentView.swift
//  ContactsManipulation
//
//  Created by Singh, Akash | RIEPL on 08/08/22.
//

import SwiftUI

@main
struct ContactsManipulationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(contact: Contact(), count: 5)
        }
    }
}
