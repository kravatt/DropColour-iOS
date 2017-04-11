//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

extension CircleView {

    convenience init(circle: Circle) {
        let colors = CircleView.colorsForCircle(circle: circle)
        self.init(topColor: colors.top, bottomColor: colors.bottom)
    }

    private class func colorsForCircle(circle: Circle) -> (top: UIColor, bottom: UIColor) {
        switch circle.type {
        case .purple:
            return (UIColor(color: .PurpleC86DD7), UIColor(color: .Purple906DD7))
        case .blue:
            return (UIColor(color: .Blue00C7FF), UIColor(color: .Blue0076FF))
        case .orange:
            return (UIColor(color: .OrangeFAD961), UIColor(color: .OrangeF7821C))
        case .red:
            return (UIColor(color: .RedE92578), UIColor(color: .RedE9253D))
        case .turquoise:
            return (UIColor(color: .Turquoise3CFFB7), UIColor(color: .Turquoise50CFE3))
        case .green:
            return (UIColor(color: .GreenA5E01A), UIColor(color: .Green32E01A))
        }
    }

}
