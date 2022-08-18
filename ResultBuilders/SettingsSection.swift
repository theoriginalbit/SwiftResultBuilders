import Foundation
import RxDataSources

enum SettingsSection {
    case section(header: Copy.Header?, items: [SettingsSectionItem], footer: Copy.Footer?)
}

// MARK: - Accessors

extension SettingsSection {
    var header: String? {
        switch self {
        case let .section(header, _, _): return header.map(String.string(for:))
        }
    }

    var items: [SettingsSectionItem] {
        switch self {
        case let .section(_, items, _): return items
        }
    }

    var footer: String? {
        switch self {
        case let .section(_, _, footer): return footer.map(String.string(for:))
        }
    }
}

// MARK: - RxDataSources Requirement

extension SettingsSection: SectionModelType {
    typealias Item = SettingsSectionItem

    init(original: SettingsSection, items: [Item]) {
        switch original {
        case let .section(header, _, footer):
            self = .section(header: header, items: items, footer: footer)
        }
    }
}
