//
//  MyData.swift
//  FormTableView
//
//  Created by Le Manh on 8/13/20.
//  Copyright © 2020 Le Manh. All rights reserved.
//

import Foundation
class PersonModel {
    var title = ""
    var subtitle = ""
    
    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
}

class SettingModel {
    var header = ""
    var title = ""
    var subtitle = ""
    
    init(header: String, title: String, subtitle: String) {
        self.header = header
        self.title = title
        self.subtitle = subtitle
    }
}

class SectionModel {
    var person: PersonModel?
    var items = [SettingModel]()
    
    init(person: PersonModel?, items: [SettingModel]) {
        self.person = person
        
        self.items = items
    }
    
    class func getList() -> [SectionModel] {
        return [
            SectionModel(person: PersonModel(title: "Mini Form", subtitle: "Mini form groups mutil is one page"), items: [
                SettingModel(header: "Basic information", title: "", subtitle: ""),
                SettingModel(header: "", title: "Blood type", subtitle: "B+"),
                SettingModel(header: "", title: "Date of Birt", subtitle: "02/01/1999"),
                SettingModel(header: "", title: "Weight", subtitle: "165 lb"),
            ]),
            SectionModel(person: nil, items: [
                SettingModel(header: "Do you want a headache ? ", title: "", subtitle: ""),
                SettingModel(header: "", title: "Yes", subtitle: ""),
                SettingModel(header: "", title: "NO", subtitle: ""),
            ])
        ]
    }
}

