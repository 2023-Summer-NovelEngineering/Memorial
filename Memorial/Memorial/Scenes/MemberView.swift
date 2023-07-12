//
//  MemberView.swift
//  Memorial
//
//  Created by Agiss on 2023/07/12.
//

import SwiftUI
import Alamofire

//struct param {
//    var member_id:String?
//    var name:String?
//    var passwd:String?
//}

struct MemberView: View {
    
    @State var writenm = ""
    @State var writeid = ""
    @State var writepw = ""
    @State var writepwck = ""
    
    
    func sendRegister() {
        debugPrint(writepw)
        let url="http://172.20.10.3:8081"
//        param(member_id: writeid, name: writenm, passwd: writepw)
        
        let param = [
            "member_id": writeid,
            "name": writenm,
            "passwd": writepw
        ] as [String : Any]
        AF.request(url + "/members/register", method: .post, parameters: param, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
            }
    }
    var body: some View {
        VStack{
            Text("Memorial")
                .padding([.top, .trailing], 100)
                .fontWeight(.bold)
                .font(.system(size: 35))
            Text("당신의 이야기를 기억합니다.")
                .fontWeight(.ultraLight)
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 30))
            VStack{
                Text("이름")
                    .padding(.trailing,290)
                TextField("이름을 입력하세요", text: $writenm)
                    .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 0))
                    .fontWeight(.light)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            .padding(.bottom,30)
            VStack{
                Text("아이디")
                    .padding(.trailing,290)
                TextField("아이디를 입력하세요", text: $writeid)
                    .padding(.horizontal,30)
                    .fontWeight(.light)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            .padding(.bottom,50)
            VStack{
                Text("비밀번호")
                    .padding(.trailing,280)
                SecureField("비밀번호를 입력하세요", text: $writepw)
                    .padding(.horizontal,30)
                    .fontWeight(.light)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            .padding(.bottom,20)
            VStack{
                Text("비밀번호 확인")
                    .padding(.trailing,245)
                SecureField("비밀번호를 입력하세요", text: $writepwck)
                    .padding(.horizontal,30)
                    .fontWeight(.light)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            .padding(.bottom,80)
        }
        VStack {
            Button(action: sendRegister) {
                Text("완료")
                    .frame(width: 300, height: 10)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .buttonStyle(.automatic)
                    .cornerRadius(15)
            }
        }
        .padding(.bottom, 100)
    }
}
