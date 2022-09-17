//
//  ButtonView.swift
//  RandomPhoto
//
//  Created by Алексей Гайдуков on 17.09.2022.
//

import SwiftUI

struct ButtonView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        Button(action: {viewModel.fetchNewImage()}) {
            Text("Next image!")
                .bold()
                .frame(width: 250,height: 40)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
