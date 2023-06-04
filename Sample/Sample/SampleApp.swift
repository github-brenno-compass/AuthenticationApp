//
//  SampleApp.swift
//  Sample
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import Factory
import GithubKit
import AuthenticationApp

@main
struct SampleApp: App {

    init() {
        Self.start()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .viewResolver(for: AuthenticationAppScene.self) {
                    AuthenticationAppResolver($0)
                }
                .sceneActionEnabled()
        }
    }
}

extension SampleApp {

    @MainActor
    static func start() {
        AuthenticationApp.start()

        Container.shared.navigationBuilder.register {
            NavigationBuilder()
        }

        Container.shared.navigationSplitBuilder.register {
            NavigationSplitBuilder()
        }

        Container.shared.globalConstants.register {
            GlobalConstants()
        }
    }
}
