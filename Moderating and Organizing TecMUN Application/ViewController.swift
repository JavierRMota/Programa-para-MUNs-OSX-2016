import Cocoa
import Foundation

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    var timer = NSTimer()
    var sptime = 60
    var counter = 60
    var m = 1
    var s=0
    var ss=1
    var cc=1
    
    @IBOutlet var Committee: NSTextField!
    @IBOutlet var President: NSTextField!
    @IBOutlet var Topic: NSTextField!
    @IBOutlet var NSP: NSTextField!
    @IBOutlet var SpeakerNOW: NSTextField!
    @IBOutlet var Lista: NSTableView!
    var listapa: NSMutableArray! = NSMutableArray()
    @IBOutlet var SpeakCombo: NSComboBox!
    @IBOutlet var Estado: NSTextField!
    @IBOutlet var MinutesText: NSTextField!
    @IBOutlet var SecondsText: NSTextField!
    @IBOutlet var Seconds: NSTextField!
    @IBOutlet var Count: NSTextField!
    
   

    @IBAction func Start(sender: AnyObject) {
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("update"), userInfo: nil, repeats: true)
        Estado.stringValue = "Speaker's List"
        SpeakerNOW.stringValue = listapa.objectAtIndex(0) as! String
        NSP.stringValue = "Now Speaking:"
    }
    @IBAction func CTOP(sender: AnyObject) {
        if (self.Topic.stringValue == SharingManager.sharedInstance.TopicA){
            
            self.Topic.stringValue = SharingManager.sharedInstance.TopicB
        }
        else
        {
            self.Topic.stringValue = SharingManager.sharedInstance.TopicA
        }
    
    }
    
    @IBAction func Stop(sender: AnyObject) {
        timer.invalidate()
        Estado.stringValue = "Speaker's List"
        NSP.stringValue = ""
        SpeakerNOW.stringValue = ""
        counter = sptime
        Count.stringValue = String(Int(counter/60))
        Seconds.stringValue = String(counter % 60)
        ss = Seconds.stringValue.characters.count
        cc = Count.stringValue.characters.count
        if (cc < 2){
            
            Count.stringValue = "0" + Count.stringValue
        }
        if (ss < 2) {
            Seconds.stringValue = "0" + Seconds.stringValue
        }

    }
    @IBAction func ChangeT(sender: AnyObject) {
        m = Int (MinutesText.stringValue)!
        s = Int (SecondsText.stringValue)!
        sptime = (m)*60+(s)
        counter = sptime
        Count.stringValue = String(Int(counter/60))
        Seconds.stringValue = String(counter % 60)
        ss = Seconds.stringValue.characters.count
        cc = Count.stringValue.characters.count
        if (cc < 2){
            
            Count.stringValue = "0" + Count.stringValue
        }
        if (ss < 2) {
            Seconds.stringValue = "0" + Seconds.stringValue
        }
        
        
        
    }
    
    @IBAction func Reset(sender: AnyObject) {
        timer.invalidate()
        counter = sptime
        NSP.stringValue = ""
        SpeakerNOW.stringValue = ""
        Count.stringValue = String(Int(counter/60))
        Seconds.stringValue = String(counter % 60)
        ss = Seconds.stringValue.characters.count
        cc = Count.stringValue.characters.count
        if (cc < 2){
            
            Count.stringValue = "0" + Count.stringValue
        }
        if (ss < 2) {
            Seconds.stringValue = "0" + Seconds.stringValue
        }
        Estado.stringValue = "Speaker's List"
    }
    //speaker
    
    
    @IBAction func AddSpeaker(sender: AnyObject) {
         if (SpeakCombo.stringValue == ""){
        }
        else {
        self.listapa.addObject(SpeakCombo.stringValue)
        self.Lista.reloadData()
            }
    }
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return self.listapa.count
    }
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cellView = Lista.makeViewWithIdentifier("cell", owner: self) as! NSTableCellView
        cellView.textField?.stringValue = self.listapa.objectAtIndex(row) as! String
        return cellView
        
    }
    @IBAction func RemoveSpeaker(sender: AnyObject) {
        listapa.removeObjectAtIndex(Lista.selectedRow)
        Lista.reloadData()
    }
    
    //Caucus
    @IBAction func Moderated(sender: AnyObject) {
        m = Int (MinutesText.stringValue)!
        s = Int (SecondsText.stringValue)!
        counter = (m)*60+(s)
        Count.stringValue = String(Int(counter/60))
        Seconds.stringValue = String(counter % 60)
        ss = Seconds.stringValue.characters.count
        cc = Count.stringValue.characters.count
        if (cc < 2){
            
            Count.stringValue = "0" + Count.stringValue
        }
        if (ss < 2) {
            Seconds.stringValue = "0" + Seconds.stringValue
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("update"), userInfo: nil, repeats: true)
        Estado.stringValue = "Moderated Caucus"
        NSP.stringValue = ""
        SpeakerNOW.stringValue = ""
    }
    
    
    @IBAction func Simple(sender: AnyObject) {
        m = Int (MinutesText.stringValue)!
        s = Int (SecondsText.stringValue)!
        counter = (m)*60+(s)
        Count.stringValue = String(Int(counter/60))
        Seconds.stringValue = String(counter % 60)
        ss = Seconds.stringValue.characters.count
        cc = Count.stringValue.characters.count
        if (cc < 2){
            
            Count.stringValue = "0" + Count.stringValue
        }
        if (ss < 2) {
            Seconds.stringValue = "0" + Seconds.stringValue
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("update"), userInfo: nil, repeats: true)
        Estado.stringValue = "Simple Caucus"
        NSP.stringValue = ""
        SpeakerNOW.stringValue = ""
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Count.stringValue = String(Int(counter/60))
        Seconds.stringValue = String(counter % 60)
        ss = Seconds.stringValue.characters.count
        cc = Count.stringValue.characters.count
        if (cc < 2){
            
            Count.stringValue = "0" + Count.stringValue
        }
        if (ss < 2) {
            Seconds.stringValue = "0" + Seconds.stringValue
        }
        
        Estado.stringValue = "Speaker's List"
        NSP.stringValue = ""
        SpeakerNOW.stringValue = ""
        self.view.wantsLayer = true
        
    }
    
    
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let image = NSImage(named:"background.png")
            //let color : CGColorRef = CGColorCreateGenericRGB(0.2, 0.2, 0.2, 0.5)
            //self.view.layer?.backgroundColor = color
            self.view.layer?.contents = image
        }
        
    }
    func update () {
        counter--
        
        
        Count.stringValue = String(Int(counter/60))
        Seconds.stringValue = String(counter % 60)
        ss = Seconds.stringValue.characters.count
        cc = Count.stringValue.characters.count
        if (cc < 2){
            
            Count.stringValue = "0" + Count.stringValue
        }
        if (ss < 2) {
            Seconds.stringValue = "0" + Seconds.stringValue
        }
        if(counter == 0)  {
            timer.invalidate()
            counter = sptime
            Count.stringValue = String(Int(counter/60))
            Seconds.stringValue = String(counter % 60)
            ss = Seconds.stringValue.characters.count
            cc = Count.stringValue.characters.count
            if (cc < 2){
                
                Count.stringValue = "0" + Count.stringValue
            }
            if (ss < 2) {
                Seconds.stringValue = "0" + Seconds.stringValue
            }
            
            
        }
    }
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    @IBAction func LoadInfo(sender: AnyObject) {
        self.President.stringValue = SharingManager.sharedInstance.President
        self.Committee.stringValue = SharingManager.sharedInstance.Committee
        self.Topic.stringValue = SharingManager.sharedInstance.TopicA
        self.SpeakCombo.addItemsWithObjectValues(SharingManager.sharedInstance.data as [AnyObject])
    }
    
    
}

