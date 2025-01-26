## Overview
PrettyFormatter helps you format JSON and other objects into human-readable strings.<br>
This makes debugging and logging easier and more efficient.

## How to Use
### Formatting `Data` Objects
You can format raw JSON data into a human-readable format.<br>
This is useful when handling HTTP responses:
```swift
import PrettyFormatter

let urlRequest = URLRequest(url: "<#URL for request#>")

let (data, _) = try await URLSession().data(for: urlRequest)

print(data.prettyFormatted)

// Prints the response in a pretty-printed JSON format!
```

### Formatting `Encodable` Objects
You can also format objects conforming to the `Encodable` protocol:
```swift
import PrettyFormatter

struct User: Encodable {
    let userName: String
    let age: Int
    let email: String
}

let testUser = User(
    userName: "John Smith",
    age: 30,
    email: "john@smith.com"
)

print(testUser.prettyFormatted)

// The result is:
// {
//   "userName" : "John Smith",
//   "age" : 30,
//   "email" : "john@smith.com"
// }
```

### Formatting Other Objects
Additionally, You can format any other valid object like this:
```swift
import PrettyFormatter

private let testDictionary: [String: Any] = [
    "userName": "John Smith",
    "age": 30,
    "email": "john@smith.com"
]

let result = PrettyFormatter().prettyFormatted(testDictionary)

print(result)

// The result is:
// {
//   "userName" : "John Smith",
//   "age" : 30,
//   "email" : "john@smith.com"
// }
```
