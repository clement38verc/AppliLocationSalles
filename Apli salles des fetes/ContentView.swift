import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("backgroundImage") // Remplacez "backgroundImage" par le nom de votre image
                .resizable() // Rend l'image redimensionnable
                .scaledToFill() // Ajuste l'image pour remplir l'écran
                .edgesIgnoringSafeArea(.all) // Ignore les marges de sécurité pour que l'image couvre toute la surface
            
            VStack {
                // Titre principal de l'application
                Text("PlanetRooms")
                    .font(.largeTitle)  // Taille du texte
                    .fontWeight(.bold)  // Poids du texte
                    .foregroundColor(.blue)  // Couleur du texte
                    .padding()  // Espace autour du texte
                    .background(Color.white) // Couleur de fond du texte
                    .cornerRadius(10)  // Bord arrondi de l'arrière-plan
                    .shadow(radius: 7)  // Ombre autour du texte
                
            }
            .padding()  // Espace autour du VStack
            //.background(Color(white: 0.95))  // Couleur de fond du VStack
            .edgesIgnoringSafeArea(.all)  // Ignore les zones sûres pour étendre l'arrière-plan
        }
    }
    
    
}
