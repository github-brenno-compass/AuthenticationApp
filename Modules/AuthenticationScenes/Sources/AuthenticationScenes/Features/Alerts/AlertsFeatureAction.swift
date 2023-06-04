//
//  AlertsFeatureAction.swift
//  
//
//  Created by Brenno on 04/06/23.
//

import Foundation
import GithubKit

public enum AlertsFeatureAction: Hashable {

    case error(Failure)
}

extension AlertsFeatureAction {

    public typealias Failure = AuthenticationAppAction.Failure
}
