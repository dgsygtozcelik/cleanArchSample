//
//  ProductCell.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import SwiftUI

struct ProductCell: View {
    
    let data: ProductViewObject
    
    var body: some View {
        
        HStack {
            
            AsyncImage(url: URL(string: data.imageURL))
            
            VStack (alignment: .leading){
                
                Text(data.name)
                    .bold()
                Text(data.longDescription)
                    .lineLimit(2)
                
                Spacer()
                    .frame(height: 12)
                
            }
            
            Spacer()
        }
        .padding()
        .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 1)
            )
        
    }
}

//struct ProductCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCell(data: ProductViewObject(name: <#T##String#>, type: <#T##String#>, id: <#T##Int#>, color: <#T##String#>, imageURL: <#T##String#>, colorCode: <#T##String#>, available: <#T##Bool#>, releaseDate: <#T##Double#>, description: <#T##String#>, longDescription: <#T##String#>, rating: <#T##Double#>, price: <#T##String#>))
//    }
//}
