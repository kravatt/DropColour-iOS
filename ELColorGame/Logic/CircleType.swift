//
//  Created by Dariusz Rybicki on 28/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

enum CircleType {

    case purple
    case blue
    case orange
    case red
    case turquoise
    case green

}

extension CircleType {

    static var allTypes: [CircleType] {
        var types = [CircleType]()
        for value in iterateEnum(CircleType) {
            types.append(value)
        }
        return types
    }

}

private func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafePointer(to: &i) { UnsafeRawPointer($0).load(as: T.self) }
        defer { i = i + 1 }
        return next.hashValue == i ? next : nil
    }
}
