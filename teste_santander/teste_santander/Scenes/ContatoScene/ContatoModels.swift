//
//  ContatoModels.swift
//  teste_santander
//
//  Created by Osniel Lopes Teixeira on 23/04/2018.
//  Copyright (c) 2018 Osniel Lopes Teixeira. All rights reserved.
//

import UIKit

enum ContatoRequest {
    case form
}

enum ContatoResponse {
    case form([Cell])
}


enum ContatoViewModel {
    case form([Cell])
}

struct Cell: Decodable {
    var id: Int
    var type: Type
    var message: String
    var typefield: TypeField?
    var hidden: Bool
    var topSpacing: Double
    var show: Int?
    var required: Bool
}

enum Type: Int, Decodable {
    case field = 1, text, image, checkbox, send
}

enum TypeField: Int, Decodable {
    case text = 1, telNumber, email
}
