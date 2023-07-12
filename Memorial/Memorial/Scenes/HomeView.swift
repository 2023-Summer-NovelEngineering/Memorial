//
//  HomeView.swift
//  Memorial
//
//  Created by Agiss on 2023/07/12.
//

import SwiftUI

struct HomeView: View {
    @State private var offsetY: CGFloat = CGFloat.zero
    
    @State var isPresented = false
    
    var body: some View {
        NavigationView() {
            ZStack(alignment: .topLeading) {
                
                ScrollView {
                    GeometryReader { geometry in
                    let offset = geometry.frame(in: .global).minY
//
                    ZStack {
                        Image("Sewol")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.top)
                        Text("세월호 참사후 \n19083일이 지났습니다.")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 80, trailing: 200))
                            .foregroundColor(.white)
                        NavigationLink(destination: DetailView()){
                            Text("공감하러 가기")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 265))
                                .foregroundColor(.white)
                        }
                    }.frame(
                        width: geometry.size.width,
                        height: 304 + (offset > 0 ? offset : 0)
                    ).offset(y: (offset > 0 ? -offset : 0))
                        setOffset(offset: offset)
                        
                }
                    VStack {
                        MainView()
                    }.padding(EdgeInsets(top: 375, leading: 6, bottom: 0, trailing: 0))
                     
                }
                .overlay(
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                                .edgesIgnoringSafeArea(.all)
                                .opacity(offsetY > -250 ? 0 : 1)
                            , alignment: .top
                        )

            }
        }.navigationBarBackButtonHidden(true)
    }
    func setOffset(offset: CGFloat) -> some View {
            DispatchQueue.main.async {
                self.offsetY = offset
            }
            return SearchView()
        }
//    func setOffset2(offset: CGFloat) -> some View {
//            DispatchQueue.main.async {
//                self.offsetY = offset+1000
//            }
//            return MainView()
//        }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

