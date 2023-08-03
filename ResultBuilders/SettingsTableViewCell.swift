//
//  SettingsTableViewCell.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 27/5/2023.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell {
    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .label
        return label
    }()

    private let secondaryLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .secondaryLabel
        return label
    }()

    private lazy var detailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [primaryLabel, secondaryLabel])
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(detailStackView)

        NSLayoutConstraint.activate([
            detailStackView.leadingAnchor.constraint(equalTo: contentView.readableContentGuide.leadingAnchor),
            detailStackView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1.0),
            detailStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            detailStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setItem(_ item: SettingsSectionItem) {
        primaryLabel.text = item.text
        primaryLabel.textColor = item.isDestructive ? .systemRed : .label
        secondaryLabel.text = item.value
        accessoryType = item.accessoryType
        accessoryView = item.accessoryView
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        accessoryView = nil
        accessoryType = .none

        primaryLabel.text = nil
        primaryLabel.textColor = .label
        secondaryLabel.text = nil
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        configureViewsForCurrentContentSizeCategory()
    }

    // MARK: - Helpers

    private func configureViewsForCurrentContentSizeCategory() {
        detailStackView.axis = axisForCurrentContentSizeCategory()
        primaryLabel.textAlignment = textAlignmentForCurrentContentSizeCategory(isSecondaryLabel: false)
        secondaryLabel.textAlignment = textAlignmentForCurrentContentSizeCategory(isSecondaryLabel: true)
    }

    private func axisForCurrentContentSizeCategory() -> NSLayoutConstraint.Axis {
        // If we checked with `.isAccessibilityCategory` then XXL would still look bad
        if traitCollection.preferredContentSizeCategory > .extraExtraLarge {
            return .vertical // Not enough room for the text if we stay horizontal
        } else {
            return .horizontal
        }
    }

    private func textAlignmentForCurrentContentSizeCategory(isSecondaryLabel: Bool) -> NSTextAlignment {
        // If we checked with `.isAccessibilityCategory` then XXL would still look bad
        if traitCollection.preferredContentSizeCategory > .extraExtraLarge {
            // When the text is huge and the stack axis has changed, the text should always align natural
            return .natural
        } else if isSecondaryLabel {
            return traitCollection.layoutDirection == .rightToLeft ? .left : .right
        } else {
            // Primary label is always natural aligned
            return .natural
        }
    }
}
