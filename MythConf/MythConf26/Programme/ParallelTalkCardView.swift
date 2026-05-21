//
//  ParallelTalkCardView.swift
//  IOSDevuk26
//

import SwiftUI

/// A card showing a single talk within a parallel-session slot.
struct ParallelTalkCardView: View {
    @Environment(ViewModel.self) private var viewModel
    let talkID: UUID
    let session: Session

	var body: some View {
		NavigationLink(value: TalkReference(talkID: talkID, session: session)) {
			VStack(alignment: .leading, spacing: 0) {
				session.sessionType.color
					.frame(height: 4)
					.accessibilityHidden(true)

				VStack(alignment: .leading) {
					Text(viewModel.talkTitleFrom(talkID: talkID))
						.bold()
						.font(.subheadline)
						.multilineTextAlignment(.leading)
					Text(viewModel.speakersFrom(talkID: talkID))
						.font(.caption)
						.foregroundStyle(.secondary)
						.multilineTextAlignment(.leading)
					Text(viewModel.locationNameFrom(talkID: talkID))
						.font(.caption)
						.foregroundStyle(.secondary)
					Spacer()
					HStack {
						Spacer()
						Color.clear.frame(width: 44, height: 44)
					}
				}
				.padding()
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
			.background(session.sessionType.color.opacity(0.1), in: .rect(cornerRadius: 10))
			.clipShape(.rect(cornerRadius: 10))
		}
		.accessibilityLabel("\(session.sessionType.displayName): \(viewModel.talkTitleFrom(talkID: talkID)), by \(viewModel.speakersFrom(talkID: talkID)), \(viewModel.locationNameFrom(talkID: talkID))")
		.buttonStyle(.plain)
		.overlay(alignment: .bottomTrailing) {
			FavouriteButtonView(talk: viewModel.talkFrom(talkID: talkID))
				.padding()
				.tint(viewModel.isFavourite(talk: viewModel.talkFrom(talkID: talkID)) ? .brown : .secondary)
				.accessibilityLabel(
					viewModel.isFavourite(talk: viewModel.talkFrom(talkID: talkID))
						? "Remove \(viewModel.talkTitleFrom(talkID: talkID)) from favourites"
						: "Add \(viewModel.talkTitleFrom(talkID: talkID)) to favourites"
				)
		}
	}
}
