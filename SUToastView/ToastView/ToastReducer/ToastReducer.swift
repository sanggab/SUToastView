//
//  ToastReducer.swift
//  SUToastView
//
//  Created by Gab on 2024/02/05.
//

import SwiftUI
import ComposableArchitecture


public class ToastReducer: Reducer {
    public struct State: Equatable {
        var toastMessage: String = "hi"
    }
    
    public enum Action: Equatable {
        case showToast
        case another
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .showToast:
                let text: [String] = ["아니다", "맞다"]
                state.toastMessage = text.randomElement() ?? ""
                return .none
            case .another:
                return .none
            }
        }
    }
}
