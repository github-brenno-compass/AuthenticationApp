//
//  APITokenRepositoryProtocol.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol APITokenRepositoryProtocol {

    func getToken() throws -> String
}

extension Container {

    public var tokenAPIRepository: Factory<APITokenRepositoryProtocol> {
        self { fatalError() }
    }
}
