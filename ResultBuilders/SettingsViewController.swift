//
//  SettingsViewController.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 27/5/2023.
//

import Combine
import UIKit

final class SettingsViewController: UIViewController, UITableViewDelegate {
    final class DataSource: UITableViewDiffableDataSource<SettingsSection, SettingsSectionItem> {
        typealias Snapshot = NSDiffableDataSourceSnapshot<SettingsSection, SettingsSectionItem>

        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            sectionIdentifier(for: section)?.header
        }

        override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            sectionIdentifier(for: section)?.footer
        }
    }

    private var dataSource: DataSource!
    private let viewModel = SettingsViewModel()
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private var cancellable: [AnyCancellable] = []

    override init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        navigationItem.title = Copy.Settings.title
        tabBarItem = UITabBarItem(title: navigationItem.title, image: UIImage(systemName: "gearshape.2"), selectedImage: UIImage(systemName: "gearshape.2.fill"))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view = tableView
        
        // TODO: Add some custom tableview header which makes use of uistackview builder.
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.register(SettingsTableViewCell.self)

        dataSource = DataSource(tableView: tableView) { tableView, indexPath, item in
            let cell: SettingsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setItem(item)
            return cell
        }

        viewModel.$sections.sink { [weak dataSource] sections in
            var snapshot = DataSource.Snapshot()
            snapshot.appendSections(sections)
            for section in sections {
                snapshot.appendItems(section.items, toSection: section)
            }
            dataSource?.apply(snapshot, animatingDifferences: true)
        }.store(in: &cancellable)
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
