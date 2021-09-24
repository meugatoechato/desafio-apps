//
//  MainArticleRow.swift
//  OGBProject
//
//  Created by Aurelien Belloche on 17/09/21.
//

import SwiftUI

struct MainArticleRow: View {
    var artigo: Artigo
    var body: some View {
        if artigo.imagens != nil && !artigo.imagens!.isEmpty {
            MainArticleRowImage(urlString: artigo.imagens![0].url,
                                 secao: artigo.secao!.nome!,
                                 titulo: artigo.titulo!)
        } else {
            MainArticleRowImage(urlString: CONST_GLOBO_IMAGE,
                                 secao: artigo.secao!.nome ?? CONST_SECAO_SEM_NOME,
                                 titulo: artigo.titulo ?? CONST_GLOBO_NAME)
        }
    }
}

struct MainArticleRowImage: View {
    var urlString: String
    var secao: String
    var titulo: String
    var body: some View {
        Image(systemName: CONST_DEFAULT_IMAGE_SYSTEM_NAME)
            .resizable()
            .data(url: URL(string: urlString)!)
            .frame(minWidth: 0,
                   idealWidth: 350,
                   maxWidth: .infinity,
                   minHeight: 0,
                   idealHeight: 250,
                   maxHeight: 550,
                   alignment: .center)
            .overlay(MainArticleRowOverlay(secao: secao,
                                           titulo: titulo),
                     alignment: .bottom)
    }
}


struct MainArticleRowOverlay: View {
    var secao: String
    var titulo: String
    var body: some View {
        ZStack {
            VStack{
                Text(secao)
                    .bold()
                    .textCase(.uppercase)
                    .font(.system(size: 11,
                                  weight:.heavy,
                                  design: .monospaced))
                    .foregroundColor(.white)
                    .background(Color.black)
                    .opacity(0.6)
                    .padding(3)
                Text(titulo)
                    .bold()
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .opacity(0.6)
                    .padding(3)
            }
        }
    }
}

struct MainArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        MainArticleRow(artigo: artigosModel[0])
            .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE11))
        MainArticleRow(artigo: artigosModel[1])
            .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE12PROMAX))
    }
}
