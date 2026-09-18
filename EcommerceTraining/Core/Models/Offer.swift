import Foundation

struct Offer: Identifiable, Equatable {
    let id: UUID
    let title: String
    let merchantName: String
    let discountPercentage: Int
}
