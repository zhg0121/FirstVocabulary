//
//  VocaTableViewCell.swift
//  MxoVocabulary
//
//  Copyright © 2017年 ＭxoStudio. All rights reserved.
//
import Foundation
class Voca {
    
    var eName = ""
    var cName = ""
    var phonetic = ""
    var img = ""
    
    init(eName: String , cName: String , phonetic: String , img: String ) {
        self.cName = cName
        self.eName = eName
        self.phonetic = phonetic
        self.img = img
    }
}
