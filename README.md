# Validation

```swift
let password = "password"
let failedRules = password.validatePassword(with: [
    MinCountRule(min: 5),
    MaxCountRule(max: 20),
    SpecialCharacterRule(),
    LowercaseRule(),
    UppercaseRule(),
    NumericRule()
])

failedRules.count // 3
failedRules // [SpecialCharacterRule, UppercaseRule, NumericRule]
```
