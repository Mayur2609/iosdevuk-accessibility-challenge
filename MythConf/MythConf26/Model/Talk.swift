//
//  Talk.swift
//  TalkGenerator
//
//  Created by Chris Price on 28/06/2022.
//

import Foundation

struct Talk: Equatable, Comparable, Codable, Identifiable {
    var id = UUID()
    let talkTitle: String
    let talkDescription: String
    let speakerIDs: [String]
    let locationID: String

    static func == (lhs: Talk, rhs: Talk) -> Bool {
        return
            lhs.talkTitle == rhs.talkTitle
    }
    static func < (lhs: Talk, rhs: Talk) -> Bool {
        lhs.talkTitle < rhs.talkTitle
    }
}


