import SwiftUI

struct WatchContentView: View {
    var body: some View {
        NavigationStack {
            SessionPickerView()
                .navigationDestination(for: DhikrSession.self) { session in
                    CounterView(session: session)
                }
        }
    }
}
