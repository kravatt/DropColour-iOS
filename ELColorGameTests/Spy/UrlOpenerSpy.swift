//
// Created by Mateusz Szklarek on 14/02/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

@testable
import ELColorGame

class UrlOpenerSpy: UrlOpening {

    private(set) var urlWasOpened = false

    // MARK: UrlOpening

    func openURL(url: URL) -> Bool {
        urlWasOpened = true
        return true
    }

    func canOpenURL(url: URL?) -> Bool {
        guard let _ = url else { return false }
        return true
    }

}
