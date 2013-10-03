package
{
	import flash.filesystem.File;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.extensions.PDParticleSystem;
	import starling.utils.AssetManager;
	
	public class RootClass extends Sprite
	{
		private var assets:AssetManager;
		private var ps:PDParticleSystem;
		public function RootClass()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init():void
		{
			this.loadAssets();
		}
		private function loadAssets():void
		{
			this.assets = new AssetManager();
			this.assets.enqueue( File.applicationDirectory.resolvePath('./assets/'));
			this.assets.loadQueue( function (n:Number):void
			{
				if ( n == 1 )
				{
					onLoadAssets();
				}
			});
		}
		private function onLoadAssets():void
		{
			this.ps = new PDParticleSystem(this.assets.getXml('particle'), this.assets.getTexture('texture'));
			this.ps.emitterX = this.stage.stageWidth>>1;
			this.ps.emitterY = this.stage.stageHeight>>1;
			this.ps.start();
			this.addChild(this.ps);
			Starling.juggler.add(this.ps);
			this.stage.addEventListener(TouchEvent.TOUCH, handleTouch);
			
		}
		private function handleTouch(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(this.stage, TouchPhase.MOVED);
			if ( touch )
			{
				this.ps.emitterX = touch.globalX;
				this.ps.emitterY = touch.globalY;
			}
		}
	}
}