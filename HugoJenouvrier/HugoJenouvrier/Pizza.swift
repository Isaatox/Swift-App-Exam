//
//  Pizza.swift
//  HugoJenouvrier
//
//  Created by Cours on 24/03/2023.
//

import Foundation

class Pizza: Identifiable, ObservableObject {
    let id = UUID()
    let part: Int
    let baseTomate: Bool
    let supplementFromage: Bool
    let supplementCornichon: Bool
    @Published var commentaire: String?
    
    
    init(part: Int, baseTomate: Bool, supplementFromage: Bool, supplementCornichon: Bool, commentaire: String? = nil) {
        self.part = part
        self.baseTomate = baseTomate
        self.supplementFromage = supplementFromage
        self.supplementCornichon = supplementCornichon
        self.commentaire = commentaire
    }
    
}

extension Pizza {
//    static let previewTasks = [
//        Task(name: "Rendre le projet"),
//        Task(name: "Faire l'appel", dueDate: .now + 10000),
//        Task(name: "Commander à manger", priority: .high),
//        Task(name: "Finir le rapport", priority: .low)
//    ]
    static let previewPizza = [
        Pizza(part: 3, baseTomate: true, supplementFromage: false, supplementCornichon: false),
        Pizza(part: 5, baseTomate: true, supplementFromage: true, supplementCornichon: false),
        Pizza(part: 8, baseTomate: true, supplementFromage: true, supplementCornichon: true, commentaire: "Pizza pas trop cuite"),
    ]
}

