//
//  Recipe.swift
//  Recipe
//
//  Created by Lara Tenore on 12/04/20.
//  Copyright © 2020 Lara Tenore Ferreira. All rights reserved.
//

import UIKit

class Recipe: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        
        if let titleEncoded = title {
            coder.encode(titleEncoded, forKey: "title")
        }
        
        if let contentEncoded = content {
            coder.encode(contentEncoded, forKey: "content")
        }
    }
    
    required init?(coder: NSCoder) {
        
        if let titleDecoded = coder.decodeObject(forKey: "title") as? String{
            title = titleDecoded
        }
        
        if let contentDecoded = coder.decodeObject(forKey: "content") as? String{
            content = contentDecoded
        }
    }
    
    var title: String?
    var content: String?
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }

    override init() {
        super.init()
    }
}
