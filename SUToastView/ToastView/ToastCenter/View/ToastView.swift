//
//  ToastView.swift
//  SUToastView
//
//  Created by Gab on 2024/02/01.
//

import SwiftUI
import Combine

public struct ToastView: View {
    @Binding public var isPresented: Bool
    public var model: ToastModel
    
    @EnvironmentObject private var timerObserver: TimerObservableObject
    
    public init(isPresented: Binding<Bool>,
         model: ToastModel) {
        self._isPresented = isPresented
        self.model = model
    }
    
    public var body: some View {
        ZStack {
            Text(model.text)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 14)
                .padding(.horizontal, 12)
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(8)
                .fixedSize(horizontal: false, vertical: true)
                .shadow(color: Color.black.opacity(0.24), radius: 6, x: 0, y: 2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: model.position)
        .transition(.opacity.animation(isPresented ? .easeIn : .easeOut))
        .onAppear {
            timerObserver.playTimer()
        }
        .onReceive(timerObserver.timer) { output in
            if output.timeIntervalSince1970 - timerObserver.currentTime >= model.time {
                timerObserver.stopTimer()
                isPresented = false
            }
        }
    }
}

//struct ToastView_Previews: PreviewProvider {
//    static var previews: some View {
//        ToastView()
//    }
//}
