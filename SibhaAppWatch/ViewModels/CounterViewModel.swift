import Foundation
import WatchKit

@Observable
@MainActor
final class CounterViewModel {
    let session: DhikrSession
    private(set) var currentDhikrIndex: Int = 0
    private(set) var currentCount: Int = 0
    private(set) var isSessionComplete: Bool = false
    private(set) var isAdvancing: Bool = false

    init(session: DhikrSession) {
        self.session = session
    }

    var currentDhikr: Dhikr {
        session.dhikrList[currentDhikrIndex]
    }

    func increment() {
        guard !isSessionComplete, !isAdvancing else { return }
        currentCount += 1
        WKInterfaceDevice.current().play(.click)

        if currentCount >= currentDhikr.target {
            handleDhikrComplete()
        }
    }

    func reset() {
        currentDhikrIndex = 0
        currentCount = 0
        isSessionComplete = false
        isAdvancing = false
    }

    private func handleDhikrComplete() {
        WKInterfaceDevice.current().play(.success)

        if currentDhikrIndex < session.dhikrList.count - 1 {
            isAdvancing = true
            Task { @MainActor in
                try? await Task.sleep(for: .seconds(0.8))
                self.currentDhikrIndex += 1
                self.currentCount = 0
                self.isAdvancing = false
            }
        } else {
            isSessionComplete = true
        }
    }
}
