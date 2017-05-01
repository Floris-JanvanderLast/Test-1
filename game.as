package {

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.ui.Keyboard;


	public class game extends MovieClip {
		public var myCharachter: MovieClip = new charachter();
		public var myZombie: MovieClip = new Zombie(this);

		public var Bullets: Array;
		public var Zombies: Array;

		public function game() {
			CharachterSpawn();

			Bullets = new Array();
			Zombies = new Array();

			EnemySpawn();

			stage.addEventListener(Event.ENTER_FRAME, Update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDownCheck);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyUpCheck);
		}

		public function Update(event: Event) {
			stage.addEventListener(MouseEvent.CLICK, fire);
		}

		public function CharachterSpawn() {
			this.addChild(myCharachter);
		}

		public static function makeRangedNumber(min: Number, max: Number): Number {
			return (Math.floor(Math.random() * (max - min + 1)) + min);
		}

		public function EnemySpawn() {
			for (var i = 0; i < 4; i++) {
				var Zomb: Zombie = new Zombie(this);
				Zomb.x = makeRangedNumber(0, stage.stageWidth);
				Zomb.y = makeRangedNumber(0, stage.stageHeight);
				Zombies.push(Zomb);
				stage.addChild(Zomb);
			}
		}

		public function KeyDownCheck(event: KeyboardEvent) {
			if (event.keyCode == Keyboard.SPACE) {
				myCharachter.SpaceCheck = true;
			}
		}

		public function KeyUpCheck(event: KeyboardEvent) {
			if (event.keyCode == Keyboard.SPACE) {
				myCharachter.SpaceCheck = false;
			}
		}

		public function fire(m: MouseEvent) {
			var b = new Bullet();
			b.rotation = myCharachter.rotation;
			b.x = myCharachter.x;
			b.y = myCharachter.y;

			Bullets.push(b);

			stage.addChild(b);

			if(b.hitTestObject(myZombie)){
				stage.removeChild(myZombie);
				trace("hit"); 
			}
		}
	}
}