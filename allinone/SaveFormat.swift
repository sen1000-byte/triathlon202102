//
//  SaveFormat.swift
//  allinone
//
//  Created by Chihiro Nishiwaki on 2021/02/15.
//

import Foundation
import RealmSwift

class  saveFormat: Object {
    //Realmの　saveFormat という名前のところに保存できる場所を作った
    @objc dynamic var name: String = ""
    @objc dynamic var score: Int = 0
    @objc dynamic var iconImage: String = ""
}
