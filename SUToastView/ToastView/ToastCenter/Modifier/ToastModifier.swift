//
//  ToastModifier.swift
//  SUToastView
//
//  Created by Gab on 2024/02/05.
//

import SwiftUI
import Combine

public struct ToastModifier: ViewModifier {
    @State private var toastState: Bool = false
    @EnvironmentObject var toastObject: ToastObservableObject
    @State private var toastModel: ToastModel = ToastModel(text: "하잉")
    @State private var id: Int = 1
    
    @StateObject private var timerObserver: TimerObservableObject = .init()
    
    public func body(content: Content) -> some View {
        content
            .overlay {
                if toastState {
                    ToastView(isPresented: $toastState, model: toastModel)
                        .id(id)
                        .environmentObject(timerObserver)
                }
            }
            .onReceive(toastObject.showToast) { method in
                switch method {
                case .show(let model):
                    if !model.text.isEmpty {
                        toastModel = model
                        
                        if toastState {
                            id += 1
                        } else {
                            toastState = true
                        }
                    }
                    
                case .cancel:
                    toastState = false
                }
            }
    }
}
