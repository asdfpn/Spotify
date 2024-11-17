//
//  RecentsCell.swift
//  Spotify
//
//  Created by Puneet on 08/11/24.
//

import SwiftUI

struct RecentsCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some random title"
    
    var body: some View {
        HStack(spacing: 16, content: {
         ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        })
        .padding(8)
        .frame(width: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        
        VStack {
            HStack {
                RecentsCell()
                RecentsCell()
            }
            HStack {
                RecentsCell()
                RecentsCell()
            }
        }
    }
    
}
