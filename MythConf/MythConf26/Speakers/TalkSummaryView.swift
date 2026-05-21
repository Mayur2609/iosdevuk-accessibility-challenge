//
//  TalkSummaryView.swift
//  IOSDevuk26
//

import SwiftUI

/// A compact row showing a talk's title, time, and location — used in speaker detail.
struct TalkSummaryView: View {
    @Environment(ViewModel.self) private var viewModel
    let talkID: UUID
    let session: Session

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.talkTitleFrom(talkID: talkID))
                .bold()
			HStack {
				Label(session.timeRange, systemImage: "clock")
					.accessibilityLabel("Time: \(session.timeRange)")
				Label(viewModel.locationNameFrom(talkID: talkID), systemImage: "mappin")
					.accessibilityLabel("Location: \(viewModel.locationNameFrom(talkID: talkID))")
			}
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}
