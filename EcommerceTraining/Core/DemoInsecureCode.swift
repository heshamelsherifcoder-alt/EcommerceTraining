import CryptoKit
import Foundation

/// TEMP DEMO: intentionally insecure code to prove SonarCloud catches
/// security issues SwiftLint has no rules for. Will be removed after demo.
enum DemoInsecureCode {
    static let apiPassword = "SuperSecret123!"

    static func weakHash(of value: String) -> String {
        Insecure.MD5.hash(data: Data(value.utf8))
            .map { String(format: "%02x", $0) }
            .joined()
    }
}
