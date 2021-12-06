package;

import flixel.FlxSprite;
import flixel.math.FlxMath;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	public var isPlayer:Bool = false;

	
	public var noAaChars:Array<String> = [
		'dave-angey',
		'dave-annoyed-3d',
		'bambi-3d',
		'senpai',
		'senpai-angry',
		'spirit',
		'bf-pixel',
		'gf-pixel',
		'bambi-unfair',
		'bambi-piss-3d',
		'bandu',
		'the-two-dunkers',
		'tunnel-dave',
		'split-dave-3d',
		'og-dave',
		'og-dave-angey',
		'garrett',
		'badai',
		'3d-bf',
		'RECOVERED_PROJECT',
		'bandu-candy'
	];

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();

		this.isPlayer = isPlayer;

		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;

		addIcon('face', 58);

		addIcon('bf', 0);

		addIcon('tunnel-bf', 0);

		animation.add('tunnel-bf-flipped', [0, 1], 0, false, true);

		addIcon('bf-old', 2);

		animation.add('bf-old-flipped', [2, 3], 0, false, true);

		addIcon('gf', 57, true);

		addIcon('bambi-unfair', 4);

		addIcon('bambi-piss-3d', 6);
		
		addIcon('split-dave-3d', 16);

		addIcon('garrett', 20);

		addIcon('badai', 18);

		addIcon('bandu', 8);

		addIcon('bandu-candy', 8);

		addIcon('tunnel-dave', 12);

		addIcon('og-dave', 14);

		addIcon('og-dave-angey', 14);

		addIcon('the-two-dunkers', 10);

		addIcon('dave-png', 22);

		addIcon('dave-good', 22);
		
		addIcon('RECOVERED_PROJECT', 24);

		animation.play('face');

		animation.play(char);

		if (noAaChars.contains(char))
		{
			antialiasing = false;
		}
		scrollFactor.set();
	}

	function addIcon(char:String, startFrame:Int, singleIcon:Bool = false) {
		animation.add(char, singleIcon ? [startFrame, startFrame + 1] : [startFrame], 0, false, isPlayer);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		offset.set(Std.int(FlxMath.bound(width - 150,0)),Std.int(FlxMath.bound(height - 150,0)));

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
