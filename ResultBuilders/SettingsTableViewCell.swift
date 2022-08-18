import UIKit

class SettingsTableViewCell: UITableViewCell {
    private let detail: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .label
        return label
    }()

    private let value: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .secondaryLabel
        return label
    }()

    private lazy var detailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [detail, value])
        stackView.axis = .horizontal
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
        detail.text = item.text

        switch item {
        case .tutorial:
            break
        case .signOut:
            detail.textColor = .systemRed
        case let .dateOfBirth(dob):
            value.text = dob
        case let .email(email):
            value.text = email
        case let .phoneNumber(number):
            value.text = number
        case .deleteAccount:
            selectionStyle = .none
        default:
            accessoryType = .disclosureIndicator
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        accessoryView = nil
        accessoryType = .none

        detail.text = nil
        value.text = nil
        detail.textColor = .secondaryLabel
        value.textColor = .label
    }
}
