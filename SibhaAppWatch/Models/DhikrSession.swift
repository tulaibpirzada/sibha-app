import Foundation

struct DhikrSession: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let dhikrList: [Dhikr]

    static let postSalah = DhikrSession(
        name: "Post-Salah",
        dhikrList: [
            Dhikr(arabic: "سُبْحَانَ اللّٰهِ", transliteration: "SubhanAllah", target: 33),
            Dhikr(arabic: "الْحَمْدُ لِلّٰهِ", transliteration: "Alhamdulillah", target: 33),
            Dhikr(arabic: "اللّٰهُ أَكْبَرُ", transliteration: "Allahu Akbar", target: 34),
        ]
    )

    static let presets: [DhikrSession] = [postSalah]
}
