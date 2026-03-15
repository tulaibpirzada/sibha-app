import SwiftUI

struct CompletionView: View {
    @Environment(\.dismiss) private var dismiss
    let onDone: () -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 8) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 44))
                    .foregroundStyle(.green)

                Text("Complete")
                    .font(.headline)

                Text("الحمد لله")
                    .font(.title2)

                Button("Done") {
                    onDone()
                    dismiss()
                }
                .buttonStyle(.bordered)
                .tint(.green)
                .padding(.top, 4)
            }
        }
    }
}

#Preview {
    CompletionView(onDone: {})
}
