//
//  ContentView.swift
//  Spotify
//
//  Created by Puneet on 15/10/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        VStack {
            ForEach(products) { product in
                Text(product.title)
                    .foregroundStyle(.spotifyGreen)
            }
            
            ForEach(users) { user in
                Text(user.firstName)
                    .foregroundStyle(.spotifyGreen)
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
