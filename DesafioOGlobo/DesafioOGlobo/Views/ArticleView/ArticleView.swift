//
//  ArticleView.swift
//  OGBProject
//
//  Created by Aurelien Belloche on 16/09/21.
//

import SwiftUI

struct ArticleView: View {
    var artigo: Artigo
    
    var body: some View {
        ScrollView {
            VStack{
                HeaderArticleView(artigo: artigo)
                ImagemArticleView(artigo: artigo)
                if artigo.texto != nil {
                    Text(artigo.texto!)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(10)
        }
        .navigationTitle((artigo.secao!.nome ?? "GERAL").uppercased())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                share(urlString: artigo.urlOriginal!)
            }) {
              Label("Share", systemImage: "square.and.arrow.up")
            }
          }
        }
    }
}

private func share(urlString: String) {
    guard let urlShare = URL(string: urlString) else { return }
       let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
       UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
   }


struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(artigo: artigosModel[0])
            .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE11))
        ArticleView(artigo: artigosModel[2])
            .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE12PROMAX))
    }
}
