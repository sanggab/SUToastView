//
//  ToastModifier.swift
//  SUToastView
//
//  Created by Gab on 2024/02/05.
//

import SwiftUI
import Combine

public struct ToastModifier: ViewModifier {
    public var model: ToastModel
    
    public func body(content: Content) -> some View {
        content
            .overlay {
                ToastView(model: model)
            }
    }
}
