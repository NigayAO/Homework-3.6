//
//  KeyboardView.swift
//  Homework 3.6
//
//  Created by Alik Nigay on 08.02.2022.
//

import SwiftUI

struct KeyboardView: View {
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            Path { path in
                path.move(to: CGPoint(x: 20, y: 20))
//                path.add
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
            .frame(width: 200, height: 200)
    }
}
