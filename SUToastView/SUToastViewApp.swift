//
//  SUToastViewApp.swift
//  SUToastView
//
//  Created by Gab on 2024/02/01.
//

import SwiftUI
import ComposableArchitecture

@main
struct SUToastViewApp: App {
    
    var store = Store(initialState: ToastReducer.State(), reducer: { ToastReducer() })
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewStoreOf<ToastReducer>(store, observe: { $0 }))
        }
    }
}
