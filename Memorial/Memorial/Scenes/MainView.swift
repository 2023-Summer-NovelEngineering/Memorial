//
//  MainView.swift
//  Memorial
//
//  Created by Agiss on 2023/07/12.
//

import SwiftUI

struct Dummy: Codable, Hashable {
    var imageName:String?
    var text:String?
}



struct dumView: View {
    var tempDum:Dummy
    var body: some View {
                Image(tempDum.imageName!)
                    .frame(width: 300, height: 200)
                    .cornerRadius(25)
                Text(tempDum.text!)
                
    }
}

struct MainView: View {
    var dumList:[Dummy] = [
        Dummy(imageName:"Sewol", text:"세월호 참사 이후"),
        Dummy(imageName:"Sewol", text:"기억 합니다."),
        Dummy(imageName:"Sewol", text:"🎗️고인의 명복을 빕니다."),
        Dummy(imageName:"Sewol", text:"그 날의 참사."),
        Dummy(imageName:"Sewol", text:"아직도 그립습니다."),
        Dummy(imageName:"Sewol", text:"거긴 편안하신가요?"),
    ]
    var body: some View {
        
        
        ForEach(dumList, id:\.self) {dumLists in
                dumView(tempDum: dumLists)
                
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
