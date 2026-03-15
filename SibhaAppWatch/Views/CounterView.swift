import SwiftUI

struct CounterView: View {
    @State private var viewModel: CounterViewModel

    init(session: DhikrSession) {
        _viewModel = State(wrappedValue: CounterViewModel(session: session))
    }

    var body: some View {
        ZStack {
            counterContent

            if viewModel.isSessionComplete {
                CompletionView(onDone: viewModel.reset)
                    .transition(.opacity.animation(.easeIn(duration: 0.3)))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: viewModel.isSessionComplete)
        .navigationBarBackButtonHidden(viewModel.isSessionComplete)
    }

    private var counterContent: some View {
        Button(action: viewModel.increment) {
            VStack(spacing: 2) {
                Text(viewModel.currentDhikr.arabic)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.6)
                    .lineLimit(2)

                Text(viewModel.currentDhikr.transliteration)
                    .font(.caption2)
                    .foregroundStyle(.secondary)

                Spacer()

                Text("\(viewModel.currentCount)")
                    .font(.system(size: 52, weight: .bold, design: .rounded))
                    .contentTransition(.numericText())
                    .animation(.easeOut(duration: 0.15), value: viewModel.currentCount)

                Text("of \(viewModel.currentDhikr.target)")
                    .font(.caption2)
                    .foregroundStyle(.secondary)

                Spacer()

                // Sequence progress dots
                HStack(spacing: 6) {
                    ForEach(0..<viewModel.session.dhikrList.count, id: \.self) { i in
                        Circle()
                            .fill(i <= viewModel.currentDhikrIndex ? Color.white : Color.white.opacity(0.25))
                            .frame(width: 6, height: 6)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.vertical, 4)
        }
        .buttonStyle(.plain)
        .modifier(DoubleTapShortcutModifier())
    }
}

#Preview {
    CounterView(session: .postSalah)
}

private struct DoubleTapShortcutModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(watchOS 11.0, *) {
            content.handGestureShortcut(.primaryAction)
        } else {
            content
        }
    }
}
