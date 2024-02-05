//
//  ToastView.swift
//  SUToastView
//
//  Created by Gab on 2024/02/01.
//

import SwiftUI
import Combine

public struct ToastView: View {
    public var model: ToastModel
    
    init(model: ToastModel) {
        self.model = model
    }
    
    public var body: some View {
        if model.isPresented {
            ZStack {
                Text(model.text)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 12)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
//                    .transition(.opacity.animation(model.isPresented ? .easeIn : .easeOut))
                    .fixedSize(horizontal: false, vertical: true)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + model.time) {
                            model.isPresented = false
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .transition(.opacity.animation(model.isPresented ? .easeIn : .easeOut))
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(model: ToastModel(text: "하잉",
                                    time: 3,
                                    position: .center,
                                    isPresented: .constant(false)))
    }
}
