package {

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.ui.Keyboard;

	public class charachter extends MovieClip {
		public var velocity: Vector2;
		var acceleration: Vector2;
		var location: Vector2;
		var mouse: Vector2;
		var dir: Vector2;
		public var mass: Number;
		public var SpaceCheck: Boolean;

		var friction: Vector2;
		var frictionMag: Number = 2;
		
		var angle: Number;
		var degrees: Number;
		var dist_Y: Number;
		var dist_X: Number;

		public function charachter() {

			velocity = new Vector2(0, 0);
			acceleration = new Vector2(0, 0);
			location = new Vector2(200, 200);
			mass = 10;
			SpaceCheck = false;

			this.addEventListener(Event.ENTER_FRAME, Update);
		}

		public function Update(event: Event) {
			mouse = new Vector2(stage.mouseX, stage.mouseY);
			dir = Vector2.sub(mouse, location);
			dir.setMag(4);
			velocity.add(acceleration);
			acceleration = new Vector2(0, 0);


			friction = velocity.copy();
			friction.multS(-1);
			
			friction.multS(frictionMag)
			applyForce(friction);

			if (SpaceCheck) {
				acceleration = dir;
			}
			
			location.add(velocity);
			velocity.limit(10);
			
			dist_Y = stage.mouseY -this.y;
            dist_X = stage.mouseX - this.x;
            angle = Math.atan2(dist_Y,dist_X);
            degrees = angle * 180/Math.PI;
            this.rotation = degrees;
			
			CharachterMovement();
		}

		public function CharachterMovement() {
			this.x = location.x;
			this.y = location.y;
		}

		public function applyForce(force: Vector2) {
			var f: Vector2 = force.copy();
			f.divS(mass);

			acceleration.add(f);
		}

	}

}