//
//  Timer.swift
//  SUToastView
//
//  Created by Gab on 2024/02/01.
//

import SwiftUI

public class ToastTimer {
    public var timer: Timer.TimerPublisher
    
    public init(time: TimeInterval) {
        self.timer = Timer.publish(every: time, on: .main, in: .default)
    }
}
