//
//  MainScreenViewModel.swift
//  washing_machine
//
//  Created by baiaman apsamatov on 5/1/23.
//

import Foundation

private enum WashingLevelTime: Int {
    case standart = 25
    case gentle = 30
    case fast = 20
}

protocol UIControlDelegate: AnyObject {
    func timerUpdate(currentTime: Double)
    func resetTimer()
    func startWashingMachine()
    func stopWashingMachine()
}

class MainScreenViewModel {
    weak var delegate: UIControlDelegate?
    private var timer: Timer?
    private var washingLevelTime = WashingLevelTime.standart
    private var timerCountValue: Double = 0
    
    func mainTitle() -> String {
        return "Smart Washing\nMachine"
    }
    
    func startTimer() {
        self.stopTimer()
        guard self.timer == nil else { return }
        self.timer = Timer.scheduledTimer(timeInterval: Double(washingLevelTime.rawValue), target: self, selector: #selector(self.changeTimerSelector), userInfo: nil, repeats: false)
        self.delegate?.startWashingMachine()
    }
    
    func stopTimer() {
        guard self.timer != nil else { return }
        self.timer?.invalidate()
        self.timer = nil
        self.delegate?.resetTimer()
        self.delegate?.stopWashingMachine()
    }
    
    func selectWashingTime(tagItem: Int) {
        switch tagItem {
        case 1:
            self.washingLevelTime = .standart
        case 2:
            self.washingLevelTime = .gentle
        case 3:
            self.washingLevelTime = .fast
        default:
            print("default value")
        }
    }
    
    @objc func changeTimerSelector() {
        if (self.timerCountValue == Double(self.washingLevelTime.rawValue)) {
            self.stopTimer()
        } else {
            self.timerCountValue += 1
            self.delegate?.timerUpdate(currentTime: self.timerCountValue)
        }
    }
}
