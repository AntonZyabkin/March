//
//  ViewExtensions.swift
//  EM
//
//  Created by Anton Zyabkin on 14.03.2023.
//

import SwiftUI

extension View {
    func textFieldStyle ()  -> some View {
        self.modifier(TextFieldModifier())
    }
}

struct TextFieldModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: .infinity, height: 35)
            .background(Color.textFieldBackground)
            .font(.montserrat(.regular, size: 15))
            .cornerRadius(.infinity)
            .multilineTextAlignment(.center)
    }
}


