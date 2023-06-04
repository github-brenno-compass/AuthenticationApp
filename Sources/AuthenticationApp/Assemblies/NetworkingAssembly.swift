//
//  File.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import AuthenticationAppData
import AuthenticationNetworking
import Factory

struct NetworkingAssembly: Assembly {

    func assemble(container: Container) {
        assembleAuthorizationToken(container)
    }
}

// MARK: - Authorization Token

extension NetworkingAssembly {

    func assembleAuthorizationToken(_ container: Container) {

        container.authorizationTokenRemoteDataSource.register {
            AuthenticationNetworking.AuthorizationTokenRemoteDataSource()
        }
    }
}
