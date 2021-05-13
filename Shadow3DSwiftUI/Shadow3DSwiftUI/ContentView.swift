//
//  ContentView.swift
//  Shadow3DSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 13/05/21.
//  The App Wizard
//  Instagram : theappwizard2408
//
import SwiftUI



struct ContentView: View {
    var body: some View {
        FinalView()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

































struct FinalView: View {
    
    @State var shadowscale = false
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [.pink, .red]), center: .center, startRadius: 2, endRadius: 650).opacity(0.5).edgesIgnoringSafeArea(.all)
            
            CombineView()
            
            Ellipse()
                .opacity(0.06)
                .frame(width:  300, height: 65, alignment: .center)
                .offset(x: shadowscale ? 20 : -20, y: 200)
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.shadowscale.toggle()
                    }
            
            VStack{
                Image("shadowtitle").opacity(0.2).offset(x: -20, y: 10)
                Spacer()
                
                Image("name").opacity(0.2)
                    .padding()
               
                
               }
        
           }
        }
    }
//








struct CombineView: View {
    
    @State var rotateanim  = false
    
    var body: some View {
        ZStack{
            Shadow3D().rotationEffect(.degrees(rotateanim ? -35 : 35))
                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.rotateanim.toggle()
                    }
            
            
            
        }.shadow(color: .pink, radius: 10, x: 0.0, y: 0.0)
        
    }
}






struct Shadow3D: View {
    
    @State var shadowanim  = false
    
    var body: some View {
        
        
        Image("shadow")
            .resizable()
            .frame(width: 300, height: 300, alignment: .center)
            .offset(x: shadowanim ? 10 : -10, y: shadowanim ? -10 : 10)
        
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.shadowanim.toggle()
            }

        Image("colorback")
            .resizable()
            .frame(width: 300, height: 300, alignment: .center)
        
        
        
        ZStack{
            
            HStack{
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 120, height: 100, alignment: .center)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
                
                Spacer().frame(width: 25, height: 10, alignment: .center)
                
            Text("1").font(.system(size: 100, weight: .regular, design: .default))
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
               
            }.offset(x: 0, y: -15)
        }
    }
}
