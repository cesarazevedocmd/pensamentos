//
//  Configuration.swift
//  Pensamentos
//
//  Created by César Alves de Azevedo on 17/11/20.
//

import Foundation

enum UserDefaultsKey: String{
    case refreshAutomatic = "refresh_automatic"
    case timeRefresh = "time_refresh"
    case schemeColor = "scheme_color"
}

class Configuration{
    
    static let shared = Configuration()
    let config: UserDefaults = UserDefaults.standard
    
    private init(){
        if timeRefresh == 0.0 {
            timeRefresh = 8.0
        }
    }
    
    var refreshAutimatic : Bool{
        get{
            return config.bool(forKey: UserDefaultsKey.refreshAutomatic.rawValue)
        }
        set{
            config.set(newValue, forKey: UserDefaultsKey.refreshAutomatic.rawValue)
        }
    }
    
    var timeRefresh : Double{
        get{
            return config.double(forKey: UserDefaultsKey.timeRefresh.rawValue)
        }
        set{
            config.set(newValue, forKey: UserDefaultsKey.timeRefresh.rawValue)
        }
    }
    
    var schemeColor : Int{
        get{
            return config.integer(forKey: UserDefaultsKey.schemeColor.rawValue)
        }
        set{
            config.set(newValue, forKey: UserDefaultsKey.schemeColor.rawValue)
        }
    }
    
}
