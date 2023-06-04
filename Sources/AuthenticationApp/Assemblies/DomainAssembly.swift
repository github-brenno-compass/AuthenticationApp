//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import AuthenticationDomain
import Factory

struct DomainAssembly: Assembly {

    func assemble(container: Container) {
        assembleAuthorizationToken(container)
    }
}

// MARK: - Authorization Token

extension DomainAssembly {

    func assembleAuthorizationToken(_ container: Container) {

        container.getAuthorizationTokenUseCase.register {
            GetAuthorizationTokenUseCase()
        }

        container.globalGetAuthorizationTokenUseCase.register {
            GetAuthorizationTokenUseCase()
        }

        container.generateAuthorizationTokenUseCase.register {
            GenerateAuthorizationTokenUseCase()
        }

        container.deleteAuthorizationTokenUseCase.register {
            DeleteAuthorizationTokenUseCase()
        }

        container.globalDeleteAuthorizationTokenUseCase.register {
            DeleteAuthorizationTokenUseCase()
        }
    }
}
