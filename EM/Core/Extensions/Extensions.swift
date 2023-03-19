//
//  Extensions.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation
import SwiftUI



//MARK: - FONTS
enum EMFont {
    enum Montserrat {
        case bold, regular, medium, light
    }
}

extension EMFont.Montserrat {
    var fontConvertible: FontConvertible {
        switch self {
        case .bold:
            return FontFamily.Montserrat.semiBold
        case .regular:
            return FontFamily.Montserrat.regular
        case .medium:
            return FontFamily.Montserrat.medium
        case .light:
            return FontFamily.Montserrat.light
        }
    }
}

extension SwiftUI.Font {
    static func montserrat(_ fontWeight: EMFont.Montserrat, size: CGFloat) -> SwiftUI.Font {
        fontWeight.fontConvertible.swiftUIFont(size: size)
    }
}

//MARK: - COLORS

extension Color {
    init(hex: String) {
        var lockalHex = hex
        if (lockalHex.hasPrefix("#")) {
            lockalHex.remove(at: lockalHex.startIndex)
        }
        let r, g, b, o: CGFloat
        var hexNumber: UInt64 = 0
        Scanner(string: lockalHex).scanHexInt64(&hexNumber)
        if lockalHex.count == 6 {
            r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
            b = CGFloat(hexNumber & 0x0000ff) / 255
            self.init(red: r, green: g, blue: b, opacity: 1)
            return
        } else if lockalHex.count == 8 {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            o = CGFloat(hexNumber & 0x000000ff) / 255
            self.init(red: r, green: g, blue: b, opacity: o)
            return
        }
        self.init(red: 0, green: 0, blue: 0, opacity: 0)
    }
    
    //MARK: - Backgrounds
    static let pageBackground = Color(hex: "FAF9FF")
    static let textFieldBackground = Color(hex: "E8E8E8")
    static let buttonBackground = Color(hex: "4E55D7")
    static let iconBackground = Color(hex: "EEEFF4")
    static let categoryBackground = Color(hex: "C4C4C4D9")
    static let saleBackground = Color(hex: "F93A3A")
    static let searchFieldBackground = Color(hex: "F5F6F7")

    
    //MARK: - Foregrounds
    static let mainBlack = Color(hex: "040402")
    static let mainGray = Color(hex: "7B7B7B")
    static let darkGray = Color(hex: "808080")
    static let categoryForeground = Color(hex: "161826")
    static let iconActiveForeground = Color(hex: "737297")
    static let iconInactiveForeground = Color(hex: "909090")
    static let flashSaleIcon = Color(hex: "545589")
    static let test = Color(hex: "161826")
    static let buttonForegrounds = Color(hex: "254FE6")
}

