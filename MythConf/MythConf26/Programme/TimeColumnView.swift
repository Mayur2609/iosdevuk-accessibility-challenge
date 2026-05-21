//
//  TimeColumnView.swift
//  IOSDevuk26
//

import SwiftUI

/// A fixed-width column showing a session's start and end times.
struct TimeColumnView: View {
	let startTime: String
	let endTime: String

	private var accessibilityTimeLabel: String {
		let start = startTime.replacingOccurrences(of: ":", with: " ")
		let end = endTime.replacingOccurrences(of: ":", with: " ")
		return "Session start time \(start) hours, session end time \(end) hours"
	}

	var body: some View {
		VStack(alignment: .trailing) {
			Text(startTime)
				.bold()
				.monospacedDigit()
			Text(endTime)
				.foregroundStyle(.secondary)
				.monospacedDigit()
		}
		.font(.caption)
		.frame(width: 44, alignment: .trailing)
		.accessibilityElement(children: .ignore)
		.accessibilityLabel(accessibilityTimeLabel)
	}
}
