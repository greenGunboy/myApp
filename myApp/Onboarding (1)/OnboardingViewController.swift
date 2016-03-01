import UIKit
class OnboardingController: UIViewController, UIScrollViewDelegate {
//	let backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
	let slides = [
		["text": "aaaaaaa"],
		["text": "bbbbbbbb"],
		["text": "cccccccc"],
	]
	let screen: CGRect = UIScreen.mainScreen().bounds
	var scroll: UIScrollView?
	var dots: UIPageControl?
	override func viewDidLoad() {
		super.viewDidLoad()
		scroll = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: screen.width, height: screen.height * 0.9))
		scroll?.showsHorizontalScrollIndicator = false
		scroll?.showsVerticalScrollIndicator = false
		scroll?.pagingEnabled = true
		view.addSubview(scroll!)
		if (slides.count > 1) {
			dots = UIPageControl(frame: CGRect(x: 0.0, y: screen.height * 0.875, width: screen.width, height: screen.height * 0.05))
			dots?.numberOfPages = slides.count
			view.addSubview(dots!)
		}
		for var i = 0; i < slides.count; ++i {
			if let text = slides[i]["text"] {
				let textView = UITextView(frame: CGRect(x: screen.width * 0.05 + CGFloat(i) * screen.width, y: screen.height * 0.745, width: screen.width * 0.9, height: 100.0))
				textView.text = text
				textView.editable = false
				textView.selectable = false
				textView.textAlignment = NSTextAlignment.Center
				textView.font = UIFont.systemFontOfSize(20, weight: 0)
				textView.textColor = UIColor.whiteColor()
				textView.backgroundColor = UIColor.clearColor()
				scroll?.addSubview(textView)
			}
		}
		scroll?.contentSize = CGSizeMake(CGFloat(Int(screen.width) *  slides.count), screen.height * 0.5)
		scroll?.delegate = self
		dots?.addTarget(self, action: Selector("swipe:"), forControlEvents: UIControlEvents.ValueChanged)
		let closeButton = UIButton()
		closeButton.frame = CGRect(x: screen.width - 70, y: 20, width: 60, height: 60)
		closeButton.setTitle("Skip", forState: .Normal)
		closeButton.setTitleColor(UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.5), forState: .Normal)
		closeButton.titleLabel!.font =  UIFont.systemFontOfSize(16)
		closeButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
		view.addSubview(closeButton)
	}
	func pressed(sender: UIButton!) {
		self.dismissViewControllerAnimated(true) { () -> Void in
		}
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	func getFrame (iW: CGFloat, iH: CGFloat, slide: Int, offset: CGFloat) -> CGRect {
		let mH: CGFloat = screen.height * 0.50
		let mW: CGFloat = screen.width
		var h: CGFloat
		var w: CGFloat
		let r = iW / iH
		if (r <= 1) {
			h = min(mH, iH)
			w = h * r
		} else {
			w = min(mW, iW)
			h = w / r
		}
		return CGRectMake(
			max(0, (mW - w) / 2) + CGFloat(slide) * screen.width,
			max(0, (mH - h) / 2) + offset,
			w,
			h
		)
	}
	func swipe(sender: AnyObject) -> () {
		if let scrollView = scroll {
			let x = CGFloat(dots!.currentPage) * scrollView.frame.size.width
			scroll?.setContentOffset(CGPointMake(x, 0), animated: true)
		}
	}
	func scrollViewDidEndDecelerating(scrollView: UIScrollView) -> () {
		let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
		dots!.currentPage = Int(pageNumber)
	}
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}
}