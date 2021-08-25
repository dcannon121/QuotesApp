//
//  ContentView.swift
//  QuotesApp
//
//  Created by David Cannon on 8/20/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = QuoteModel()
    @State var pressed = 0
    
    var body: some View {
        
        NavigationView {
            
            /*
             ZStack {
             
             LinearGradient(gradient: Gradient(colors: [Color(red: 0.55, green: 0.27, blue: 0.07), .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
             .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
             */
            
            ScrollView {
                
                VStack {
                    
                    ForEach(model.Quotes) { q in
                        NavigationLink(
                            //destination: ViewRecipe(recipe:r),
                            destination: ViewQuote(quote: q),
                            label: {
                                QuoteCard(quote: q)
                            })
                    }
                    if (self.pressed == 0) {
                    Button("Made By David Cannon") {
                        model.Quotes.append(Quote(id: UUID(), quoteList: ["I love you", "You make me feel complete","We're halves"], author: "David Cannon"))
                            self.pressed = 1
                        }
                    }
                    else {
                        Text("Made By David Cannon")
                    }
                }
            }
            .navigationBarTitle("Quotes")
            
            //}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
