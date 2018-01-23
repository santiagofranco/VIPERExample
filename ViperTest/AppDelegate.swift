//
//  AppDelegate.swift
//  ViperTest
//
//  Created by santi on 20/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Importante para que funcione la inyeccion de dependencias y por tanto todo el modulo de la lista
        let initialViewControler = ListWireframe.createModule()
        self.window?.rootViewController = initialViewControler
        self.window?.makeKeyAndVisible()
        return true
    }



}

