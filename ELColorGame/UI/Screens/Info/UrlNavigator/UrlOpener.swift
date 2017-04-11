//
// Created by Mateusz Szklarek on 14/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

protocol UrlOpening {
    func openURL(url: URL) -> Bool
    func canOpenURL(url: URL?) -> Bool
}

class UrlOpener: UrlOpening {

    func openURL(url: URL) -> Bool {
        guard UIApplication.shared.canOpenURL(url) else { return false }
        return UIApplication.shared.openURL(url)
    }

    func canOpenURL(url: URL?) -> Bool {
        guard let url = url else { return false }
        return UIApplication.shared.canOpenURL(url)
    }

}
