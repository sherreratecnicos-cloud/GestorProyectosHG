import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Gestor Proyectos HG")
                    .font(.largeTitle)
                    .bold()
                Text("App plantilla SwiftUI — Hello World")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding()
            .navigationTitle("Inicio")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
