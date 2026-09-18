import Foundation

enum MockOffers {
    static let all: [Offer] = (1...50).map { index in
        Offer(
            id: UUID(),
            title: "Offer #\(index)",
            merchantName: "Merchant \(index % 10)",
            discountPercentage: (index % 5) * 10 + 10
        )
    }
}
