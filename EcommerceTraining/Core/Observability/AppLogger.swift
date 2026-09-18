import DatadogLogs

/// Thin wrapper around Datadog's Logger for tracing business-logic branches
/// through a user session. Call at meaningful decision points (not every
/// line) — e.g. "offer redeemed", "checkout validation failed: reason X".
enum AppLogger {
    private static let logger = Logger.create(
        with: Logger.Configuration(name: "EcommerceTraining")
    )

    static func info(_ message: String, attributes: [String: Encodable] = [:]) {
        logger.info(message, attributes: attributes)
    }

    static func error(_ message: String, attributes: [String: Encodable] = [:]) {
        logger.error(message, attributes: attributes)
    }
}
