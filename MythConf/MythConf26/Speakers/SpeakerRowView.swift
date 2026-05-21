//
//  SpeakerRowView.swift
//  IOSDevuk26
//

import SwiftUI

/// A row showing a speaker's photo, name, and bio excerpt.
struct SpeakerRowView: View {
    @Environment(ViewModel.self) private var viewModel
    let speakerID: String

    private var speaker: Speaker { viewModel.speakerFrom(speakerID: speakerID) }

	var body: some View {
		HStack(alignment: .center, spacing: 12) {
			SpeakerPhotoView(speaker: speaker, size: 56)

			Text(speaker.name)
				.bold()
		}
	}
}
