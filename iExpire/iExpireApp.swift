//
//  iExpireApp.swift
//  iExpire
//
//  Created by Ma Zhiyu on 1/19/23.
//

import SwiftUI
import FirebaseCore

@main
struct iExpireApp: App {
    
    // food tracking
    @State private var dataController = DataController()
    
    // locations
    @StateObject private var vm = LocationsViewModel()
    
    // firebase
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(vm)
        }
    }
}
