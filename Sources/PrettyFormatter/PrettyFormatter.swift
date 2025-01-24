import Foundation

open class PrettyFormatter {
    public init() {}

    /// Converts an object into a prettified JSON string representation.
    ///
    /// This method takes any object that conforms to JSON serialization rules,
    /// converts it into prettified JSON data, and then into a UTF-8 encoded string.
    /// If the object cannot be serialized or the data cannot be converted to a string,
    /// it returns `"nil"`.
    ///
    /// - Parameter object: The object to be formatted as prettified JSON.
    ///   This object must conform to JSON serialization rules, such as a dictionary or array.
    /// - Returns: A `String` containing the prettified JSON representation, or `"nil"` if the process fails.
    open func prettyFormatted(_ object: Any) -> String {
        guard
            let data = JSONSerialization.prettyData(with: object),
            let string = String(data: data, encoding: .utf8)
        else {
            return "nil"
        }

        return string
    }
}
