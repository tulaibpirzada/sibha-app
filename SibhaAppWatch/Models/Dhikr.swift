import Foundation

struct Dhikr: Identifiable, Hashable {
    let id = UUID()
    let arabic: String
    let transliteration: String
    let target: Int
}
