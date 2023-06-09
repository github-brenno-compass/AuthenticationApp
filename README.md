# AuthenticationApp

This project is maintained by the Authentication Squad of the Compass Github SuperApp. All functionalities related to the login are developed in this library.

## Screenshots

Login |
----|
![](/.github/assets/authentication-1.png) |

## Initial Setup

The project includes a Sample app that you can use to test the available flows for Authentication. However, you need to create the `GlobalConstants.swift` file at the root of the project for it to compile successfully.

- Note: You should contact your squad's Tech Lead to obtain the values for `clientAPIToken` and `clientSecret`.

- Warning: Since this is an open-source project, **NEVER** use the actual GlobalConstants in the origin.

```swift
import GithubKit

struct GlobalConstants: GithubKit.GlobalConstants {

    let clientAPIToken: String = /* Github Client Token */
    let clientSecret: String = /* Github Client Secret */
}
```

## Dependencies

### Factory

[Factory](https://github.com/hmlongco/Factory) is a popular dependency injection module in the iOS community. The author of the project was awarded by Google for developing a library that greatly contributes to the community.

### The Composable Architecture (TCA)

[The Composable Architecture (TCA)](https://github.com/pointfreeco/swift-composable-architecture) is a very interesting library that brings a closer approach to the SwiftUI concept of handling views. The idea of having actions to change the state makes the development of screens faster and more concise. Additionally, TCA has contributed to making certain code patterns unnecessary.

### NavigationKit

[NavigationKit](https://github.com/brennobemoura/navigation-kit) is a navigation library for SwiftUI. The goal is to invert the relationship between views and the NavigationStack so that Coordinators and MiniApps can independently direct the flow regardless of the parent hierarchy.

### RequestDL

[RequestDL](https://github.com/request-dl/request-dl) is a declarative code library applied in the networking layer. It provides a series of implementations for API security, including updated protocols like mTLS. Additionally, it is entirely built using SwiftNIO, which is an Apple library focused on networking.

### SimpleKeychain

[SimpleKeychain](https://github.com/auth0/SimpleKeychain) was used as a third-party option for saving data in the Keychain. As the Authentication project will be archived soon, we wanted to give other developers the opportunity to contribute in some way to the development of this project.

Usually, we use [KeychainAccess](https://github.com/kishikawakatsumi/KeychainAccess).

### GithubKit

[GithubKit](https://github.com/github-brenno-compass/GithubKit) is a project that provides all the methods and architectural patterns for integrating the Mini App into the Super App. Its use is essential.

### GithubUI

[GithubUI](https://github.com/github-brenno-compass/GithubUI) is the Super App's project that implements the company's Design System. It provides a series of components for creating various screens.
