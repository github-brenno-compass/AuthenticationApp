//
//  File.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import GithubKit
import NavigationKit
import AuthenticationAlertsFeature
import AuthenticationLoginFeature

public struct AuthenticationAppActions: MiniAppActions {

    public init() {}

    public func body(content: Content) -> some View {
        content
            .modifier(AlertsFeatureActions())
            .modifier(LoginFeatureActions())
    }
}
