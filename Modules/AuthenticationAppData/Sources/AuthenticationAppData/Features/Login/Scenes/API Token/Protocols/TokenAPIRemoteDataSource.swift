//
//  APITokenRemoteDataSource.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import Factory

public protocol APITokenRemoteDataSource {}

extension Container {

    public var apiTokenRemoteDataSource: Factory<APITokenRemoteDataSource> {
        self { fatalError() }
    }
}
