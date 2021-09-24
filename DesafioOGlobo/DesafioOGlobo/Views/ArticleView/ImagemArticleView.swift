//
//  ImagemArticleView.swift
//  OGBProject
//
//  Created by Aurelien Belloche on 17/09/21.
//

import SwiftUI
struct ImagemArticleView: View {
    var artigo: Artigo
    var body: some View {
        if artigo.imagens != nil && !artigo.imagens!.isEmpty {
            Image(systemName: "illustration")
                .data(url: URL(string: artigo.imagens![0].url)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 0,
                       idealWidth: 100,
                       maxWidth: .infinity,
                       minHeight: 0,
                       idealHeight: 250,
                       maxHeight: 250,
                       alignment: .center)
                .overlay(ImagemArticleViewOverlay(text: artigo.imagens![0].legenda+". "+artigo.imagens![0].fonte),
                         alignment: .bottom)
            Spacer()
                .frame(width: 30,
                       height: 50,
                       alignment: .center)
        }
    }
}

struct ImagemArticleViewOverlay: View {
    var text: String
    var body: some View {
        ZStack {
            Text(text)
                .font(.footnote)
                .foregroundColor(.white)
                .padding(3)
            
        }.background(Color.black)
        .opacity(0.6)
        .padding(3)
    }
}

struct ImagemArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ImagemArticleView(artigo: artigosModel[0])
            .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE11))
    }
}
