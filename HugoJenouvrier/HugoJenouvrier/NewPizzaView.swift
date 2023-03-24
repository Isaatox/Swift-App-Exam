//
//  NewPizzaView.swift
//  HugoJenouvrier
//
//  Created by Cours on 24/03/2023.
//

import SwiftUI

struct NewPizzaView: View {
    @Environment(\.dismiss) var dismiss

    @Binding var pizzasList: [Pizza]

    @State private var pizzaParts = 1
    @State private var pizzaTomate = false
    @State private var pizzaFromage = false
    @State private var pizzaCornichons = false
    @State private var pizzaCommentaire = ""


    
    var body: some View {
        VStack {
            Text("Personnaliser votre pizza")
                .font(.title)
                .bold()
                .padding(.top, 16)
            
            Stepper("Nombre de parts : \(pizzaParts)", value: $pizzaParts, in: 1...12)
                .padding()
            
            Toggle(isOn: $pizzaTomate) {
                Text("Base sauce tomate 🍅")
            }
            .padding()
            
            Toggle(isOn: $pizzaFromage) {
                Text("Supplément fromage 🧀")
            }
            .padding()
            
            Toggle(isOn: $pizzaCornichons) {
                Text("Supplément cornichons 🥒")
            }
            .padding()
            
            TextField("Ajouter un commentaire", text: $pizzaCommentaire)
                .padding()
                .background(Color(.white))
                .border(Color(.gray))
                .padding()
            
            Button(action: {
                let pizza = createPizza()
                addNewPizza(pizza: pizza)
                dismiss()
            }){
                Text("Commander")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .padding()
            }
        }
    }
    
    private func createPizza() -> Pizza {
        
        let pizzaCom = pizzaCommentaire.isEmpty ? nil : pizzaCommentaire

        return Pizza(
            part: pizzaParts,
            baseTomate: pizzaTomate,
            supplementFromage: pizzaFromage,
            supplementCornichon: pizzaCornichons,
            commentaire: pizzaCom
        )
    }
    
    private func addNewPizza(pizza: Pizza) {
        pizzasList.append(pizza)
    }
}

struct NewPizzaView_Previews: PreviewProvider {
    static var previews: some View {
        NewPizzaView(pizzasList: .constant([]))
    }
}
