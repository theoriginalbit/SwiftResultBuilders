import RxDataSources
import RxSwift
import UIKit

class SettingsViewController: UIViewController {
    private var tableViewDataSource: RxTableViewSectionedReloadDataSource<SettingsSection>?
    private let disposeBag = DisposeBag()

    private var tableView: UITableView {
        view as! UITableView
    }

    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        navigationItem.title = "Settings"
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UITableView(frame: .zero, style: .insetGrouped)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let viewModel = SettingsViewModel()

        let settingsDataSource = dataSource()

        viewModel.sections
            .bind(to: tableView.rx.items(dataSource: settingsDataSource))
            .disposed(by: disposeBag)

        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        tableView.register(SettingsTableViewCell.self)
        tableView.register(SettingsSectionHeaderView.self)

        tableViewDataSource = settingsDataSource
    }
}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let title = tableViewDataSource?.sectionModels[section].header else {
            return nil
        }

        let header: SettingsSectionHeaderView = tableView.dequeueReusableHeaderFooterView()
        header.title.text = title
        return header
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let title = tableViewDataSource?.sectionModels[section].footer else {
            return nil
        }

        let header: SettingsSectionHeaderView = tableView.dequeueReusableHeaderFooterView()
        header.title.text = title
        return header
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - RxDataSource

extension SettingsViewController {
    func dataSource() -> RxTableViewSectionedReloadDataSource<SettingsSection> {
        RxTableViewSectionedReloadDataSource<SettingsSection>(configureCell: { dataSource, tableView, indexPath, _ in
            Self.cell(for: dataSource[indexPath], at: indexPath, on: tableView)
        })
    }

    static func cell(for item: SettingsSectionItem, at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: SettingsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setItem(item)
        return cell
    }
}
