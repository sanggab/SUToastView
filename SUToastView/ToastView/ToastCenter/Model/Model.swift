//
//  Model.swift
//  SUToastView
//
//  Created by Gab on 2024/02/05.
//

import SwiftUI

//@frozen public enum ToastPosition {
//    case top
//    case center
//    case bottom
//    case custom(CGFloat)
//}


@frozen public struct ToastModel {
    public var text: String
    public var time: TimeInterval
    public var position: Alignment
    
    public init(text: String,
                time: TimeInterval = 3,
                position: Alignment = .center) {
        self.text = text
        self.time = time
        self.position = position
    }
}
