//
//  SwiftUIView.swift
//  OGBProject
//
//  Created by Aurelien Belloche on 17/09/21.
//

import SwiftUI

struct ArticleList: View {
    var artigos: [Artigo]
    var body: some View {
        NavigationView {
            List(artigos) { artigo in
                ZStack(alignment: .leading) {
                    //LINKS
                    if artigo.tipo != nil && artigo.tipo == CONST_LINK_EXTERNO {
                        if artigo.url != nil {
                            Link("", destination: URL(string: artigo.url!)!)
                        }
                    } else {
                        NavigationLink(destination: ArticleView(artigo: artigo)) {
                            EmptyView()
                        }
                        .opacity(0)
                    }
                    //ROW TYPE
                    if artigo.id != nil && artigo.id! == artigos[0].id {
                        MainArticleRow(artigo: artigo)
                    } else {
                        ArticleRow(artigo: artigo)
                    }
                }
            }
            .navigationBarTitle(CONST_GLOBO_NAME)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
              ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                  print("Menu")
                }) {
                  Label("Menu", systemImage: "line.horizontal.3")
                }
              }
            }
        }
        .navigationBarColor(backgroundColor : globoBlue, tintColor: .white)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArticleRow(artigo: artigosModel[0])
                .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE11))
            ArticleRow(artigo: artigosModel[1])
                .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE12PROMAX))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
