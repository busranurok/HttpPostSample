//
//  SendMessage.swift
//  HttpPostSample
//
//  Created by Yeni Kullanıcı on 21.09.2020.
//  Copyright © 2020 Busra Nur OK. All rights reserved.
//

import Foundation

struct RequestModel: Codable
{
        var id : Int?
        var name : String
        var surname : String
    
}


struct ResponseModel: Codable
{
    var HasanBusrayiNeKadarSeviyor : String
    var HasanBusrayaAsikMi : Bool
    
}
