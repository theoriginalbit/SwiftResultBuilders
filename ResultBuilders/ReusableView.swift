//
//  ReusableView.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 27/5/2023.
//

import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String { String(describing: self) }
}

extension UITableViewCell: ReusableView {}

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    /// Get cell with the default reuse cell identifier
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell: \(T.self) with identifier: \(T.defaultReuseIdentifier)")
        }

        return cell
    }
}
