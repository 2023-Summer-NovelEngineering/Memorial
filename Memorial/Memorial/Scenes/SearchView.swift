//
//  SearchView.swift
//  Memorial
//
//  Created by Agiss on 2023/07/12.
//

import SwiftUI

struct SearchView: View {
    
    // State Variable
    @State var searchText: String = ""
    @State var editText : Bool = false
    
    var body: some View {
        VStack {
            HStack{
                TextField("검색어를 넣어주세요", text: $searchText)
                    .padding(15)
                    .padding(.horizontal,15)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    .overlay(
                        HStack{
                            Spacer()
                            if self.editText {
                                Button(action: {
                                    self.editText = false
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(Color(.black))
                                        .padding()
                                }
                            } else {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color(.black))
                                    .padding()
                            }
                        }
                    ).onTapGesture {
                        self.editText = true
                    }
            }
            .padding()
            Spacer()
        }
        .padding(.top,300)
    }
}
