import Foundation

@Observable
final class OffersListViewModel {
    private(set) var offers: [Offer] = []

    private let repository: () -> [Offer]

    init(repository: @escaping () -> [Offer] = { MockOffers.all }) {
        self.repository = repository
    }

    func load() {
        offers = repository()

        if offers.isEmpty {
            AppLogger.info("offers_list_empty")
        } else {
            AppLogger.info("offers_list_loaded", attributes: ["count": offers.count])
        }
    }
}
