//
//  GithubAPI.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit
import Factory
import RequestDL

struct GithubAPI: Property {

    let method: HTTPMethod

    init(_ method: HTTPMethod) {
        self.method = method
    }

    var body: some Property {
        BaseURL("api.github.com")
        RequestMethod(method)

        AcceptHeader(.json)
        OriginHeader(Bundle.main.bundleIdentifier ?? ProcessInfo.processInfo.processName)

        SecureConnection {
            Trusts("github.com", in: .main)
        }
    }
}
