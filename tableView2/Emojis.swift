//
//  Emojis.swift
//  tableView2
//
//  Created by Jorge MR on 10/01/18.
//  Copyright © 2018 jorge_a_mtz_r. All rights reserved.
//

import Foundation

struct Emoji {
    let figura : String
    let nombre : String
    var seleccionado : Bool = false
    
    init (figura : String, nombre : String){
        self.figura = figura
        self.nombre = nombre
    }
}
