//
//  SettingsView.swift
//  SwiftUICrypto
//
//  Created by Sergio Buitrago on 5/09/24.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let linkedinURL = URL(string: "https://www.linkedin.com/in/sbuitragoa/")!
    let githubURL = URL(string: "https://github.com/Chechobuitrago")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalWebsiteURL = URL(string: "https://yourpersonalwebsite.com")!
    
    var body: some View {
        NavigationStack {
            List {
                // Creator Section
                creatorSection
                coinGeckoSection
                applicationSection
            }
            .font(.headline)
            .tint(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}


extension SettingsView {
    
    private var creatorSection: some View {
        Section {
            VStack(alignment: .leading) {
                HStack {
                    Image("imagenSergio")
                        .resizable()
                        .frame(width: 130, height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 130)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.trailing, 0)
                }
                Text("This app was built by Sergio Buitrago entirely in Swift using SwiftUI. It harnesses MVVM architecture, Combine, and CoreData for multi-threading, real-time updates, and data persistence—making it both efficient and scalable.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Connect with me on LinkedIn 🧑🏻‍💻", destination: linkedinURL)
            Link("Explore my projects and contributions on GitHub!", destination: githubURL)
        }
    header: {Text("Creator")}
    }
    private var coinGeckoSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko Price may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: linkedinURL)
        }
    header: {Text("CoinGecko")}
    }
    private var applicationSection: some View {
        Section {
           Link("Terms of Service", destination: defaultURL)
           Link("Privacy Policy", destination: defaultURL)
           Link("Company Website", destination: defaultURL)
           Link("Learn More", destination: defaultURL)
        }
    header: {Text("Aplication")}
    }
}
