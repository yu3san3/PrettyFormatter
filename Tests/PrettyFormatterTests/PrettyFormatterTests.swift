import Testing
import Foundation
@testable import PrettyFormatter

struct PrettyFormatterTests {
    private struct User: Encodable {
        let userName: String
        let age: Int
        let email: String
        let creationDate: Date
    }

    private let testDictionary: [String: Any] = [
        "userName": "John Smith",
        "age": 30,
        "email": "john@smith.com"
    ]
    private let testUser = User(
        userName: "John Smith",
        age: 30,
        email: "john@smith.com",
        creationDate: Date(timeIntervalSince1970: 0)
    )

    @Test("PrettyFormatter `prettyFormatted` Method Success")
    func prettyFormatterPrettyFormattedMethodSuccess() {
        let formatted = PrettyFormatter().prettyFormatted(testDictionary)

        #expect(formatted.contains("  \"userName\" : \"John Smith\""))
        #expect(formatted.contains("  \"age\" : 30"))
        #expect(formatted.contains("  \"email\" : \"john@smith.com\""))
    }

    @Test("PrettyFormatter `prettyFormatted` Method Failure")
    func prettyFormatterPrettyFormattedMethodFailure() {
        let date = Date() // `Date` itself is not converted as a valid JSON.
        let formatted = PrettyFormatter().prettyFormatted(date)

        #expect(JSONSerialization.isValidJSONObject(date) == false)
        #expect(formatted == PrettyFormatterError.couldNotFormatToJSON.errorDescription)
    }

    @Test("Encodable `prettyFormatted` Property Success")
    func encodablePrettyFormatterPropertyReturnsValidResult() {
        let formatted = testUser.prettyFormatted

        #expect(formatted.contains("  \"userName\" : \"John Smith\""))
        #expect(formatted.contains("  \"age\" : 30"))
        #expect(formatted.contains("  \"email\" : \"john@smith.com\""))
        #expect(formatted.contains("  \"creationDate\" : \"1970-01-01 00:00:00 +0000\""))
    }
}
