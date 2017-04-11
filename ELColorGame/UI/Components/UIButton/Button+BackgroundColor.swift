//
//  Created by Mateusz Szklarek on 19/04/16.
//  Copyright © 2016 EL Passion. All rights reserved.
//

import UIKit

extension Button {

    func setBackgroundColor(backgroundColor: UIColor, forUIControlState state: UIControlState) {
        self.setBackgroundImage(imageFromColor(color: backgroundColor), for: state)
    }

    private func imageFromColor(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
