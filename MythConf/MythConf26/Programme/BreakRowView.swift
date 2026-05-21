//
//  BreakRowView.swift
//  IOSDevuk26
//

import SwiftUI

/// A full-width row for non-session slots such as breaks, lunch, and social events.
struct BreakRowView: View {
    @Environment(ViewModel.self) private var viewModel
    let session: Session

    var body: some View {
		HStack(spacing: 16) {
			TimeColumnView(startTime: session.startTimeText, endTime: session.endTimeText)

			VStack(alignment: .leading) {
				Text(session.sessionType.displayName)
					.italic()
					.foregroundStyle(.primary)
					.accessibilityAddTraits(.isHeader)
				if let talkID = session.contentIDs.first {
					Text(viewModel.locationNameFrom(talkID: talkID))
						.font(.caption)
						.foregroundStyle(.secondary)
				}
			}

			Spacer()
		}
		.padding()
		.frame(maxWidth: .infinity)
		.background(session.sessionType.color.opacity(0.12))    }
}
