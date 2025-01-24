import Foundation

open class PrettyFormatter {
    public init() {}

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
