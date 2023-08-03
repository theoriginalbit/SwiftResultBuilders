//
//  UILabel+Extended.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 29/5/2023.
//

import UIKit

extension UILabel {
    convenience init(_ textStyle: UIFont.TextStyle, _ alignment: NSTextAlignment = .left, _ textValue: String) {
        self.init(frame: .zero)
        font = .preferredFont(forTextStyle: textStyle)
        textAlignment = alignment
        text = textValue
    }
}
