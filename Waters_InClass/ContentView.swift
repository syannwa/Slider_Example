//
//  ContentView.swift
//  Waters_InClass
//
//  Created by Sydney Ann Waters on 11/18/19.
//  Copyright © 2019 Sydney Ann Waters. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var slide: Double = 0.0
    @State private var counter = 0
    var colors = [Color.green, Color.red, Color.blue, Color.yellow]
    
    var body: some View {
        VStack(spacing: 40.0) {
            Slider(value: $slide, in: 0.00001...360, step: 0.1)
            Text("\(slide)")
            ButtonsView(counter : $counter, colors : colors)
            GraphView(slide : $slide, counter : $counter, color : colors[counter])
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GraphView: View {
    @Binding var slide : Double
    @Binding var counter : Int
    var color : Color
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 200))
            path.addArc(center: .init(x :200, y:200), radius: 150, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: slide), clockwise: true)
        }
        .fill(color)
    }
}

struct ButtonsView: View {
    
    @Binding var counter : Int
    var colors : Array<Any>
    
    var body: some View {
        HStack(spacing: 50.0) {
            Button(action : {
                self.counter-=1
                if(self.counter == 0) {
                    self.counter =  self.colors.count
                }
            }) {
                Image(systemName: "arrow.left.circle")
                    .font(.system(size: 35))
            }
            Button(action : {
                self.counter+=1
                if(self.counter == self.colors.count) {
                    self.counter =  0
                }
            }) {
                Image(systemName: "arrow.right.circle")
                    .font(.system(size: 35))
            }
        }
    }
}
