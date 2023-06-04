//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import GithubKit
import NavigationKit
import Factory
import AuthenticationLoginFeature

public struct AuthenticationAppResolver: MiniAppResolver {

    private let scene: AuthenticationAppScene

    public init(_ scene: AuthenticationAppScene) {
        self.scene = scene
    }

    public var body: some View {
        switch scene {
        case .login(let scene):
            LoginFeatureResolver(.login(scene))
        }
    }
}
