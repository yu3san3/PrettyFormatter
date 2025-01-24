import Foundation

extension JSONSerialization {
    /// Converts an object into a prettified JSON Data object.
    ///
    /// This method takes any object that conforms to the JSON serialization rules
    /// and returns a `Data` object containing the prettified JSON representation.
    /// If the object cannot be serialized into JSON, it returns `nil`.
    ///
    /// - Parameter object: The object to be serialized into JSON.
    ///   This object must conform to JSON serialization rules, such as a dictionary or array.
    /// - Returns: A `Data` object containing the prettified JSON, or `nil` if the object is invalid.
    static func prettyData(with object: Any) -> Data? {
        guard Self.isValidJSONObject(object) else { return nil }

        return try? Self.data(
            withJSONObject: object,
            options: .prettyPrinted
        )
    }
}
