//
//  MatrixRainView.swift
//  Homework 3.6
//
//  Created by Alik Nigay on 08.02.2022.
//

import SwiftUI

struct MatrixRainView: View {
    
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            HStack(spacing: 15) {
                ForEach(0...Int(size.width) / 25, id: \.self) { _ in
                    MatrixRainCharacters(size: size)
                }
            }
            .padding(.horizontal)
        }
        
    }
}

struct MatrixRainCharacters: View {
    @State private var isStarted = false
    @State private var random = 0
    
    let size: CGSize
    
    var body: some View {
        let randomHeight: CGFloat = .random(in: (size.height / 2)...size.height)
        
        VStack {
            ForEach(0..<constant.count, id: \.self) { index in
                let character = Array(constant)[getRandomInt(index: index)]
                Text(String(character))
                    .font(.headline)
                    .foregroundColor(.green)
            }
        }
        .mask(alignment: .top) {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [
                            .clear,
                            .black.opacity(0.1),
                            .black.opacity(0.2),
                            .black.opacity(0.3),
                            .black.opacity(0.5),
                            .black.opacity(0.6),
                            .black
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(height: size.height / 2)
                .offset(y: isStarted ? size.height : -randomHeight)
        }
        .onAppear {
            withAnimation(.linear(duration: 12).delay(Double.random(in: 1...2)).repeatForever(autoreverses: false)) {
                isStarted.toggle()
            }
        }
        .onReceive(Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()) { _ in
            random = Int.random(in: 0..<constant.count)
        }
    }
    
    private func getRandomInt(index: Int) -> Int {
        let max = constant.count - 1
        
        if (index + random) > max {
            return (index - random) < 0 ? index : index - random
        } else {
            return index + random
        }
    }
}

struct MatrixRainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private let constant = "а1б2в3г4д5е6ё7ж8з9и0клмнопрстуфхцчшщъыьэюя"
