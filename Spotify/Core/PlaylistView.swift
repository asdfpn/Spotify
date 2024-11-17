//
//  PlaylistView.swift
//  Spotify
//
//  Created by Puneet on 11/11/24.
//

import SwiftUI

struct PlaylistView: View {
    
    var product: Product = .mock
    var user: User = .mock
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(height: 250, title: product.title, subtitle: product.brand ?? "", imageName: product.thumbnail)
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category.rawValue.capitalized,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharedPressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                }
            }
            .scrollIndicators(.hidden)
            
        }
    }
}

#Preview {
    PlaylistView()
}
