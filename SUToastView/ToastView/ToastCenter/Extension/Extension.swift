//
//  Extension.swift
//  SUToastView
//
//  Created by Gab on 2024/02/05.
//

import SwiftUI
import Combine

public extension View {
    
    func toast() -> some View {
        return modifier(ToastModifier())
    }
}
