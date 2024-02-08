//
//  ContentView.swift
//  SUToastView
//
//  Created by Gab on 2024/02/01.
//

import SwiftUI
import ComposableArchitecture

public struct ContentView: View {
    @ObservedObject var toastObject: ToastObservableObject = .init()
    
    public let textList = ["가나다라", "마바사", "abcd", "efg", "5시 퇴근", "6시 퇴근", "진짜로 긴 텍스트가 나오면 어떻게 배치될지 넘 궁금한데 한 번 해보자"]
    
    @EnvironmentObject var toastStore: ViewStoreOf<ToastReducer>
    
    public var body: some View {
        ZStack {
            VStack {
                Button("눌러봐") {
                    toastObject.showToast.send(.show(ToastModel(text: textList.randomElement() ?? "", time: 3, position: .top)))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toast()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environmentObject(toastObject)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
