import Foundation

extension SettingsSection {
    private typealias Section = SettingsSection

    static func settingsSections(for user: User, featureFlags: FeatureFlagManager = .shared) -> [Self] {
        let birthDate = user.dateOfBirth?.components(separatedBy: "-").reversed().joined(separator: "/") ?? ""
        var yourDetailsItems: [SettingsSectionItem] = [.dateOfBirth(birthDate)]
        var commsPrefsItems: [SettingsSectionItem] = [.communicationPreference(.push)]
        if featureFlags.isEnabled(.email) {
            yourDetailsItems.append(.email(user.email))
            commsPrefsItems.append(.communicationPreference(.email))
        }
        if featureFlags.isEnabled(.phone) {
            let phoneNumber = user.mobileNumber?.separate(every: 3, from: 0, with: " ") ?? ""
            yourDetailsItems.append(.phoneNumber(phoneNumber))
            commsPrefsItems.append(.communicationPreference(.sms))
        }
        let yourDetailsSection = featureFlags.isEnabled(.account) && (featureFlags.isEnabled(.email) || featureFlags.isEnabled(.phone))
            ? SettingsSection.section(header: .yourDetails, items: yourDetailsItems, footer: nil)
            : nil

        var helpSectionItems = [SettingsSectionItem]()
        if featureFlags.isEnabled(.tutorial) {
            helpSectionItems.append(.tutorial)
        }
        helpSectionItems.append(.faq)
        helpSectionItems.append(.contactUs)
        let helpSection = SettingsSection.section(header: .helpAndSupport, items: helpSectionItems, footer: nil)

        return [
            yourDetailsSection,
            .section(header: .communicationPreferences, items: commsPrefsItems, footer: nil),
            helpSection,
            .section(header: nil, items: [.signOut], footer: nil),
            .section(header: nil, items: [.deleteAccount], footer: .deleteWarning),
        ].compactMap { $0 }
    }
}
