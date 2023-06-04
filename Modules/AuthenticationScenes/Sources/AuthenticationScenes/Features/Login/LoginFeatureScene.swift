//
//  File.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit

public enum LoginFeatureScene {

    case login(Login)
}

extension LoginFeatureScene: Hashable {

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .login(let scene):
            scene.hash(into: &hasher)
        }
    }
}

extension LoginFeatureScene {

    public typealias Login = AuthenticationAppScene.Login
}
