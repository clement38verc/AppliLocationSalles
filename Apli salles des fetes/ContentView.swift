import SwiftUI

struct ContentView: View {
    
    @StateObject var salleData = SalleData()
    @State private var villeInput: String = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topTrailing) {
                
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple, Color.white]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        Image("espacelogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.2))
                                .frame(height: 40)
                                .shadow(radius: 5)
                            
                            
                            TextField("Entrez une ville", text: $villeInput)
                                .padding(.horizontal)
                                .foregroundColor(.purple)
                        }
                        .padding(.horizontal)
                        
                        
                        LazyVGrid(columns: columns, spacing: 25) {
                            
                            ForEach(filteredSalles) { salle in
                                NavigationLink(destination: SalleDetailView(salle: salle)) {
                                    VStack {
                                        Text(salle.nom)
                                            .font(.system(size: 13))
                                            .fontWeight(.bold)
                                        
                                        Text(salle.adresse.ville)
                                            .font(.system(size: 12))
                                            .foregroundColor(.secondary)
                                        
                                        Image(salle.nom)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 150, height: 100)
                                            .clipped()
                                            .cornerRadius(10)
                                            .shadow(radius: 5)
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 30)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
   
    var filteredSalles: [Salle] {
        if villeInput.isEmpty {
            return salleData.salles
        } else {
            return salleData.salles.filter { $0.adresse.ville.lowercased().contains(villeInput.lowercased()) }
        }
    }
}
