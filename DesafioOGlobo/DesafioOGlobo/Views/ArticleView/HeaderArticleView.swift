//
//  HeaderArticleView.swift
//  OGBProject
//
//  Created by Aurelien Belloche on 17/09/21.
//

import SwiftUI

struct HeaderArticleView: View {
    var artigo: Artigo
    
    var body: some View {
        if artigo.titulo != nil {
            Text(artigo.titulo!)
                .bold()
                .font(.title)
                .multilineTextAlignment(.center)
        }
        Spacer()
            .frame(width: 30, height: 15, alignment: .center)
        if artigo.subTitulo != nil {
            Text(artigo.subTitulo ?? "")
                .font(.title2)
                .multilineTextAlignment(.center)
        }
        Spacer()
            .frame(width: 30, height: 30, alignment: .center)
        HStack{
            Text("Por")
                .font(.footnote)
                .bold()
            if artigo.autores != nil && !artigo.autores!.isEmpty {
                ForEach(artigo.autores!, id: \.self) { autor in
                    Text(autor)
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .bold()
                }
            } else {
            Text(CONST_GLOBO_NAME)
                .font(.footnote)
                .foregroundColor(.blue)
                .bold()
            }
        }
        HStack{
            if artigo.atualizadoEm != nil {
            Text("🕚")
                .font(.footnote)
                Text(artigo.atualizadoEm!)
                .font(.footnote)
            }
        }
        Spacer()
            .frame(width: 30, height: 15, alignment: .center)
    }
}

struct HeaderArticleView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderArticleView(artigo: artigosModel[0])
            .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE11))
    }
}
