package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	public var char:String;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		
		loadGraphic(Paths.image('iconGrid'), true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 1], 0, false, isPlayer);
		animation.add('bf-bside', [0, 1], 0, false, isPlayer);
		animation.add('bf-car', [0, 1], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 1], 0, false, isPlayer);
		animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
		animation.add('spooky', [2, 3], 0, false, isPlayer);
		animation.add('pico', [4, 5], 0, false, isPlayer);
		animation.add('mom', [6, 7], 0, false, isPlayer);
		animation.add('mom-car', [6, 7], 0, false, isPlayer);
		animation.add('tankman', [8, 9], 0, false, isPlayer);
		animation.add('face', [10, 11], 0, false, isPlayer);
                animation.add('core', [37, 38], 0, false, isPlayer);
                animation.add('principal', [39, 40], 0, false, isPlayer);
                animation.add('baldi', [39, 40], 0, false, isPlayer);
		animation.add('wide', [10, 11], 0, false, isPlayer); // W I D E
		animation.add('dad', [12, 13], 0, false, isPlayer);
		animation.add('senpai', [22, 22], 0, false, isPlayer);
		animation.add('senpai-angry', [22, 22], 0, false, isPlayer);
		animation.add('spirit', [23, 23], 0, false, isPlayer);
		animation.add('bf-old', [14, 15], 0, false, isPlayer);
		animation.add('gf', [16], 0, false, isPlayer);
		animation.add('gf-whitty', [16], 0, false, isPlayer);
		animation.add('gf-whitty-zoom', [16], 0, false, isPlayer);
		animation.add('gf-whitty-bside', [16], 0, false, isPlayer);
		animation.add('gf-crucified', [16], 0, false, isPlayer);
		animation.add('whitty', [24, 25], 0, false, isPlayer);
		animation.add('whittyBSide', [24, 25], 0, false, isPlayer);
		animation.add('whittyBSideCrazy', [26, 27], 0, false, isPlayer);
		animation.add('whittyCrazy', [26, 27], 0, false, isPlayer);
		animation.add('sky', [28, 29], 0, false, isPlayer);
		animation.add('sky-annoyed', [28, 29], 0, false, isPlayer);
		animation.add('sky-mad', [30], 0, false, isPlayer);
		animation.add('garcello', [31, 32], 0, false, isPlayer);
		animation.add('garcellotired', [33, 34], 0, false, isPlayer);
		animation.add('garcellodead', [35, 36], 0, false, isPlayer);
		animation.add('garcelloghosty', [36], 0, false, isPlayer);
		animation.add('gf-christmas', [16], 0, false, isPlayer);
		animation.add('gf-pixel', [16], 0, false, isPlayer);
		animation.add('parents-christmas', [17, 18], 0, false, isPlayer);
		animation.add('monster', [19, 20], 0, false, isPlayer);
		animation.add('monster-christmas', [19, 20], 0, false, isPlayer);
		animation.play(char);

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}

		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
