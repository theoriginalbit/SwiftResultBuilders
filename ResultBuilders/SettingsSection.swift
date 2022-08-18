import Foundation
import RxDataSources

struct SettingsSection {
    var header: String?
    var items: [SettingsSectionItem]
    var footer: String?
}

extension SettingsSection {
    init(header: Copy.Header? = nil, footer: Copy.Footer? = nil, @SettingsSectionItemBuilder items: () -> [SettingsSectionItem]) {
        self.header = header.map(String.string(for:))
        self.footer = footer.map(String.string(for:))
        self.items = items()
    }
}

// MARK: - RxDataSources Requirement

extension SettingsSection: SectionModelType {
    typealias Item = SettingsSectionItem

    init(original: SettingsSection, items: [Item]) {
        self.init(header: original.header, items: items, footer: original.footer)
    }
}
