import Foundation

extension Data {
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
