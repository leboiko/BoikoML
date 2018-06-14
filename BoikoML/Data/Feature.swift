//
//  Feature.swift
//  BoikoML
//
//  Created by Luis Eduardo Boiko Ferreira on 13/06/2018.
//  Copyright © 2018 Luis Eduardo Boiko Ferreira. All rights reserved.
//

import Foundation

enum Dtype {
    case nominal
    case numeric
}

public class Feature {
    
    private var index : Int
    private var featureName : String
    private var dType : Dtype
    
    init(index : Int, featureName : String, dType : Dtype) {
        self.index = index
        self.featureName = featureName
        self.dType = dType
    }
    
    public func getIndex() -> Int {
        return self.index
    }
    
    public func getName() -> String {
        return self.featureName
    }
}
