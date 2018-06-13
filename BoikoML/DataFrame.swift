//
//  DataFrame.swift
//  BoikoML
//
//  Created by Luis Eduardo Boiko Ferreira on 12/06/2018.
//  Copyright © 2018 Luis Eduardo Boiko Ferreira. All rights reserved.
//

import Foundation

public class DataFrame {
    
    private var data: [Int: [Double]]
    private var header : Header
    
    init(data: [Int: [Double]], header: Header) {
        self.data = data
        self.header = header
    }
    
    public func rowAtIndex(index : Int) -> [Double] {
        var instance : [Double] = []
        for key in self.data.keys {
            instance.append(data[key]![index])
        }
        
        return instance
    }
    
}
