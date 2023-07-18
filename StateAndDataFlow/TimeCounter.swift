//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Aleksandr Mamlygo on 17.07.23.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var buttonTitle = "Start"
    var timer: Timer?
    
    func startTimer() {
        if counter == 3 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        buttonTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send(self)
    }
    
    private func buttonTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait"
        }
        
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
