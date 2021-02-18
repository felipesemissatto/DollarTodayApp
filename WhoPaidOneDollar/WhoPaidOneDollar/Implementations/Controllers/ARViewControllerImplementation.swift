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
    private var boxAnchor = Experience.Bill()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "One Dollar Bill"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Load the "Box" scene from the "Experience" Reality File
        boxAnchor = try! Experience.loadBill()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
      
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        arView.scene.removeAnchor(boxAnchor)
    }
}
