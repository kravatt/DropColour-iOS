//
// Created by Mateusz Szklarek on 29/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import Foundation

protocol AuthorProviding {
    var authors: [Author] { get }
}

class AuthorProvider: AuthorProviding {

    let authors = [
        Author(
            name: "Mateusz",
            surname: "Szklarek",
            type: AuthorType.Developer,
            avatarUrl: URL(string: "ms"),
            professionUrl: URL(string: "https://github.com/mateuszszklarek"),
            twitterUrl: URL(string: "https://twitter.com/SzklarekMateusz")
        ),
        Author(
            name: "Dariusz",
            surname: "Rybicki",
            type: AuthorType.Developer,
            avatarUrl: URL(string: "dr"),
            professionUrl: URL(string: "https://github.com/darrarski"),
            twitterUrl: URL(string: "https://twitter.com/darrarski")
        ),
        Author(
            name: "Dawid",
            surname: "Dapszus",
            type: AuthorType.Designer,
            avatarUrl: URL(string: "dd"),
            professionUrl: URL(string: "https://dribbble.com/dashoo"),
            twitterUrl: URL(string: "https://twitter.com/dapszus")
        )
    ]

}
