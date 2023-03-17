//
//  BaseModel.swift
//  NEWZIA
//
//  Created by Abo Saleh on 17/03/2023.
//

struct BaseModel: Decodable {
    
    let status : String?
    let code : String?
    let message : String?
    let totalResults : Int?
    let articles : [ArticlesModel]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case code = "code"
        case message = "message"
        case totalResults = "totalResults"
        case articles = "articles"
    }

}
