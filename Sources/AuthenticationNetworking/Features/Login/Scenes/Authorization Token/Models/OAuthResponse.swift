//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation

struct OAuthResponse: Decodable {

    let accessToken: String
}

extension OAuthResponse {

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
