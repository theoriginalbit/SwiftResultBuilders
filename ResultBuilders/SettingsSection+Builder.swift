//
//  SettingsSection+Builder.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 3/8/2023.
//

import Foundation

extension SettingsSection {
    private typealias Section = SettingsSection
    typealias Item = SettingsSectionItem

    @SettingsSectionBuilder
    static func settingsSections(for user: User, featureFlags: FeatureFlagManager = .shared) -> [Self] {
        if featureFlags.isEnabled(.account), featureFlags.anyEnabled(.email, .phone) {
            Section(header: Copy.Settings.Header.yourDetails) {
                Item.dateOfBirth(user.dateOfBirthFormatted)
                if featureFlags.isEnabled(.email) {
                    Item.email(user.email)
                }
                if featureFlags.isEnabled(.phone) {
                    Item.phoneNumber(user.mobileNumberFormatted)
                }
            }
        }

        Section(header: Copy.Settings.Header.communicationPreferences) {
            Item.communicationPreference(.push)
            if featureFlags.isEnabled(.email) {
                Item.communicationPreference(.email)
            }
            if featureFlags.isEnabled(.phone) {
                Item.communicationPreference(.sms)
            }
        }

        Section(header: Copy.Settings.Header.helpAndSupport) {
            if featureFlags.isEnabled(.tutorial) {
                Item.tutorial
            }
            Item.faq
            Item.contactUs
        }

        Section(header: Copy.Settings.Header.legal) {
            Item.termsConditions
            Item.privacy
        }

        Item.signOut

        Section(footer: Copy.Settings.Footer.deleteWarning) {
            Item.deleteAccount
        }
    }
}
