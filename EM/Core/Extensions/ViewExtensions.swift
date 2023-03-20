//
//  ViewExtensions.swift
//  EM
//
//  Created by Anton Zyabkin on 14.03.2023.
//

import SwiftUI

extension View {
    func textFieldModifier ()  -> some View {
        self.modifier(TextFieldModifier())
    }
    func blueButtonModifier ()  -> some View {
        self.modifier(BlueButtonModifier())
    }

}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 35)
            .frame(maxWidth: .infinity)
            .background(Color.textFieldBackground)
            .font(.montserrat(.regular, size: 12))
            .cornerRadius(.infinity)
            .multilineTextAlignment(.center)
    }
}


struct BlueButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.montserrat(.bold, size: 15))
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .foregroundColor(.white)
            .background(Color.buttonBackground)
            .cornerRadius(15)
    }
}
