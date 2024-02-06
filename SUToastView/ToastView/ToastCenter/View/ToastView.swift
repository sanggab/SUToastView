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
    
    private let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    private var currentTime: TimeInterval
    
    public init(isPresented: Binding<Bool>,
         model: ToastModel) {
        self._isPresented = isPresented
        self.model = model
        
        self.timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
        self.currentTime = Date().timeIntervalSince1970
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: model.position)
        .transition(.opacity.animation(isPresented ? .easeIn : .easeOut))
        .onReceive(timer) { output in
            if output.timeIntervalSince1970 - currentTime >= model.time {
                timer.upstream.connect().cancel()
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
