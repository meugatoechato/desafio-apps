//
//  MiniArticle.swift
//  OGBProject
//
//  Created by Aurelien Belloche on 17/09/21.
//

import SwiftUI

struct ArticleRow: View {
    var artigo: Artigo
    
    var body: some View {
            HStack {
                //IMAGE
                if artigo.imagens != nil && !artigo.imagens!.isEmpty {
                    ArticleRowImage(urlString: artigo.imagens![0].url)
                } else {
                    ArticleRowImage(urlString: CONST_GLOBO_IMAGE)
                }
                VStack {
                    //SECTION
                    if artigo.secao?.nome != nil {
                        ArticleRowSecao(secao: artigo.secao!.nome!)
                    } else {
                        ArticleRowSecao(secao: CONST_SECAO_SEM_NOME)
                    }
                    Spacer()
                        .frame(height: 8)
                    //ARTICLE
                    if artigo.titulo != nil {
                        Text(artigo.titulo!)
                            .bold()
                            .font(.system(size: 14,
                                          weight:.heavy,
                                          design: .rounded))

                            .multilineTextAlignment(.leading)
                            .frame(width: 250,
                                   alignment: .bottomLeading)
                            .lineLimit(2)                            .padding(.trailing)
                    }
                }
                .frame(width: 250 ,
                       height: 70,
                       alignment: .leading)
            }
            Spacer()
    }
}

struct ArticleRowImage: View {
    var urlString: String
    var body: some View {
        Image(systemName: CONST_DEFAULT_IMAGE_SYSTEM_NAME)
            .resizable()
            .data(url: URL(string: urlString)!)
            .frame(width: 110,
                   height: 70)
    }
}

struct ArticleRowSecao: View {
    var secao: String
    var body: some View {
        Text(secao)
            .foregroundColor(.gray)
            .bold()
            .textCase(.uppercase)
            .font(.system(size: 11,
                          weight:.heavy,
                          design: .monospaced))
            .frame(width: 250,
                  alignment: .topLeading)
            .padding(.trailing)
    }
}

struct MiniArticle_Previews: PreviewProvider {
    static var previews: some View {
            ArticleRow(artigo: artigosModel[1])
                .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE11))
            ArticleRow(artigo: artigosModel[1])
                .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE12PROMAX))
    }
}
