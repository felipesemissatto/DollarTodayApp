//
//  ARViewControllerImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 18/02/21.
//

import Foundation
import UIKit
import RealityKit

class ARViewControllerImplementation: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var arView: ARView!
    
    
    // MARK: - Private Variables
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "One Dollar Bill"

        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBill()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
      
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
