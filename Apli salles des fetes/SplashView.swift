import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        Group {
            if isActive {
                ContentView()
                    .transition(.scale(scale: 100, anchor: .center))
            } else {
                ZStack {
                    
                    Image("espacefond")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Image("espacelogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                            
                        
                        Text("Planet Rooms")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            
                        
                    }
                    .edgesIgnoringSafeArea(.all)  // Ignore les zones sûres pour étendre l'arrière-plan
                }
                .onAppear {
                    // Attendre 2 secondes avant de changer la vue
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            
                            self.isActive = true
                        }
                    }
                }
            }
        }
        
    }
}
