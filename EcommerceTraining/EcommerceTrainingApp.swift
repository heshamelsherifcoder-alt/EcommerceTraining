//
//  EcommerceTrainingApp.swift
//  EcommerceTraining
//
//  Created by hesham on 16/09/2026.
//

import SwiftUI

@main
struct EcommerceTrainingApp: App {
    init() {
        DatadogBootstrapper.start()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
