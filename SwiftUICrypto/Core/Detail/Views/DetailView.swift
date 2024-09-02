//
//  DetailView.swift
//  SwiftUICrypto
//
//  Created by Sergio Buitrago on 31/08/24.
//

import SwiftUI


struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 38

    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("")
                    .frame(height: 150)
                overViewTittle
                Divider()
                overviewGrid
                additionalTittle
                Divider()
                additionalGrid
            }
            .padding()
        }
        .navigationTitle(vm.coin.name)
    }
}

#Preview {
    NavigationStack {
        DetailView(coin: DeveloperPreview.instance.coin)
    }
}


extension DetailView {
    
    private var overViewTittle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTittle: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: nil,
                  pinnedViews: [],
                  content: {
            ForEach(vm.overviewStatistics) { stat in
                StatisticsView(stat: stat)
            }
        })
    }
    
    private var additionalGrid: some View {
        LazyVGrid(columns: columns,
                  alignment: .leading,
                  spacing: nil,
                  pinnedViews: [],
                  content: {
            ForEach(vm.additionalStatistics) { stat in
                StatisticsView(stat: stat)
            }
        })
    }
}
