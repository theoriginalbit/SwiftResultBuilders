import Foundation

struct UserService {
    static var shared = Self()

    func get() -> User {
        User(email: "fred@mymail.com", mobileNumber: "+61441123456", dateOfBirth: "1986-07-16")
    }
}
