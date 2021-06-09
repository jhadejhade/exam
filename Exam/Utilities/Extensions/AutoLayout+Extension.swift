//
//  AutoLayout+Extension.swift
//  Exam
//
//  Created by Jade Lapuz on 6/9/21.
//

import UIKit

public extension UIView {

    func addConstraintsToFillSuperview(ignoreMargins: Bool = true) {
        guard let superview = superview else {
            return
        }

        translatesAutoresizingMaskIntoConstraints = false
        let visualFormat = ignoreMargins ? "|-(0)-[subview]-(0)-|" : "|-[subview]-|"
        let horizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: visualFormat, options: [], metrics: nil, views: ["subview": self])
        let verticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:" + visualFormat, options: [], metrics: nil, views: ["subview": self])
        superview.addConstraints(horizontalConstraint + verticalConstraint)
    }

    func anchorSizeAndPosition(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    enum AxisAnchor {
        case topAnchor(yAxisAnchor: NSLayoutYAxisAnchor)
        case leadingAnchor(xAxisAnchor: NSLayoutXAxisAnchor)
        case trailingAnchor(xAxisAnchor: NSLayoutXAxisAnchor)
        case bottomAnchor(yAxisAnchor: NSLayoutYAxisAnchor)
    }

    func addConstraintsToFillSuperviewSafeArea(overrideAnchors: [AxisAnchor] = []) {
        guard let superview = superview else {
            return
        }

        translatesAutoresizingMaskIntoConstraints = false
        var defaultAnchors = (topAnchor: superview.safeTopAnchor, leadingAnchor: superview.safeLeadingAnchor, trailingAnchor: superview.safeTrailingAnchor, bottomAnchor: superview.safeBottomAnchor)
        overrideAnchors.forEach {
            switch $0 {
            case .topAnchor(let yAxisAnchor):
                defaultAnchors.topAnchor = yAxisAnchor
            case .leadingAnchor(let xAxisAnchor):
                defaultAnchors.leadingAnchor = xAxisAnchor
            case .trailingAnchor(let xAxisAnchor):
                defaultAnchors.trailingAnchor = xAxisAnchor
            case .bottomAnchor(let yAxisAnchor):
                defaultAnchors.bottomAnchor = yAxisAnchor
            }
        }

        NSLayoutConstraint.activate([topAnchor.constraint(equalTo: defaultAnchors.topAnchor),
                                     leadingAnchor.constraint(equalTo: defaultAnchors.leadingAnchor),
                                     trailingAnchor.constraint(equalTo: defaultAnchors.trailingAnchor),
                                     bottomAnchor.constraint(equalTo: defaultAnchors.bottomAnchor)])
    }

    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        return self.safeAreaLayoutGuide.leadingAnchor
    }

    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        return self.safeAreaLayoutGuide.trailingAnchor
    }

    var safeTopAnchor: NSLayoutYAxisAnchor {
        return self.safeAreaLayoutGuide.topAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        return self.safeAreaLayoutGuide.bottomAnchor
    }
}
