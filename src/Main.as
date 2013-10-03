package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import starling.core.Starling;

	[SWF(frameRate="30", backgroundColor="#000000", width="500", height="400")]
	public class Main extends Sprite
	{
		public function Main()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(evt:Event):void
		{
			var _starling:Starling = new Starling( RootClass, this.stage);
			_starling.start();
		}
	}
}