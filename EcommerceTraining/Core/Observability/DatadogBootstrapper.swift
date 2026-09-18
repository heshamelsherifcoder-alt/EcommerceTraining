import DatadogCore
import DatadogCrashReporting
import DatadogLogs
import DatadogProfiling
import DatadogRUM

/// Initializes Datadog for crash, hang, performance, and log monitoring.
/// Call once, as early as possible in app startup.
enum DatadogBootstrapper {
    private static let applicationID = "6a06d1b3-67eb-417b-9953-73c17f5b9919"
    private static let clientToken = "pubbe06a1f0ddf58faed1182031d6272b89"

    static func start() {
        Datadog.verbosityLevel = .debug

        Datadog.initialize(
            with: Datadog.Configuration(
                clientToken: clientToken,
                env: currentEnvironment,
                site: .us1
            ),
            trackingConsent: .granted
        )

        RUM.enable(
            with: RUM.Configuration(
                applicationID: applicationID,
                uiKitViewsPredicate: nil,
                uiKitActionsPredicate: nil,
                swiftUIViewsPredicate: DefaultSwiftUIRUMViewsPredicate(),
                swiftUIActionsPredicate: DefaultSwiftUIRUMActionsPredicate(
                    isLegacyDetectionEnabled: true
                ),
                appHangThreshold: 2.0
            )
        )

        CrashReporting.enable()
        Logs.enable()
        Profiling.enable()
    }

    private static var currentEnvironment: String {
        #if DEBUG
            "debug"
        #else
            "production"
        #endif
    }
}
