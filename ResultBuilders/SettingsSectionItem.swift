//
//  SettingsSectionItem.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 27/5/2023.
//

import UIKit

enum SettingsSectionItem: Hashable, Equatable {
    case tutorial
    case contactUs
    case faq
    case dateOfBirth(String)
    case email(String)
    case phoneNumber(String)
    case termsConditions
    case privacy
    case communicationPreference(CommunicationPreference)
    case signOut
    case deleteAccount

    var text: String {
        switch self {
        case .tutorial: return Copy.Settings.tutorial
        case .contactUs: return Copy.Settings.contactUs
        case .faq: return Copy.Settings.faq
        case .dateOfBirth: return Copy.Settings.dateOfBirth
        case .email: return Copy.Settings.email
        case .phoneNumber: return Copy.Settings.phoneNumber
        case .termsConditions: return Copy.Settings.termsConditions
        case .privacy: return Copy.Settings.privacy
        case let .communicationPreference(actual): return actual.text
        case .signOut: return Copy.Settings.signOut
        case .deleteAccount: return Copy.Settings.deleteAccount
        }
    }

    var value: String? {
        switch self {
        case let .dateOfBirth(value): return value
        case let .email(value): return value
        case let .phoneNumber(value): return value
        default: return nil
        }
    }

    var isDestructive: Bool {
        if case .signOut = self {
            return true
        }
        return false
    }

    var accessoryType: UITableViewCell.AccessoryType {
        switch self {
        case .phoneNumber, .email, .contactUs, .faq, .communicationPreference: return .disclosureIndicator
        default: return .none
        }
    }

    var accessoryView: UIView? {
        switch self {
        case .termsConditions, .privacy:
            var config = UIImage.SymbolConfiguration(textStyle: .body, scale: .small)
            config = config.applying(UIImage.SymbolConfiguration(weight: .medium))
            let imageView = UIImageView(image: UIImage(systemName: "arrow.up.forward.app"))
            imageView.preferredSymbolConfiguration = config
            imageView.tintColor = .secondaryLabel
            return imageView
        default: return .none
        }
    }
}

extension SettingsSectionItem {
    enum CommunicationPreference: String {
        case push
        case email
        case sms

        var text: String {
            switch self {
            case .push: return Copy.Settings.CommunicationPreference.push
            case .email: return Copy.Settings.CommunicationPreference.email
            case .sms: return Copy.Settings.CommunicationPreference.sms
            }
        }
    }
}
