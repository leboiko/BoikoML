//
//  readCsv.swift
//  BoikoML
//
//  Created by Luis Eduardo Boiko Ferreira on 12/06/2018.
//  Copyright © 2018 Luis Eduardo Boiko Ferreira. All rights reserved.
//

import Foundation

public class ReadCsv {
    
    private var path : URL!
    private var separator : String
    private var data : [[CustomStringConvertible]] = [[]]
    
    public init(path : URL, separator : String) {
        self.path = path
        self.separator = separator
        try! self.readCsv(url: self.path)
    }
    
    public func readCsv(url: URL) throws {
        let csvData = try String(contentsOfFile: url.path)
        self.parseCsv(csvData: csvData)
        self.integrityCheck()
    }
    
    public func parseCsv(csvData : String) {
        self.data = csvData
            .components(separatedBy: "\n")
            .map({ // Step 1
                $0.components(separatedBy: self.separator)
                    .map({ // Step 2
                        if let int = Int($0) {
                            return int
                        } else if let double = Double($0) {
                            return double
                        }
                        return $0
                    })
            })
    }
    
    private func integrityCheck() {
        var line : Int = 0
        var priorCount : Int = 0
        for instance in self.data {
            if priorCount == 0 {
                priorCount = instance.count
            } else {
                if instance.count != priorCount {
                    if instance.count == 1 {
                        self.data.remove(at: line)
                    } else {
                        print("Integrity test failed at line \(line)!") //TODO: handle the error
                        print(self.data[line])
                        print(priorCount, instance.count)
                    }
                }
            }
            line += 1
            
        }
    }
    
    
    
    public func shape() -> [Int] {
        return [self.data.count, self.data[0].count]
    }
    
    public func getData() -> [[CustomStringConvertible]] {
        return self.data
    }
    
    //    MARK: DataFrame
    
    public func getCsvHeader() -> [Feature<Any>] {
        var features : [Feature<Any>] = [] as! [Feature]
        var counter = 0
        
        for feature in self.data[0] { // Assuming it is ordered
//            var internalDType : Dtype
//            if self.nominalFeatures.keys.contains(feature.description){
//                internalDType = .nominal
//            } else {
//                internalDType = .numeric
//            }
            features.append(Feature(index: counter, featureName: feature.description, dType: .numeric))
            counter += 1
        }
        self.data.remove(at: 0)
        return features
    }
    
    
}
