//
//  File.swift
//
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import NavigationKit
import AuthenticationScenes

public struct AlertsFeatureActions: FeatureActions {

    public init() {}

    public func body(content: Content) -> some View {
        content
            .sceneActionTransformer(for: AlertsFeatureAction.self) {
                switch $1 {
                case .error(let failure):
                    $0(failure)
                }
            }
    }
}
