//
//  File.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import AuthenticationScenes
import NavigationKit

public struct LoginFeatureResolver: FeatureResolver {

    private let scene: LoginFeatureScene

    public init(_ scene: LoginFeatureScene) {
        self.scene = scene
    }

    public var body: some View {
        switch scene {
        case .login(let scene):
            LoginCoordinator(scene: scene)
        }
    }
}
