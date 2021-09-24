//
//  ContentView.swift
//  DesafioOGlobo
//
//  Created by Aurelien Belloche on 15/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var artigos = [Artigo]()
    var body: some View {
        ArticleList(artigos: artigos)
            .onAppear(perform: {
                loadData()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE11))
        ContentView()
            .previewDevice(PreviewDevice(rawValue: CONST_PREVIEW_IPHONE12PROMAX))
    }
}

extension ContentView
{
    func loadData() {
        guard let url = URL(string: CONST_URL_JSON) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let dataObj = try? JSONDecoder().decode([Dados].self, from: data) {
                    DispatchQueue.main.async {
                        self.artigos = getArtigos(fromDados: dataObj)
                    }
                }
            }
        }.resume()
    }
}
