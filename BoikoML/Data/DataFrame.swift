//
//  DataFrame.swift
//  BoikoML
//
//  Created by Luis Eduardo Boiko Ferreira on 12/06/2018.
//  Copyright © 2018 Luis Eduardo Boiko Ferreira. All rights reserved.
//

import Foundation

public class DataFrame {
    
    private var inputData : [[CustomStringConvertible]]
    private var data: [Int: [Double]] = [:]
    private var header : Header
    
    public init(inputData: [[CustomStringConvertible]], header: Header) {
        self.inputData = inputData
        self.header = header
        self.populateDataFrame()
    }
    
    private func populateDictKeys() {
        for i in 0..<self.inputData[0].count {
            self.data[i] = []
        }
    }
    
    private func populateDataFrame() {
        self.populateDictKeys()
        for instance in self.inputData {
            for i in 0..<instance.count {
                self.data[i]!.append(Double(instance[i].description)!)
            }
        }
//        print(array)
    }
    
    public func showDf() -> [Int: [Double]] {
        return self.data
    }
    
    public func rowAtIndex(index : Int) -> [Double] {
        var instance : [Double] = []
        for key in self.data.keys.sorted() {
            instance.append(data[key]![index])
        }
        
        return instance
    }
    
}
