//
//  SettingsSection.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 27/5/2023.
//

import Foundation

struct SettingsSection: Hashable {
    let header: String?
    let items: [SettingsSectionItem]
    let footer: String?
}
