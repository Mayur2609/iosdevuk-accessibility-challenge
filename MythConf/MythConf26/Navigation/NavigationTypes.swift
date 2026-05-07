//
//  NavigationTypes.swift
//  IOSDevuk26
//

import SwiftUI

/// A reference to a specific talk within a session, used for type-safe navigation.
struct TalkReference: Hashable {
    let talkID: UUID
    let session: Session
}

/// Navigation wrapper for a speaker ID string.
struct SpeakerNavigationID: Hashable {
    let value: String
}

/// Navigation wrapper for a location ID string.
struct LocationNavigationID: Hashable {
    let value: String
}

private struct ConferenceNavigationDestinations: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: TalkReference.self) { ref in
                SessionDetailView(talkReference: ref)
            }
            .navigationDestination(for: SpeakerNavigationID.self) { navID in
                SpeakerDetailView(speakerID: navID.value)
            }
            .navigationDestination(for: LocationNavigationID.self) { navID in
                LocationDetailView(locationID: navID.value)
            }
    }
}

extension View {
    func conferenceNavigationDestinations() -> some View {
        modifier(ConferenceNavigationDestinations())
    }
}
