package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Zombie extends MovieClip {
		
		var main: game;
		var character: Vector2;
		public var velocity: Vector2;
		var acceleration: Vector2;
		var location: Vector2;
		var dir: Vector2;
		   
		public function Zombie(_game) {
			this.main = _game;
			velocity = new Vector2(0, 0);
			acceleration = new Vector2(0, 0);
			location = new Vector2(0, 0);
			
			this.addEventListener(Event.ENTER_FRAME, Update);
		}
		
		public function Update(event: Event){
			var charlocation = main.myCharachter.location;
			dir = Vector2.sub(charlocation, location);
			velocity.add(acceleration);
			velocity.limit(3);
			location.add(velocity);
			
			acceleration = dir;
	
			var radiaal: Number = velocity.getAngle();
			var angle: Number = Vector2.rad2deg(radiaal);
			this.rotation = angle;
			
			ZombieMovement();
		}
		
		public function ZombieMovement(){
			this.x = location.x;
			this.y = location.y;
		}
	}
	
}
