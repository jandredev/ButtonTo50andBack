
// Created by Ioannis Andreoulakis on 5/5/23.
//
// Build a UI with a Text element and a Button below it.
//
// The Text element should show a "0".
//
// Declare a method called increase which will add a random number between 1 and 10 to the number shown in the Text element
//
// Declare a method called decrease which will subtract a random number between 1 and 10 from the number shown in the Text element
//
// Initially, each time the button is tapped, call the increase method.
//
// This will bring the number closer to 50 each time you tap it.
//
// When the number in the Text element is over 50, then from now on you should call the decrease method each time the button is tapped.
//
// This will cause the number to start dropping towards 0 with each button tap.
//
// When the number in the Text element is under 0, then from now on you should call the increase method each time the button is tapped.
//
// This cycle should repeat itself. Climb to over 50 and then drop to under 0.

import SwiftUI



struct ContentView: View {
    @State var finalScore = 0
   @State var shouldIncrease = true
    func increase() -> Int {
        finalScore = finalScore + (Int.random(in:1...10))
        return finalScore
    }
    func decrease() -> Int {
        finalScore = finalScore - (Int.random(in:1...10))
        return finalScore
    }
    var body: some View {
        
        VStack {
            
            Text(String(finalScore))
                .font(.largeTitle)
                .padding(.all)
                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .imageScale(.large)
                .foregroundColor(.accentColor)
                        Button(action: {
                            
                            if finalScore >= 50 {
                                shouldIncrease = false
                            }
                            
                            if shouldIncrease == false && finalScore <= 0 {
                                shouldIncrease = true
                            }
                            
                            if shouldIncrease == true {
                                increase()
                            } else {
                                decrease()
                            }
                                
                            }, label: {
                                Text ("Tap Me!")
                            }
                        )
                    }
                }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
