//
//  Extensions.swift
//  BookMe
//
//  Created by Dmitriy Pak on 1/21/19.
//  Copyright © 2019 Dmitriy Pak. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return 0.0
        }
        set(cornerRadius) {
            self.layer.cornerRadius = cornerRadius
        }
    }
}

func RGBColor(_ rgbValue: UInt, alpha: Double = 1) -> UIColor { //Цвет
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(alpha)
    )
}

func attributeText(_ attributeTextArray: [NSMutableAttributedString]) -> NSMutableAttributedString {
    let attributedText = NSMutableAttributedString()
    for current in attributeTextArray {
        attributedText.append(current)
    }
    return attributedText
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

extension String {
    func toUrl() -> String {
        let url = Globals.main.imageUrl + self
        return url
    }
    
    func toAttributeText(isBold: Bool) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString()
        let fontName = isBold ? "HelveticaNeue-Bold" : "HelveticaNeue"
        let color = isBold ? RGBColor(0x222831) : RGBColor(0x393e46)
         attributedText.append(NSMutableAttributedString(string: self, attributes: [NSMutableAttributedString.Key.foregroundColor: color, NSMutableAttributedString.Key.font: UIFont(name: fontName, size: 14)!]))
        return attributedText
    }
}

extension Bool {
    func toString() -> String {
        let choose = self ? "Да" : "Нет"
        return choose
    }
}
