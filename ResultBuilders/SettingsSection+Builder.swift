//
//  SettingsSection+Builder.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 3/8/2023.
//

import Foundation

extension SettingsSection {
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
            ? SettingsSection(header: Copy.Settings.Header.yourDetails, items: yourDetailsItems, footer: nil)
            : nil

        var helpSectionItems = [SettingsSectionItem]()
        if featureFlags.isEnabled(.tutorial) {
            helpSectionItems.append(.tutorial)
        }
        helpSectionItems.append(.faq)
        helpSectionItems.append(.contactUs)
        let helpSection = SettingsSection(header: Copy.Settings.Header.helpAndSupport, items: helpSectionItems, footer: nil)

        return [
            yourDetailsSection,
            SettingsSection(header: Copy.Settings.Header.communicationPreferences, items: commsPrefsItems, footer: nil),
            helpSection,
            SettingsSection(header: Copy.Settings.Header.legal, items: [.termsConditions, .privacy], footer: nil),
            SettingsSection(header: nil, items: [.signOut], footer: nil),
            SettingsSection(header: nil, items: [.deleteAccount], footer: Copy.Settings.Footer.deleteWarning),
        ].compactMap { $0 }
    }
}
