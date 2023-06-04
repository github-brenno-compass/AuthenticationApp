//
//  APITokenLocalDataSource.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol APITokenLocalDataSource {

    func getToken() throws -> String
}

extension Container {

    public var apiTokenLocalDataSource: Factory<APITokenLocalDataSource> {
        self { fatalError() }
    }
}
