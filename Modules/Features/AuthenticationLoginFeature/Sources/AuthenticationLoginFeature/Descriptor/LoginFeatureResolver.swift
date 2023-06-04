//
//  File.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import Factory
import AuthenticationScenes
import NavigationKit
import GithubKit

public struct LoginFeatureResolver: FeatureResolver {

    @Injected(\.navigationBuilder) var navigationBuilder

    private let scene: LoginFeatureScene

    public init(_ scene: LoginFeatureScene) {
        self.scene = scene
    }

    public var body: some View {
        switch scene {
        case .login(let scene):
            navigationBuilder {
                LoginCoordinator(scene)
            }
        }
    }
}
