//
//  CodingTestApp.swift
//  coding-test-app
//
//  Created by Jay Park on 7/07/23.
//

import SwiftUI

@main
struct CodingTestApp: App {
    @StateObject var localizationManager = LocalizationManager()
    
    var body: some Scene {
        WindowGroup {
            HomeCoordinatorView()
                .environmentObject(localizationManager)
        }
    }
}
