//
//  Model.swift
//  SUToastView
//
//  Created by Gab on 2024/02/05.
//

import SwiftUI

@frozen public enum ToastPosition {
    case top
    case center
    case bottom
    case custom(CGFloat)
}


@frozen public struct ToastModel {
    public var text: String
    public var time: TimeInterval
    public var position: ToastPosition
    @Binding public var isPresented: Bool
    
    public init(text: String,
                time: TimeInterval,
                position: ToastPosition,
                isPresented: Binding<Bool>) {
        self.text = text
        self.time = time
        self.position = position
        self._isPresented = isPresented
    }
}
