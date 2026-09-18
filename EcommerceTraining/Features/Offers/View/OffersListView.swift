import DatadogRUM
import SwiftUI

struct OffersListView: View {
    @State private var viewModel = OffersListViewModel()

    var body: some View {
        List(viewModel.offers) { offer in
            VStack(alignment: .leading) {
                Text(offer.title)
                    .font(.headline)
                Text("\(offer.merchantName) · \(offer.discountPercentage)% off")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .accessibilityIdentifier("OffersList")
        .navigationTitle("Offers")
        .trackRUMView(name: "OffersList")
        .onAppear {
            viewModel.load()
        }
        // TEMP DEMO: intentional crash trigger to verify Datadog Crash
        // Reporting end-to-end. Remove after confirming in the dashboard.
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Crash") {
                    fatalError("Demo crash for Datadog Crash Reporting verification")
                }
            }
        }
    }
}

#Preview {
    OffersListView()
}
