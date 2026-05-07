//
//  Speaker.swift
//  TalkGenerator
//
//  Created by Chris Price on 28/06/2022.
//

import Foundation

struct Speaker: Equatable, Comparable, Codable, Identifiable {
    var id: String
    var name: String
    var speakerInfo: String = ""
    var talkIDs: [UUID]
    var social: [SocialItem] = []

    var photoName: String { name.replacing(" ", with: "") }

    static func == (lhs: Speaker, rhs: Speaker) -> Bool {
        return
            lhs.name == rhs.name
    }
    static func < (lhs: Speaker, rhs: Speaker) -> Bool {
        lhs.name.lowercased() < rhs.name.lowercased()
    }
}


struct SocialItem: Codable, Hashable {
    let socialType: String
    let socialLink: String
}

