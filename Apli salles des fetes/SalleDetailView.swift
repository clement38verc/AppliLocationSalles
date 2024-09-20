import SwiftUI

struct SalleDetailView: View {
    let salle: Salle
    
    var body: some View {
        ScrollView {
            ZStack{
                
                
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                
                VStack(alignment: .leading) {
                    
                    
                    
                    Text(salle.nom)
                        .font(.largeTitle)
                        .padding()
                    Image(salle.nom)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 280)
                        .clipped()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Text(salle.description)
                        .padding(.top)
                    
                    Text("\(salle.adresse.rue), \(salle.adresse.ville), \(salle.adresse.codePostal)")
                        .font(.subheadline)
                        .padding(.top, 5)
                    
                    Text("Capacité : \(salle.capacite) personnes")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                    
                    Text("Équipements :")
                        .font(.headline)
                        .padding(.top)
                    
                    ForEach(salle.equipements, id: \.self) { equipement in
                        Text("• \(equipement)")
                            .padding(.leading)
                    }
                    
                    Text("Horaires de Disponibilité :")
                        .font(.headline)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("Lundi : \(salle.horairesDisponibilite.lundi)")
                        Text("Mardi : \(salle.horairesDisponibilite.mardi)")
                        Text("Mercredi : \(salle.horairesDisponibilite.mercredi)")
                        Text("Jeudi : \(salle.horairesDisponibilite.jeudi)")
                        Text("Vendredi : \(salle.horairesDisponibilite.vendredi)")
                        Text("Samedi : \(salle.horairesDisponibilite.samedi)")
                        Text("Dimanche : \(salle.horairesDisponibilite.dimanche)")
                    }
                    .padding(.leading)
                    
                    Text("Tarifs :")
                        .font(.headline)
                        .padding(.top)
                    
                    Text("Jours de Semaine : \(salle.tarif.jourSemaine)€")
                    Text("Week-end : \(salle.tarif.weekend)€")
                        .padding(.leading)
                    
                    Text("Contacts :")
                        .font(.headline)
                        .padding(.top)
                    
                    Text("si vous souhaitez plus d'information pour une location, contacter le 0673293979")
                    
                    
                    
                    Spacer()
                }
                .padding()
        
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)

        
    }
    private var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.purple)
                Text("Retour")
                    .foregroundColor(.purple)
            }
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    
}
