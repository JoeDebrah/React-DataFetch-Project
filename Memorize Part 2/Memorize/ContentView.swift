//
//  ContentView.swift
//  Memorize
//
//  Created by Sameh Fakhouri on 6/14/21.
//

import SwiftUI

struct ContentView: View {
    @State var Cars: [String] = ["🚖","🚗", "🚘","🚙","🚚","🚛","🚜","🚤"]
    
    @State var Animals: [String] = ["🐶","🐱","🐸","🦊","🦁","🐷","🐝","🐬"]
    
    @State var Fruits: [String] = ["🍏","🍐","🍋","🍓","🍉","🍑","🍆","🌽"]
    
    
    @State var Theme_Count: Int = 8
    
    @State var Emojis: [String] = ["✂️","✂️","✂️","✂️","✂️","✂️","✂️","✂️"]
    
    var body: some View {
        VStack {
            Text("Memorize").font(Font.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(Emojis[0..<Theme_Count], id: \.self) { Emoji in
                        CardView(content: Emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)

            Spacer()
            HStack {
                Spacer()
                Car
                Spacer()
                Animal
                Spacer()
                Fruit
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var Car : some View {
        VStack{
        Button {
            Emojis = Cars.shuffled()
        }
         label: {
                Image(systemName: "car")
        }
            Text("Cars").font(Font.caption)
                .foregroundColor(Color.green)
    }
    }
    
    var Animal : some View {
        VStack{
        Button {
            Emojis = Animals.shuffled()
            }
         label: {
                Image(systemName: "ant.circle")
        }
            Text("Animals").font(Font.caption)
                .foregroundColor(Color.green)
        }
    }
    
    var Fruit : some View {
        VStack{
        Button {
            Emojis = Fruits.shuffled()
        } label: {
                Image(systemName: "free_breakfast")
        }
            Text("Fruits").font(Font.caption)
                .foregroundColor(Color.green)
        }
    }
    
    
}


struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
