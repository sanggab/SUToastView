//
//  Extension.swift
//  SUToastView
//
//  Created by Gab on 2024/02/05.
//

import SwiftUI

public extension View {
    
    func toast(isPresented: Binding<Bool> ,text: String, time: TimeInterval = 3, position: ToastPosition = .center) -> some View {
        return modifier(ToastModifier(model: ToastModel(text: text,
                                                 time: time,
                                                 position: position,
                                                 isPresented: isPresented)))
    }
}
