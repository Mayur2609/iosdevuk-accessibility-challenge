//
//  SessionDetailView.swift
//  IOSDevuk26
//

import SwiftUI

struct SessionDetailView: View {
    @Environment(ViewModel.self) private var viewModel
    let talkReference: TalkReference

    private var talk: Talk { viewModel.talkFrom(talkID: talkReference.talkID) }
    private var session: Session { talkReference.session }

	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				Text(talk.talkTitle)
					.font(.largeTitle)
					.bold()
					.fixedSize(horizontal: false, vertical: true)
					.accessibilityAddTraits(.isHeader)

				// Time and location
				HStack {
					Label(session.timeRange, systemImage: "clock")
						.accessibilityLabel("Time: \(session.timeRange)")
					Spacer()
					NavigationLink(value: LocationNavigationID(value: talk.locationID)) {
						Label(viewModel.locationNameFrom(locationID: talk.locationID), systemImage: "mappin")
							.accessibilityLabel("Location: \(viewModel.locationNameFrom(locationID: talk.locationID))")
					}
				}
				.font(.subheadline)
				.foregroundStyle(.secondary)
				.padding(.bottom)

				// Speakers
				ForEach(talk.speakerIDs, id: \.self) { speakerID in
					NavigationLink(value: SpeakerNavigationID(value: speakerID)) {
						SpeakerRowView(speakerID: speakerID)
					}
					.buttonStyle(.plain)
				}

				Divider()
					.padding(.vertical)

				Text(talk.talkDescription)
			}
			.padding()
		}
		.navigationTitle(talk.talkTitle)
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItem(placement: .topBarTrailing) {
				FavouriteButtonView(talk: talk)
			}
		}
	}}
