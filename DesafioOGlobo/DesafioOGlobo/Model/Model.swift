//
//  Model.swift
//  OGBProject
//
//  Created by Aurelien Belloche on 15/09/21.
//

import Foundation

//Used mainly for UI previews

var artigosModel: [Artigo] = getDatasFromLocalJson()

private func getDatasFromLocalJson() -> [Artigo] {
    var artigos: [Artigo] = [Artigo].init()
    if let datas = parse(jsonData: loadJson(fromLocalFile: CONST_LOCAL_JSON)) {
        artigos = getArtigos(fromDados: datas)
    }
   return artigos
}

func loadJson(fromLocalFile filename: String) -> Data {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    return data
}

private func parse(jsonData: Data) -> [Dados]? {
    var decodedDatas: [Dados]?
    do {
        decodedDatas = try JSONDecoder().decode([Dados].self, from: jsonData)
    } catch {
        fatalError("Couldn't parse datas.")
    }
    return decodedDatas
}

func getArtigos(fromDados datas: [Dados]) -> [Artigo] {
    var artigos: [Artigo] = [Artigo].init()
    for dado in datas {
        for artigo in dado.conteudos {
            artigos.append(artigo)
        }
    }
    artigos = organizeByActualizadoEm(fromArtigos: artigos)
//    printArtigosTitulo(withArtigos: artigos)
    return artigos
}

private func organizeByActualizadoEm(fromArtigos unsortedArtigos: [Artigo]) -> [Artigo] {
    return unsortedArtigos.sorted(by: { $0.atualizadoEm! > $1.atualizadoEm! })
}

private func printArtigosTitulo(withArtigos artigos: [Artigo]) {
    for artigo in artigos {
        if artigo.atualizadoEm == nil {
            print("Artigo sem titulo")
        } else {
            print(artigo.titulo!)
        }
    }
}


/*
func reloadDatas(withArtigos art :[Artigo]) {
    artigosModel = art
}

private func getDatasFromOnlineJson() {
    loadJson(fromURLString: CONST_URL_JSON) { (result) in
        switch result {
        case .success(let data):
            if let datas = parse(jsonData: data) {
                reloadDatas(withArtigos: getArtigos(fromDados: datas))
            }
        case .failure(let error):
            print(error)
        }
    }
}
 
 private func loadJson(fromURLString urlString: String,
                       completion: @escaping (Result<Data, Error>) -> Void) {
     if let url = URL(string: urlString) {
         let urlSession = URLSession.shared.dataTask(with: url) { (data, response, error) in
             if let error = error {
                 completion(.failure(error))
             }
             if let data = data {
                 completion(.success(data))
             }
         }
         urlSession.resume()
     }
 }
*/
