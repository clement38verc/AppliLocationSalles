import Foundation


class SalleData: ObservableObject {
    @Published var salles: [Salle] = []
    
    init() {
        load()
    }
    
    func load() {
        guard let url = Bundle.main.url(forResource: "Salles_de_fetes", withExtension: "json") else {
            print("Fichier JSON non trouvé")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(SallesResponse.self, from: data)
            self.salles = decodedData.salles
        } catch {
            print("Erreur lors du chargement des données : \(error)")
        }
    }
}


// MARK: - SallesResponse
struct SallesResponse: Codable {
    let salles: [Salle]
}

// MARK: - Salle
struct Salle: Codable, Identifiable {
    let id: Int
    let nom: String
    let adresse: Adresse
    let capacite: Int
    let equipements: [String]
    let horairesDisponibilite: HorairesDisponibilite
    let tarif: Tarif
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id, nom, adresse, capacite, equipements, description
        case horairesDisponibilite = "horaires_disponibilite"
        case tarif
    }
}

// MARK: - Adresse
struct Adresse: Codable {
    let rue: String
    let ville: String
    let codePostal: String
    
    enum CodingKeys: String, CodingKey {
        case rue, ville
        case codePostal = "code_postal"
    }
}

// MARK: - HorairesDisponibilite
struct HorairesDisponibilite: Codable {
    let lundi: String
    let mardi: String
    let mercredi: String
    let jeudi: String
    let vendredi: String
    let samedi: String
    let dimanche: String
}

// MARK: - Tarif
struct Tarif: Codable {
    let jourSemaine: Int
    let weekend: Int
    
    enum CodingKeys: String, CodingKey {
        case jourSemaine = "jour_semaine"
        case weekend
    }
}

