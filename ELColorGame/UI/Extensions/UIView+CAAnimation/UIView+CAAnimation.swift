//
//  Created by Mateusz Szklarek on 27/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

extension UIView {

    func addIncreaseSizeAnimation() {
        configureKeyFrameAnimationWithValues(values: [1.2], keyTimes: [1])
    }

    func addBounceAnimation() {
        configureKeyFrameAnimationWithValues(values: [0.25, 0.4, 1.3, 1.0], keyTimes: [0, 0.3, 0.75, 1], duration: 0.3)
    }

    func addAppearAnimation() {
        configureKeyFrameAnimationWithValues(values: [0.0, 0.2, 0.5, 1.4, 1.0], keyTimes: [0, 0.3, 0.5, 0.75, 1], duration: 0.4)
    }

    private func configureKeyFrameAnimationWithValues(values: [AnyObject], keyTimes: [NSNumber], duration: CFTimeInterval?=nil) {
        let keyFrame: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        keyFrame.values = values
        keyFrame.keyTimes = keyTimes
        if let duration = duration {
            keyFrame.duration = duration
        }
        keyFrame.isRemovedOnCompletion = false
        keyFrame.fillMode = kCAFillModeForwards
        keyFrame.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)]
        self.layer.add(keyFrame, forKey: "transform.scale")
    }

}
