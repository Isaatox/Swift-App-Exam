//
//  Exercice2.swift
//  HugoJenouvrier
//
//  Created by Cours on 24/03/2023.
//

import SwiftUI

class PizzaData: ObservableObject {
    @Published var pizzas: [Pizza]
    
    init(pizzas: [Pizza]) {
        self.pizzas = pizzas
    }
}

struct Exercice2: View {
    
    @StateObject var pizzaData: PizzaData = PizzaData(pizzas: Pizza.previewPizza)
    @State private var isShowingNewTaskView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(pizzaData.pizzas) { pizza in
                    VStack(alignment: .leading) {
                        Text("\(String(pizza.part)) parts")
                        HStack {
                            if pizza.baseTomate {
                                Text("🍅")
                            }
                            if pizza.supplementFromage {
                                Text("🧀")
                            }
                            if pizza.supplementCornichon {
                                Text("🥒")
                            }
                        }
                        if pizza.commentaire != nil {
                            Text(pizza.commentaire!)
                        }
                    }
                }
            }
        }
        .overlay(alignment: .bottomTrailing) {
            Button {
                isShowingNewTaskView = true
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Circle()
                            .foregroundColor(.blue)
                    )
                    .shadow(radius: 10, y: 5)
            }
            .padding()
        }
        .sheet(isPresented: $isShowingNewTaskView) {
            NewPizzaView(pizzasList: $pizzaData.pizzas)
        }
    }
}

struct Exercice2_Previews: PreviewProvider {
    static var previews: some View {
        Exercice2()
    }
}
