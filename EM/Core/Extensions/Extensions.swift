//
//  Extensions.swift
//  EM
//
//  Created by Anton Zyabkin on 13.03.2023.
//

import Foundation
import SwiftUI

enum EMFont {
    enum Montserrat {
        case bold, regular, medium, light
    }
}

extension EMFont.Montserrat {
    var fontConvertible: FontConvertible {
        switch self {
        case .bold:
            return FontFamily.Montserrat.bold
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
        //        SwiftUI.Font.custom(fontWeight, size: size)
//        return fontWeight.fontConvertible.swiftUIFont(size: size)
    }
}
