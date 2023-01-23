//
//  RoundedImage.swift
//  TinderClone
//
//  Created by Gustavo Dias on 23/01/23.
//

import SwiftUI
import KingfisherSwiftUI

struct RoundedImage: View {
    var url: URL?
    
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: URL(string: "https://picsum.photos/400"))
    }
}
