//
//  SettingsViewModel.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 27/5/2023.
//

import Combine

final class SettingsViewModel {
    @Published private(set) var sections: [SettingsSection]

    init() {
        let user = UserService.shared.get()
        sections = SettingsSection.settingsSections(for: user)
    }
}
