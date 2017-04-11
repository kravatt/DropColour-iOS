//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

class Timer: NSObject {

    typealias Action = () -> ()
    let action: Action

    var interval: TimeInterval? {
        didSet {
            if let interval = interval {
                updateTimeInterval(timeInterval: interval)
            }
        }
    }

    init(interval: TimeInterval, action: Action) {
        self.action = action
        self.interval = interval
        super.init()
        timer = Foundation.Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(Timer.timerTick), userInfo: nil, repeats: true)
    }

    deinit {
        invalidate()
    }

    func invalidate() {
        timer?.invalidate()
        timer = nil
    }

    private var timer: Foundation.Timer?

    func timerTick() {
        action()
    }

    private func updateTimeInterval(timeInterval: TimeInterval) {
        guard let timer = timer else { return }
        timer.fireDate = timer.fireDate.addingTimeInterval(timeInterval)
    }

}
