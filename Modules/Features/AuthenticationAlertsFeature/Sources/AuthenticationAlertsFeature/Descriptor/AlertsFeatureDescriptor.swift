//
//  File.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import SwiftUI
import NavigationKit
import AuthenticationScenes

public struct AlertsFeatureDescriptor: FeatureDescriptor {

    public init() {}

    public func body(content: Content) -> some View {
        content
            .modifier(ErrorViewModifier())
    }
}
