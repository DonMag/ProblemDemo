public struct MyLibrary {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

import UIKit

class MyLibraryVC: UIViewController {
	
	// let's confirm storyboard outlets / actions work
	
	@IBOutlet var mainLabel: UILabel!
	@IBOutlet var counterLabel: UILabel!
	
	var iTapCounter: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		mainLabel.text = "Text set in viewDidLoad()"
		counterLabel.text = "Tap Count: \(iTapCounter)"
		
	}
	
	@IBAction func gotTap(_ sender: Any?) {
		iTapCounter += 1
		counterLabel.text = "Tap Count: \(iTapCounter)"
	}
}
