import Foundation

extension Optional where Wrapped: CustomStringConvertible {
    /// Returns the description of the wrapped value if it exists, or `"nil"` if the value is `nil`.
    ///
    /// Example:
    /// ```swift
    /// let value: String? = "Hello"
    /// print(value.descriptionOrNil) // Output: "Hello"
    ///
    /// let emptyValue: String? = nil
    /// print(emptyValue.descriptionOrNil) // Output: "nil"
    /// ```
    public var descriptionOrNil: String {
        self?.description ?? "nil"
    }
}
