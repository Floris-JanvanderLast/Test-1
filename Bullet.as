package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class Bullet extends MovieClip {
		
		private var speed: int;
		
		public function Bullet() {
			speed = 30;
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(e: Event){
			
			x=x+Math.cos(rotation/180*Math.PI)*speed;
			y=y+Math.sin(rotation/180*Math.PI)*speed;
			
			if(x < 0 || x > 1000 || y < 0 || y > 1000){
				removeEventListener(Event.ENTER_FRAME, update);
				
				parent.removeChild(this);
			}
		}
	}
	
}
