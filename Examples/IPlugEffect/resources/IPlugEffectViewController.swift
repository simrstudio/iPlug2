/*
  This is the initial ios app extension view controller, which is referenced by IPlugEffect-iOS-MainInterface storyboard
*/

import UIKit
import CoreAudioKit

public class IPlugEffectViewController: AUViewController {
  @IBOutlet weak var customView: UIView!
  
  public var audioUnit: IPlugAUAudioUnit? {
    // this variable gets set when loading in stand-alone app, not when loaded by a host
    didSet {
      DispatchQueue.main.async {
        if self.isViewLoaded {
          self.connectViewWithAU()
        }
      }
    }
  }
  
  // this is where it happens when auv3 is loaded by a host
  override public func viewDidLoad() {
    super.viewDidLoad()
    
    guard audioUnit != nil else { return }

    connectViewWithAU()
  }
  
  override public func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func connectViewWithAU() {
    // TODO: load and attach iGraphics subview
    guard let paramTree = audioUnit?.parameterTree else { return }
    
  }
}
