//
//  ContentView.swift
//  Memorial
//
//  Created by Agiss on 2023/07/12.
//

import SwiftUI

struct loginView: View {
    
    @State var writeid = ""
    @State var writepw = ""
    
    var body: some View {
        NavigationView() {
            VStack{
                Text("Memorial")
                    .padding([.top, .trailing], 100)
                    .fontWeight(.bold)
                    .font(.system(size: 35))
                Text("당신의 이야기를 기억합니다.")
                    .fontWeight(.ultraLight)
                    .font(.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 130, trailing: 30))
                VStack{
                    Text("아이디")
                        .padding(.trailing,290)
                    TextField("아이디를 입력하세요", text: $writeid)
                        .padding(.horizontal,30)
                        .fontWeight(.light)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(.bottom,20)
                VStack{
                    Text("비밀번호")
                        .padding(.trailing,280)
                    SecureField("비밀번호를 입력하세요", text: $writepw)
                        .padding(.horizontal,30)
                        .fontWeight(.light)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(.bottom,80)
                NavigationLink(destination: HomeView()) {
                        Text("로그인")
                            .frame(width: 300, height: 10)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .buttonStyle(.automatic)
                            .cornerRadius(15)
                    
                }
                NavigationLink(destination: MemberView()) {
                    Text("회원가입")
                        .padding(EdgeInsets(top: 0, leading: 250, bottom: 0, trailing: 0))
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom, 100)
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}
