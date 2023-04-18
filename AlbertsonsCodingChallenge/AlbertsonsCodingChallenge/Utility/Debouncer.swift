//
//  Debouncer.swift
//  AlbertsonsCodingChallenge
//
//  Created by 2423675 on 17/04/23.
//

import Foundation

/// Timer class
/// It will be used to trigger the task after given time frame
/// Automatic initiate the task with the help of timer
class Debouncer: NSObject {
    var callback: (() -> Void)
    var delay: Double
    weak var timer: Timer?

    /// Initializer
    init(delay: Double,
        callback: @escaping (() -> Void)
    ) {
        self.delay = delay
        self.callback = callback
    }

    /// Initiate the timer with provided delay
    func call() {
        timer?.invalidate()
        let nextTimer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(Debouncer.fireNow), userInfo: nil, repeats: false)
        timer = nextTimer
    }

    /// It will handle the callback
    @objc func fireNow() {
        self.callback()
    }
}
