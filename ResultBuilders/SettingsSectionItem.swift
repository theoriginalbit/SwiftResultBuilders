import Foundation

enum SettingsSectionItem: Equatable {
    case tutorial
    case contactUs, faq
    case dateOfBirth(String), email(String), phoneNumber(String)
    case termsConditions, privacy
    case communicationPreference(CommunicationPreference)
    case signOut, deleteAccount

    var text: String {
        switch self {
        case .tutorial: return "Tutorial"
        case .contactUs: return "Contact us"
        case .faq: return "FAQ"
        case .dateOfBirth: return "Date of Birth"
        case .email: return "Email"
        case .phoneNumber: return "Phone number"
        case .termsConditions: return "Terms & Conditions"
        case .privacy: return "Privacy Policy"
        case let .communicationPreference(actual): return actual.rawValue
        case .signOut: return "Sign out"
        case .deleteAccount: return "Delete account"
        }
    }
}

extension SettingsSectionItem {
    enum CommunicationPreference: String {
        case push = "Push Notifications", email = "Email", sms = "SMS"
    }
}
