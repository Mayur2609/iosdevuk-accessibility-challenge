//
//  Location.swift
//  TalkGenerator
//
//  Created by Chris Price on 28/06/2022.
//

import Foundation
import MapKit

struct Location: Equatable, Comparable, Codable, Identifiable {
    var id: String
    var name: String
    var latitude: Double
    var longitude: Double
    var placeDescription: String

    static func == (lhs: Location, rhs: Location) -> Bool {
        return
            lhs.id == rhs.id
    }
    static func < (lhs: Location, rhs: Location) -> Bool {
        lhs.id < rhs.id
    }
}


/// This is the set of details used to put an annotation on the map
struct MapNode: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
    let subtitle: String

    init(location: Location) {
        coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        title = location.name
        subtitle = location.placeDescription
    }
}
