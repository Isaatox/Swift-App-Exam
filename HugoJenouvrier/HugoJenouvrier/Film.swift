//
//  Film.swift
//  HugoJenouvrier
//
//  Created by Cours on 24/03/2023.
//

import Foundation

struct Film: Identifiable {
    let id: Int
    let title: String
    let description: String
    let posterURL: URL
}

extension Film {
    static let preview = Film(
        id: 1,
        title: "Fast & Furious : Hobbs & Shaw",
        description: "Depuis que Hobbs, fidèle agent de sécurité au service diplomatique des États-Unis, combatif mais droit, et Shaw, un homme sans foi ni loi, ancien membre de l’élite militaire britannique, se sont affrontés en 2015 dans Fast & Furious 7, les deux hommes font tout ce qu’ils peuvent pour se nuire l’un à l’autre. Mais lorsque Brixton, un anarchiste génétiquement modifié, met la main sur une arme de destruction massive après avoir battu le meilleur agent du MI6 qui se trouve être la sœur de Shaw, les deux ennemis de longue date vont devoir alors faire équipe pour faire tomber le seul adversaire capable de les anéantir.",
        posterURL: URL(string: "https://image.tmdb.org/t/p/w500/kgajCPm5pdH2Sa3CTCyHuUmQvgT.jpg")!
    )
}
