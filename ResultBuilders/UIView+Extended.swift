//
//  UIView+Extended.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 29/5/2023.
//

import UIKit

extension UIView {
    func forAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
