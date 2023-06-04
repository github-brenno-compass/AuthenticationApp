//
//  GenerateAuthorizationTokenUseCase.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory
import GithubKit

public protocol GenerateAuthorizationTokenUseCaseProtocol {

    func callAsFunction(_ code: String) async throws
}

public struct GenerateAuthorizationTokenUseCase {

    @Injected(\.authorizationTokenRepository) var repository

    public init() {}
}

extension GenerateAuthorizationTokenUseCase: GenerateAuthorizationTokenUseCaseProtocol {

    public func callAsFunction(_ code: String) async throws {
        try await repository.generateToken(code)
    }
}

extension Container {

    public var generateAuthorizationTokenUseCase: Factory<GenerateAuthorizationTokenUseCaseProtocol> {
        self { GenerateAuthorizationTokenUseCase() }
    }
}
