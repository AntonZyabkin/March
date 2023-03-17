//
//  EMApp.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import SwiftUI

@main
struct EMApp: App {
    
    let appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
//            appCoordinator.home()
//            appCoordinator.test()
            TabBarView()
        }
    }
}
