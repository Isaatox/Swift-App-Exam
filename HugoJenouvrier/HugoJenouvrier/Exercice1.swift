//
//  Exercice1.swift
//  HugoJenouvrier
//
//  Created by Cours on 24/03/2023.
//

import SwiftUI

struct Exercice1: View {
    @State private var isActive: Bool = false

    
    var body: some View {
//        Button {
//            isActive.toggle()
//        } label: {
//            Image(systemName: isActive ? .fill" : "\(iconName)")
//                .font(.system(size: 30))
//                .foregroundColor(isActive ? activatedIconColor : .primary)
//        }
        Button(action: {
            isActive.toggle()
        }) {
            Text("My Button")
                .foregroundColor(isActive ? .white : .black)
                .padding()
                .background(isActive ? .black : .white)
                .border(Color(.black))
        }
    }
}

struct Exercice1_Previews: PreviewProvider {
    static var previews: some View {
        Exercice1()
    }
}
