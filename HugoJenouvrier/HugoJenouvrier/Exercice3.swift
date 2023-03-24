//
//  Exercice3.swift
//  HugoJenouvrier
//
//  Created by Cours on 24/03/2023.
//

import SwiftUI
import Kingfisher

struct Exercice3: View {
    
    @State private var monFilm: Film?
    
    var body: some View {
        VStack{
            if let film = monFilm {
                KFImage(film.posterURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .clipped()
                Text(film.title)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.bottom, 8)
                Text(film.description)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            } else {
                Text("Chargement en cours...")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
        }
        .padding()
        .onAppear(){
            loadMonFilm()
        }
    }
    
    func loadMonFilm() {
        Task {
            let monFilmURL = URL(string: "https://api.themoviedb.org/3/movie/508442?api_key=ee6b2b9e0970948e6741d6b7985191fb")!
            do {
                let (data, _) = try await URLSession.shared.data(from: monFilmURL)
                
                let apiFilm = try JSONDecoder().decode(APIFilm.self, from: data)
                
                let newFilm = Film(
                    id: apiFilm.id,
                    title: apiFilm.title,
                    description: apiFilm.description,
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w500/\(apiFilm.imagePath)")!
                )
                monFilm = newFilm
                                
            } catch {
                print(error)
            }
        }
    }
}

struct Exercice3_Previews: PreviewProvider {
    static var previews: some View {
        Exercice3()
    }
}
