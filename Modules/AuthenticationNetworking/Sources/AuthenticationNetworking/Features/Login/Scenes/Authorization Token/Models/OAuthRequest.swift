//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation

struct OAuthRequest: Encodable {

    let clientID: String
    let clientSecret: String
    let code: String
}

extension OAuthRequest {

    enum CodingKeys: String, CodingKey {
        case clientID = "client_id"
        case clientSecret = "client_secret"
        case code
    }
}
