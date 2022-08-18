import RxSwift

struct SettingsViewModel {
    let sections: Observable<[SettingsSection]>

    init() {
        let user = UserService.shared.get()
        sections = .just(SettingsSection.settingsSections(for: user))
    }
}
