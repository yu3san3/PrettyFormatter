import Foundation

enum PrettyFormatterError: Error {
    case couldNotFormatToJSON
    case failedToEncode

    var errorDescription: String {
        let message = switch self {
        case .couldNotFormatToJSON: "Could not format to JSON."
        case .failedToEncode: "Failed to encode to Data."
        }

        return "PrettyFormatter Error: \(message)"
    }
}
