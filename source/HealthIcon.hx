package;

import flixel.FlxSprite;
import flixel.math.FlxMath;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

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
		'badai'
	];

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();

		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;

		animation.add('face', [58, 59], 0, false, isPlayer);

		animation.add('bf', [0, 1], 0, false, isPlayer);

		animation.add('tunnel-bf', [0, 1], 0, false, isPlayer);

		animation.add('bf-old', [2, 3], 0, false, isPlayer);

		animation.add('gf', [57], 0, false, isPlayer);

		animation.add('bambi-unfair', [4, 5], 0, false, isPlayer);

		animation.add('bambi-piss-3d', [6, 7], 0, false, isPlayer);
		
		animation.add('split-dave-3d', [16, 17], 0, false, isPlayer);

		animation.add('garrett', [20, 21], 0, false, isPlayer);

		animation.add('badai', [18, 19], 0, false, isPlayer);

		animation.add('bandu', [8, 9], 0, false, isPlayer);

		animation.add('tunnel-dave', [12, 13], 0, false, isPlayer);

		animation.add('og-dave', [14, 15], 0, false, isPlayer);

		animation.add('the-two-dunkers', [10, 11], 0, false, isPlayer);

		animation.play('face');

		animation.play(char);

		if (noAaChars.contains(char))
		{
			antialiasing = false;
		}
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		offset.set(Std.int(FlxMath.bound(width - 150,0)),Std.int(FlxMath.bound(height - 150,0)));

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
