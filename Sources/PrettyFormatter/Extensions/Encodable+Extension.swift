import Foundation

extension Encodable {
    /// A JSONEncoder instance with a custom configuration.
    private static var encoder: JSONEncoder {
        let encoder = JSONEncoder()

        // Set a custom date encoding strategy for the JSONEncoder
        encoder.dateEncodingStrategy = .custom { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(date.description)
        }

        return encoder
    }

    /// Returns a prettified and formatted JSON string representation of the instance.
    ///
    /// This computed property encodes the current instance into JSON using the custom `JSONEncoder`,
    /// then formats the resulting JSON data into a human-readable string.
    /// If encoding fails, it returns the error massage string.
    ///
    /// - Returns: A `String` containing the prettified JSON representation, or error message if encoding fails.
    public var prettyFormatted: String {
        guard
            let data = try? Self.encoder.encode(self)
        else {
            return PrettyFormatterError.failedToEncode.errorDescription
        }

        return data.prettyFormatted
    }
}
