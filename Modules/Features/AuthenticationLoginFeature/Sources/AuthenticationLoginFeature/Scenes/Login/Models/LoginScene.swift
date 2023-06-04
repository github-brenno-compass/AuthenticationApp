//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import AuthenticationScenes
import ComposableArchitecture

typealias LoginScene = LoginFeatureScene.Login

extension LoginScene {

    var store: StoreOf<LoginReducer> {
        .init(
            initialState: .init(self),
            reducer: LoginReducer()
        )
    }
}
