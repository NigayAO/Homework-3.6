//
//  DisplayVIew.swift
//  Homework 3.6
//
//  Created by Alik Nigay on 08.02.2022.
//

import SwiftUI

struct DisplayVIew: View {
    var body: some View {
        Rectangle()
            .fill(.gray)
            .frame(width: 200, height: 100)
            .overlay(RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .frame(width: 180, height: 90)
            )
            .shadow(radius: 10)
    }
}

struct DisplayVIew_Previews: PreviewProvider {
    static var previews: some View {
        DisplayVIew()
    }
}
