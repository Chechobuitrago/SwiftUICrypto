//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by Sergio Buitrago on 23/08/24.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .toolbar(.hidden, for: .navigationBar)
            .environmentObject(vm)
        }
    }
}
