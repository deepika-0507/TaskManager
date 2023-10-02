//
//  UIStackView+Extension.swift
//  Todo
//
//  Created by Deepika Ponnaganti on 03/09/23.
//

import UIKit

extension UIStackView {
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            NSLayoutConstraint.deactivate($0.constraints)
            $0.removeFromSuperview()
        }
    }
}
