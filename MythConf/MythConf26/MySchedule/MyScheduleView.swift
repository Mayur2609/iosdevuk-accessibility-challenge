//
//  MyScheduleView.swift
//  IOSDevuk26
//

import SwiftUI

struct MyScheduleView: View {
	@Environment(ViewModel.self) private var viewModel

	var body: some View {
		NavigationStack {
			Group {
				if viewModel.favouriteIds.isEmpty {
					VStack(spacing: 16) {
						Image(systemName: "star")
							.font(.system(size: 56))
							.foregroundStyle(.secondary)
							.accessibilityHidden(true)

						Text("No Favourites Yet")
							.font(.title2.bold())
							.multilineTextAlignment(.center)
							.accessibilityAddTraits(.isHeader)
							.accessibilityHeading(.h2)


						Text("Tap the star on any session in the Programme to save it here.")
							.font(.subheadline)
							.foregroundStyle(.secondary)
							.multilineTextAlignment(.center)
					}
					.padding()
					.frame(maxWidth: .infinity, maxHeight: .infinity)
				} else {
					ScrollView {
						LazyVStack(spacing: 0, pinnedViews: .sectionHeaders) {
							ForEach(viewModel.favouritesBySession.indices, id: \.self) { dayIndex in
								let daySessions = viewModel.favouritesBySession[dayIndex]
								if daySessions.first?.sessionType != .dummy {
									Section {
										ForEach(daySessions) { session in
											ParallelSessionsRowView(session: session)
											Divider()
										}
									} header: {
										Text(dayHeader(for: daySessions))
											.font(.headline)
											.bold()
											.frame(maxWidth: .infinity, alignment: .leading)
											.padding(.horizontal)
											.padding(.vertical, 8)
											.background(.regularMaterial)
									}
								}
							}
						}
					}
				}
			}
			.navigationTitle("My Schedule")
			.conferenceNavigationDestinations()
		}
	}

	private func dayHeader(for sessions: [Session]) -> String {
		guard let first = sessions.first else { return "" }
		return first.startTime.formatted(.dateTime.weekday(.wide).day().month(.wide))
	}
}

#Preview {
	MyScheduleView()
		.environment(ViewModel())
}
