//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

@testable
import ELColorGame

class FakeAuthorProvider: AuthorProviding {

    var authors = [
            Author(
                name: "John",
                surname: "Apple",
                type: .Developer,
                avatarUrl: URL(string: "https://google.pl/avatar"),
                professionUrl: URL(string: "https://github.com/johnapple"),
                twitterUrl: URL(string: "https://twitter.com/johnapple")
            )
    ]

}

extension Author {

    func copyWithType(type: AuthorType) -> Author {
        return Author(
                name: self.name,
                surname: self.surname,
                type: type,
                avatarUrl: self.avatarUrl,
                professionUrl: self.professionUrl,
                twitterUrl: self.twitterUrl
        )
    }

    func copyWithoutUrls() -> Author {
        return Author(
                name: self.name,
                surname: self.surname,
                type: type,
                avatarUrl: nil,
                professionUrl: nil,
                twitterUrl: nil
        )
    }

    func copyWithProffessionUrl(url: NSURL?) -> Author {
        return Author(
                name: self.name,
                surname: self.surname,
                type: self.type,
                avatarUrl: self.avatarUrl,
                professionUrl: url,
                twitterUrl: self.twitterUrl
        )
    }

}
