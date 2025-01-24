import Foundation

extension Data {
    /// Returns a prettified and formatted JSON string representation of the data.
    ///
    /// This computed property attempts to decode the `Data` instance as a JSON object,
    /// re-encode it as prettified JSON data, and then convert it into a UTF-8 encoded string.
    /// If any of these steps fail, it returns the string `"nil"`.
    ///
    /// - Returns: A `String` containing the prettified JSON representation, or `"nil"` if the process fails.
    public var prettyFormatted: String {
        guard
            let object = try? JSONSerialization.jsonObject(with: self),
            let data = JSONSerialization.prettyData(with: object),
            let string = String(data: data, encoding: .utf8)
        else {
            return "nil"
        }

        return string
    }
}
