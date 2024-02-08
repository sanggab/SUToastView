//
//  ToastObservableObject.swift
//  SUToastView
//
//  Created by Gab on 2024/02/05.
//

import SwiftUI
import Combine

public final class ToastObservableObject: ObservableObject {
    
    public var showToast: PassthroughSubject<ToastMethod, Never> = .init()
    
}
