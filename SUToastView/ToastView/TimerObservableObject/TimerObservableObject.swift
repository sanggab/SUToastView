//
//  TimerObservableObject.swift
//  SUToastView
//
//  Created by Gab on 2024/02/05.
//

import SwiftUI
import Combine

public class TimerObservableObject: ObservableObject {
    
    private var bag = Set<AnyCancellable>()
    
    public var timer = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()
    
    public var currentTime: TimeInterval = 0
    
    public init() {
        
    }
    
    public func playTimer() {
        self.currentTime = Date().timeIntervalSince1970
    }
    
    public func stopTimer() {
        self.bag = []
    }
}
