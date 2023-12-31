//
//  To_Do_ListApp.swift
//  To-Do List
//
//  Created by Nikhil Lalam on 12/26/23.
//

import SwiftUI

import FirebaseCore
import FirebaseAppCheck
@main
struct To_Do_ListApp: App {
    
    init() {
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
            FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainViewToDo()
        }
    }
}

