import Testing
@testable import PrettyFormatter

struct PrettyFormatterTests {
    private struct User: Encodable {
        let userName: String
        let age: Int
        let email: String
    }

    private let testDictionary: [String: Any] = [
        "userName": "John Smith",
        "age": 30,
        "email": "john@smith.com"
    ]
    private let testUser = User(
        userName: "John Smith",
        age: 30,
        email: "john@smith.com"
    )

    @Test("Test PrettyFormatter `prettyFormatted` Method")
    func prettyFormatterPrettyFormattedMethodSuccess() async throws {
        let formatted = PrettyFormatter().prettyFormatted(testDictionary)

        #expect(formatted.contains("  \"userName\" : \"John Smith\""))
        #expect(formatted.contains("  \"age\" : 30"))
        #expect(formatted.contains("  \"email\" : \"john@smith.com\""))
    }

    @Test("Test Encodable `prettyFormatted` Method")
    func encodablePrettyFormatterMethodSuccess() async throws {
        let formatted = testUser.prettyFormatted

        #expect(formatted.contains("  \"userName\" : \"John Smith\""))
        #expect(formatted.contains("  \"age\" : 30"))
        #expect(formatted.contains("  \"email\" : \"john@smith.com\""))
    }
}
