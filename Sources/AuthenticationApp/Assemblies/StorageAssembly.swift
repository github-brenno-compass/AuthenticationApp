//
//  File.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import AuthenticationAppData
import AuthenticationStorage
import Factory

struct StorageAssembly: Assembly {

    func assemble(container: Container) {
        assembleAuthorizationToken(container)
    }
}

// MARK: - Authorization Token

extension StorageAssembly {

    func assembleAuthorizationToken(_ container: Container) {

        container.authorizationTokenLocalDataSource.register {
            AuthenticationStorage.AuthorizationTokenLocalDataSource()
        }
    }
}
