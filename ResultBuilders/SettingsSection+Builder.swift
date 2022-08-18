import Foundation

extension SettingsSection {
    private typealias Section = SettingsSection

    @SettingsSectionBuilder
    static func settingsSections(for user: User, featureFlags: FeatureFlagManager = .shared) -> [Self] {
        if featureFlags.isEnabled(.account), featureFlags.anyEnabled(.email, .phone) {
            Section(header: .yourDetails) {
                Item.dateOfBirth(user.dateOfBirthFormatted)
                if featureFlags.isEnabled(.email) {
                    Item.email(user.email)
                }
                if featureFlags.isEnabled(.phone) {
                    Item.phoneNumber(user.mobileNumberFormatted)
                }
            }
        }

        Section(header: .communicationPreferences) {
            Item.communicationPreference(.push)
            if featureFlags.isEnabled(.email) {
                Item.communicationPreference(.email)
            }
            if featureFlags.isEnabled(.phone) {
                Item.communicationPreference(.sms)
            }
        }

        Section(header: .helpAndSupport) {
            if featureFlags.isEnabled(.tutorial) {
                Item.tutorial
            }
            Item.faq
            Item.contactUs
        }

        Item.signOut

        Section(footer: .deleteWarning) {
            Item.deleteAccount
        }
    }
}
