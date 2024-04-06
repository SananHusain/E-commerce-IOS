import Foundation

struct RegexHelper {
    static func isValidEmail(_ email: String) -> Bool {
        // Your email regex pattern
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    static func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        // Your phone number regex pattern

        let phoneRegex = "^[0-9]{10}$"

        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phoneNumber)
    }

    static func isValidPassword(_ password: String) -> Bool {
        // Your password regex pattern
        // This example requires at least 8 characters with at least one letter and one digit
//        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordRegex = "^.{8,}$"

        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }

    // Add more regex patterns and validation methods as needed
}
