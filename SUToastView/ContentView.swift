//
//  ContentView.swift
//  SUToastView
//
//  Created by Gab on 2024/02/01.
//

import SwiftUI

public struct ContentView: View {
    @State private var toastState: Bool = false
    
    public let string = ["가나다라", "마바사", "abcd", "efg", "5시 퇴근", "6시 퇴근"]
    
    public var body: some View {
        ZStack {
            Button("눌러봐") {
                toastState = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toast(isPresented: $toastState, text: string.randomElement() ?? "")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
