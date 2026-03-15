import SwiftUI

struct SessionPickerView: View {
    var body: some View {
        List {
            ForEach(DhikrSession.presets) { session in
                NavigationLink(value: session) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(session.name)
                            .font(.headline)
                        Text("\(session.dhikrList.map { $0.transliteration }.joined(separator: " · "))")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                }
            }
        }
        .navigationTitle("Sibha")
    }
}

#Preview {
    NavigationStack {
        SessionPickerView()
    }
}
