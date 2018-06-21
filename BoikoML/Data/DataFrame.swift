//
//  DataFrame.swift
//  BoikoML
//
//  Created by Luis Eduardo Boiko Ferreira on 12/06/2018.
//  Copyright © 2018 Luis Eduardo Boiko Ferreira. All rights reserved.
//

import Foundation

public class DataFrame<T> {
    
    private var inputData : [[T]]
    private var data: [Int: [Double]] = [:]
    private var header : Header<Any>
    private var metaAttributeIndex : Int
    
    public init(inputData: [[T]], header: Header<Any>, metaAttributeIndex : Int) {
        self.inputData = inputData
        self.header = header
        self.metaAttributeIndex = metaAttributeIndex
        self.populateDataFrame()
    }
    
    // MARK: Internal functions
    
    private func populateDictKeys() {
        for i in 0..<self.inputData[0].count {
            self.data[i] = []
        }
    }
    
    private func populateDataFrame() {
        self.populateDictKeys()
        for instance in self.inputData {
            for i in 0..<instance.count {
                if instance[i] is Int {
                    self.data[i]!.append(Double(instance[i] as! Int))
                } else {
                    self.data[i]!.append(instance[i] as! Double)
                }
            }
        }
    }
    
    // MARK: Meta attribute related
    
    public func getMetaName(index: Int) -> String {
        return self.header.featureNameAtIndex(index: index)
    }
    
    public func getMetaIndex() -> Int {
        return self.metaAttributeIndex
    }
    
    // MARK: Utils
    
    public func getPossibleValues(key : Int) -> [AnyHashable : Int] {
        return NSCountedSet(array: Array(self.data[key]!)).dictionary
    }
    
    public func getHeader() -> [Feature<Any>] {
        return self.header.header()
    }
    
    public func rowAtIndex(index : Int) -> [Double] {
        var instance : [Double] = []
        for key in self.data.keys.sorted() {
            instance.append(data[key]![index])
        }
        return instance
    }
    
    public func showDf() -> [Int: [Double]] {
        return self.data
    }
    
}


