//
//  ScrollViewBuilder.swift
//  ResultBuilders
//
//  Created by Joshua Asbury on 29/5/2023.
//

import UIKit
import NSLayoutConstraintBuilderDSL

struct ContentInsets {
    let insets: UIEdgeInsets

    init(_ insets: UIEdgeInsets) {
        self.insets = insets
    }
}

@resultBuilder
enum ScrollViewBuilder {
    @available(*, unavailable, message: "first statement of ScrollViewBuilder must be ContentInsets")
    static func buildBlock(_ subview: UIView) -> (ContentInsets, UIView) {
        (ContentInsets(.zero), subview)
    }

    static func buildBlock(_ insets: ContentInsets, _ subview: UIView) -> (ContentInsets, UIView) {
        (insets, subview)
    }

    static func buildFinalResult(_ components: (ContentInsets, UIView)) -> UIScrollView {
        let scrollView = UIScrollView()
        let (insetDefinition, contentView) = components
        scrollView.contentInset = insetDefinition.insets
        scrollView.addSubview(contentView.forAutoLayout())

        NSLayoutConstraint.activate {
            Pin(edges: .all, of: contentView, to: scrollView.contentLayoutGuide)
            Pin(dimensions: .width, of: scrollView.contentLayoutGuide, to: scrollView.frameLayoutGuide)
        }

        return scrollView
    }
}

extension UIScrollView {
    static func vertical(@ScrollViewBuilder _ builder: () -> UIScrollView) -> UIScrollView {
        builder()
    }
}
