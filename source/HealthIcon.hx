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

	
	//LIST ICON NAME HERE NOT CHARACTER
	public var noAaChars:Array<String> = [
		'unfair',
		'disrupt',
		'bandu',
		'junkers',
		'decdave',
		'disability',
		'og-dave',
		'garrett',
		'badai',
		'3d-bf',
		'recovered',
		'bandu-origin',
		'sart-producer',
		'bambom',
		'ringi',
		'bendu',
		'wheels',
		'gary'
	];

	public var charPublic:String = 'bf';

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();

		this.isPlayer = isPlayer;

		changeIcon(char);

		scrollFactor.set();
	}

	function addIcon(char:String, startFrame:Int, singleIcon:Bool = false) {
		animation.add(char, !singleIcon ? [startFrame, startFrame + 1] : [startFrame], 0, false, isPlayer);
	}

	public function changeIcon(char:String = 'face')
	{
		charPublic = char;

		if(char != 'bandu-origin')
		{
			loadGraphic(Paths.image('icons/icon-' + char), true, 150, 150);

			addIcon(char, 0);

			//old shit, for reference
			/*
			loadGraphic(Paths.image('iconGrid'), true, 150, 150);
	
			addIcon('face', 58);

			addIcon('ringi', 28);

			addIcon('bambom', 30);

			addIcon('bendu', 32);
	
			addIcon('bf', 0);

			addIcon('3d-bf', 34);

			addIcon('playrobot', 38);

			addIcon('playrobot-crazy', 38);

			addIcon('diamond-man', 40);

			addIcon('hall-monitor', 42);

			addIcon('bambi-good', 44);

			addIcon('sart-producer', 26);

			addIcon('sart-producer-night', 26);

			addIcon('dave-wheels', 36);
	
			addIcon('tunnel-bf', 0);
		
			addIcon('bf-old', 2);
		
			addIcon('gf', 57, true);

			addIcon('bambi-unfair', 4);
			
			addIcon('unfair-junker', 4);
	
			addIcon('bambi-piss-3d', 6);
			
			addIcon('split-dave-3d', 16);
	
			addIcon('garrett', 20);
	
			addIcon('badai', 18);
	
			addIcon('bandu', 8);
	
			addIcon('bandu-candy', 8);
	
			addIcon('bandu-origin', 8);

			addIcon('bandu-scaredy', 8);
	
			addIcon('tunnel-dave', 12);
	
			addIcon('og-dave', 14);
	
			addIcon('og-dave-angey', 14);
	
			addIcon('the-two-dunkers', 10);
	
			addIcon('dave-png', 22);
	
			addIcon('dave-good', 22);
			
			addIcon('RECOVERED_PROJECT', 24);

			addIcon('RECOVERED_PROJECT_2', 24);

			addIcon('RECOVERED_PROJECT_3', 24);
	
			animation.play('face');*/
		}
		else
		{
			frames = Paths.getSparrowAtlas('bandu_origin_icon');
			animation.addByPrefix(char, char, 24, false, isPlayer, false);
		}

		antialiasing = !noAaChars.contains(char);

		animation.play(char);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		offset.set(Std.int(FlxMath.bound(width - 150,0)),Std.int(FlxMath.bound(height - 150,0)));

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
