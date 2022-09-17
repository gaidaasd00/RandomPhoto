//
//  ContentView.swift
//  RandomPhoto
//
//  Created by Алексей Гайдуков on 16.09.2022.
//

import SwiftUI
class ViewModel: ObservableObject {
    @Published var image: Image?
    func fetchNewImage() {
        guard let url = URL(string: "https://random.imagecdn.app/500/500") else { return }
        let task = URLSession.shared.dataTask(with: url) {[unowned self] data, _, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                guard  let uiImage = UIImage(data: data ) else { return }
                image = Image(uiImage: uiImage)
            }
        }
        task.resume()
    }
}


struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                if let image = viewModel.image {
                    ZStack {
                        image
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: 200, height: 200)
                        .padding()
                    }
                } else {
                    Image(systemName: "image")
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: 200, height: 200)
                        .padding()
                }
                    
                Spacer()
                    Button(action: {viewModel.fetchNewImage()}) {
                        Text("Next image!")
                            .bold()
                            .frame(width: 250,height: 40)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                
                    .padding()
            }
            .navigationTitle("Random Photo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
