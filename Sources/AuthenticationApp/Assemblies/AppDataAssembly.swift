//
//  File.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import AuthenticationDomain
import AuthenticationAppData
import Factory

struct AppDataAssembly: Assembly {

    func assemble(container: Container) {
        assembleAuthorizationToken(container)
    }
}

// MARK: - Authorization Token

extension AppDataAssembly {

    func assembleAuthorizationToken(_ container: Container) {

        container.authorizationTokenRepository.register {
            AuthorizationTokenRepository()
        }
    }
}
