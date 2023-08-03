//
//  Copy.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 27/5/2023.
//

import Foundation

enum Copy {
    enum Settings {
        static var title: String {
            NSLocalizedString("title", tableName: "Settings", value: "Settings", comment: "The title used in the navigation and tab bars")
        }

        static var tutorial: String {
            NSLocalizedString("tutorial", tableName: "Settings", value: "Tutorial", comment: "An action that when tapped presents the app's tutorial")
        }

        static var contactUs: String {
            NSLocalizedString("contactUs", tableName: "Settings", value: "Contact us", comment: "An action that when tapped will provide our contact details")
        }

        static var faq: String {
            NSLocalizedString("faq", tableName: "Settings", value: "FAQ", comment: "An action that when tapped will present the frequently asked questions")
        }

        static var dateOfBirth: String {
            NSLocalizedString("dateOfBirth", tableName: "Settings", value: "Date of Birth", comment: "A label for the value displaying the user's date of birth")
        }

        static var email: String {
            NSLocalizedString("email", tableName: "Settings", value: "Email", comment: "A label for the value displaying the user's email address")
        }

        static var phoneNumber: String {
            NSLocalizedString("phoneNumber", tableName: "Settings", value: "Phone number", comment: "A label for the value displaying the user's phone number")
        }

        static var termsConditions: String {
            NSLocalizedString("termsConditions", tableName: "Settings", value: "Terms & Conditions", comment: "A label for the value displaying the user's")
        }

        static var privacy: String {
            NSLocalizedString("privacy", tableName: "Settings", value: "Privacy Policy", comment: "")
        }

        static var signOut: String {
            NSLocalizedString("signOut", tableName: "Settings", value: "Sign out", comment: "")
        }

        static var deleteAccount: String {
            NSLocalizedString("deleteAccount", tableName: "Settings", value: "Delete account", comment: "")
        }

        enum CommunicationPreference {
            static var push: String {
                NSLocalizedString("communicationPreference.push", tableName: "Settings", value: "Push Notifications", comment: "")
            }

            static var email: String {
                NSLocalizedString("communicationPreference.email", tableName: "Settings", value: "Email", comment: "")
            }

            static var sms: String {
                NSLocalizedString("communicationPreference.sms", tableName: "Settings", value: "SMS", comment: "")
            }
        }

        enum Header {
            static var communicationPreferences: String {
                NSLocalizedString("header.communicationPreferences", tableName: "Settings", value: "Communication Preferences", comment: "")
            }

            static var helpAndSupport: String {
                NSLocalizedString("header.helpAndSupport", tableName: "Settings", value: "Help & Support", comment: "")
            }
            
            static var legal: String {
                NSLocalizedString("header.legal", tableName: "Settings", value: "Legal", comment: "")
            }

            static var yourDetails: String {
                NSLocalizedString("header.yourDetails", tableName: "Settings", value: "Your Details", comment: "")
            }
        }

        enum Footer {
            static var deleteWarning: String {
                NSLocalizedString("footer.deleteWarning", tableName: "Settings", value: "Deleting your account is permanent, and cannot be recovered.", comment: "")
            }
        }
    }

    enum Home {
        static var title: String {
            NSLocalizedString("title", tableName: "Home", value: "Home", comment: "The title used in the navigation and tab bars")
        }
    }
}
