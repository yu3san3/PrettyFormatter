import Foundation

extension Encodable {
    private static var encoder: JSONEncoder {
        let encoder = JSONEncoder()

        // Set a custom date encoding strategy for the JSONEncoder
        encoder.dateEncodingStrategy = .custom { date, encoder in
            var container = encoder.singleValueContainer()
            try container.encode(date.description)
        }

        return encoder
    }

    public var prettyFormatted: String {
        guard
            let data = try? Self.encoder.encode(self)
        else {
            return "nil"
        }

        return data.prettyFormatted
    }
}
