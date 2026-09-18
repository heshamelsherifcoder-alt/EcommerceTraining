import Testing
@testable import EcommerceTraining

struct OffersListViewModelTests {
    @Test func loadPopulatesOffersFromRepository() {
        let sampleOffer = Offer(
            id: UUID(),
            title: "Test Offer",
            merchantName: "Test Merchant",
            discountPercentage: 20
        )
        let sut = OffersListViewModel(repository: { [sampleOffer] })

        sut.load()

        #expect(sut.offers == [sampleOffer])
    }

    @Test func loadWithEmptyRepositoryResultsInEmptyOffers() {
        let sut = OffersListViewModel(repository: { [] })

        sut.load()

        #expect(sut.offers.isEmpty)
    }
}
