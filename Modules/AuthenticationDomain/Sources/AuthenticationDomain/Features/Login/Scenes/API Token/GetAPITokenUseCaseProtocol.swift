//
//  GetAPITokenUseCase.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory
import GithubKit

public protocol GetAPITokenUseCaseProtocol {

    func callAsFunction() throws -> String
}

public struct GetAPITokenUseCase {

    @Injected(\.tokenAPIRepository) var repository

    public init() {}
}

extension GetAPITokenUseCase: GetAPITokenUseCaseProtocol {

    public func callAsFunction() throws -> String {
        try repository.getToken()
    }
}

extension GetAPITokenUseCase: GithubKit.GetAPITokenUseCaseProtocol {}

extension Container {

    public var getAPITokenUseCase: Factory<GetAPITokenUseCaseProtocol> {
        self { GetAPITokenUseCase() }
    }
}
