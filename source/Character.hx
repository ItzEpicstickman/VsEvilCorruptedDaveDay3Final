package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
				
			case 'gf-whitty':
				tex = Paths.getSparrowAtlas('GF_Standing_Sway', 'bonusWeek');
				frames = tex;
				animation.addByPrefix('sad', 'Sad', 24, false);
				animation.addByPrefix('danceLeft', 'Idle Left', 24, false);
				animation.addByPrefix('danceRight', 'Idle Right', 24, false);
				animation.addByPrefix('scared', 'Scared', 24, false);

				addOffset('sad', -140, -153);
				addOffset('danceLeft', -140, -153);
				addOffset('danceRight', -140, -153);
				addOffset('scared', -140, -153);

				playAnim('danceRight');
				case 'gf-whitty-zoom':
					tex = Paths.getSparrowAtlas('GF_Standing_ZOOOOOOOOOOOOOOM', 'bonusWeek');
					frames = tex;
					animation.addByPrefix('sad', 'Sad', 24, false);
					animation.addByPrefix('danceLeft', 'Idle Left', 24, false);
					animation.addByPrefix('danceRight', 'Idle Right', 24, false);
					animation.addByPrefix('scared', 'Scared', 24, false);
	
					addOffset('sad', -140, -153);
					addOffset('danceLeft', -140, -153);
					addOffset('danceRight', -140, -153);
					addOffset('scared', -140, -153);
	
					playAnim('danceRight');
				case 'gf-whitty-bside':
					tex = Paths.getSparrowAtlas('gf_whitty_bside', 'bonusWeek');
					frames = tex;
					animation.addByPrefix('sad', 'Sad', 24, false);
					animation.addByPrefix('danceLeft', 'Idle Left', 24, false);
					animation.addByPrefix('danceRight', 'Idle Right', 24, false);
					animation.addByPrefix('scared', 'Scared', 24, false);
	
					addOffset('sad', -140, -153);
					addOffset('danceLeft', -140, -153);
					addOffset('danceRight', -140, -153);
					addOffset('scared', -140, -153);
	
					playAnim('danceRight');

			case 'gf-christmas':
				tex = Paths.getSparrowAtlas('characters/gfChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-car':
				tex = Paths.getSparrowAtlas('characters/gfCar');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

			case 'gf-crucified':
				tex = Paths.getSparrowAtlas('sky/gf');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF idle', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF idle', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

			case 'gf-pixel':
				tex = Paths.getSparrowAtlas('characters/gfPixel');
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

			case 'whitty': // whitty reg (lofight,overhead)
				tex = Paths.getSparrowAtlas('WhittySprites', 'bonusWeek');
				frames = tex;
				animation.addByPrefix('idle', 'Idle', 24);
				animation.addByPrefix('singUP', 'Sing Up', 24);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24);
				animation.addByPrefix('singDOWN', 'Sing Down', 24);
				animation.addByPrefix('singLEFT', 'Sing Left', 24);

				addOffset('idle', 0,0 );
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);
			case 'whittyBSide': // whitty bside (lofight,overhead)
				tex = Paths.getSparrowAtlas('BSideSprites', 'bonusWeek');
				frames = tex;
				animation.addByPrefix('idle', 'Idle', 24);
				animation.addByPrefix('singUP', 'Sing Up', 24);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24);
				animation.addByPrefix('singDOWN', 'Sing Down', 24);
				animation.addByPrefix('singLEFT', 'Sing Left', 24);

				addOffset('idle', 0, 0);
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);
			case 'whittyBSideCrazy':
				tex = Paths.getSparrowAtlas('WhittyBallisitcB', 'bonusWeek');
				frames = tex;
				animation.addByPrefix('idle', 'Whitty idle dance', 24);
				animation.addByPrefix('singUP', 'Whitty Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'whitty sing note right', 24);
				animation.addByPrefix('singDOWN', 'Whitty Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Whitty Sing Note LEFT', 24);

				addOffset('idle', 50);
				addOffset("singUP", 50, 85);
				addOffset("singRIGHT", 100, -75);
				addOffset("singLEFT", 50);
				addOffset("singDOWN", 75, -150);
			case 'whittyCrazy': // whitty crazy (ballistic)
				tex = Paths.getSparrowAtlas('WhittyCrazy', 'bonusWeek');
				frames = tex;
				animation.addByPrefix('idle', 'Whitty idle dance', 24);
				animation.addByPrefix('singUP', 'Whitty Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'whitty sing note right', 24);
				animation.addByPrefix('singDOWN', 'Whitty Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Whitty Sing Note LEFT', 24);

				addOffset('idle', 50);
				addOffset("singUP", 50, 85);
				addOffset("singRIGHT", 100, -75);
				addOffset("singLEFT", 50);
				addOffset("singDOWN", 75, -150);

			case 'dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				playAnim('idle');

			case 'baldi':
				tex = Paths.getSparrowAtlas('characters/baldi');
				frames = tex;
				animation.addByPrefix('idle', 'baldidle', 24);
				
				addOffset('idle', 0, 0);

				playAnim('idle');
				
			case 'core':
				tex = Paths.getSparrowAtlas('characters/CORE');
				frames = tex;
				animation.addByPrefix('idle', 'CORE IDLE', 24);
				animation.addByPrefix('singUP', 'CORE UP', 24);
				animation.addByPrefix('singUP-alt', 'CORE SCREAM UP', 24);
				animation.addByPrefix('singLEFT', 'CORE RIGHT', 24);
				animation.addByPrefix('singRIGHT-alt', 'CORE SCREAM RIGHT', 24);
				animation.addByPrefix('singDOWN', 'CORE DOWN', 24);
				animation.addByPrefix('singDOWN-alt', 'CORE SCREAM DOWN', 24);
				animation.addByPrefix('singRIGHT', 'CORE LEFT', 24);
				animation.addByPrefix('final', 'CORE FINAL', 24);
				
				addOffset('idle', -5, 0);
				addOffset("singUP", -66, 35);
				addOffset("singUP-alt", -39, 35);
				addOffset("singRIGHT", 0, -15);
				addOffset("singRIGHT-alt", 1, -15);
				addOffset("singLEFT", 7, 5);
				addOffset("singDOWN", -37, -33);
				addOffset("singDOWN-alt", -37, -32);
                                addOffset("final", 1, 15);

				playAnim('idle');

				flipX = true;

			case 'playtime':
				tex = Paths.getSparrowAtlas('characters/playtime');
				frames = tex;
				animation.addByPrefix('idle', 'play idle', 24);
				animation.addByPrefix('singUP', 'play up', 24);
				animation.addByPrefix('singRIGHT', 'play right', 24);
				animation.addByPrefix('singDOWN', 'play down', 24);
				animation.addByPrefix('singLEFT', 'play left', 24);
				animation.addByPrefix('sad', 'play sad', 24);

				addOffset('idle', 0, 0);
				addOffset("singUP", -10, 184);
				addOffset("singRIGHT", -48, 0);
				addOffset("singLEFT", 180, -54);
				addOffset("singDOWN", 35, 12);
                                addOffset("sad", -20, -26);

				playAnim('idle');

			case 'principal':
				tex = Paths.getSparrowAtlas('characters/PRINCIPAL');
				frames = tex;
				animation.addByPrefix('idle', 'PRINCIPAL IDLE', 24);
				animation.addByPrefix('singUP', 'PRINCIPAL UP', 24);
				animation.addByPrefix('singRIGHT', 'PRINCIPAL RIGHT', 24);
				animation.addByPrefix('singRIGHT-alt', 'PRINCIPAL W RIGHT', 24);
				animation.addByPrefix('singDOWN', 'PRINCIPAL DOWN', 24);
				animation.addByPrefix('singDOWN-alt', 'PRINCIPAL W DOWN', 24);
				animation.addByPrefix('singLEFT', 'PRINCIPAL LEFT', 24);
				animation.addByPrefix('singLEFT-alt', 'PRINCIPAL W LEFT', 24);

				addOffset('idle', 0, 0);
				addOffset("singUP", -61, 54);
				addOffset("singRIGHT", -107, -7);
				addOffset("singRIGHT-alt", -78, 0);
				addOffset("singLEFT", 112, -10);
				addOffset("singLEFT-alt", 16, 0);
				addOffset("singDOWN", 10, -35);
				addOffset("singDOWN-alt", -2, -14);

				playAnim('idle');
				
			case 'garcello':
				// GARCELLO ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/garcello_assets');
				frames = tex;
				animation.addByPrefix('idle', 'garcello idle dance', 24);
				animation.addByPrefix('singUP', 'garcello Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, 0);

				playAnim('idle');

			case 'garcellotired':
				// GARCELLO TIRED ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/garcellotired_assets');
				frames = tex;
				animation.addByPrefix('idle', 'garcellotired idle dance', 24, false);
				animation.addByPrefix('singUP', 'garcellotired Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'garcellotired Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'garcellotired Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'garcellotired Sing Note LEFT', 24, false);

				animation.addByPrefix('singUP-alt', 'garcellotired Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'garcellotired Sing Note RIGHT', 24, false);
				animation.addByPrefix('singLEFT-alt', 'garcellotired Sing Note LEFT', 24, false);
				animation.addByPrefix('singDOWN-alt', 'garcellotired cough', 24, false);

				addOffset('idle');
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, 0);
				addOffset("singUP-alt", 0, 0);
				addOffset("singRIGHT-alt", 0, 0);
				addOffset("singLEFT-alt", 0, 0);
				addOffset("singDOWN-alt", 0, 0);

				playAnim('idle');

			case 'garcellodead':
				// GARCELLO DEAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/garcellodead_assets');
				frames = tex;
				animation.addByPrefix('idle', 'garcello idle dance', 24);
				animation.addByPrefix('singUP', 'garcello Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24);

				animation.addByPrefix('garTightBars', 'garcello coolguy', 15);

				addOffset('idle');
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, 0);
				addOffset("garTightBars", 0, 0);

				playAnim('idle');

			case 'garcelloghosty':
				// GARCELLO DEAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/garcelloghosty_assets');
				frames = tex;
				animation.addByPrefix('idle', 'garcello idle dance', 24);
				animation.addByPrefix('singUP', 'garcello Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24);

				animation.addByPrefix('garFarewell', 'garcello coolguy', 15);

				addOffset('idle');
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, 0);
				addOffset("garTightBars", 0, 0);

				playAnim('idle');
				
			case 'wide': // W I D E
					tex = Paths.getSparrowAtlas('wide', 'bonusWeek');
					frames = tex;
					animation.addByPrefix('idle', 'Dad idle dance', 24);
					animation.addByPrefix('singUP', 'Dad Sing note UP', 24);
					animation.addByPrefix('singLEFT', 'dad sing note right', 24);
					animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
					animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT', 24);
	
					addOffset('idle');
					addOffset("singUP");
					addOffset("singRIGHT");
					addOffset("singLEFT");
					addOffset("singDOWN");
	
					playAnim('idle');
				
			case 'spooky':
				tex = Paths.getSparrowAtlas('characters/spooky_kids_assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				addOffset("singUP", -20, 26);
				addOffset("singRIGHT", -130, -14);
				addOffset("singLEFT", 130, -10);
				addOffset("singDOWN", -50, -130);

				playAnim('danceRight');
			case 'mom':
				tex = Paths.getSparrowAtlas('characters/Mom_Assets');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');

			case 'mom-car':
				tex = Paths.getSparrowAtlas('characters/momCar');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');
			case 'monster':
				tex = Paths.getSparrowAtlas('characters/Monster_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle');
				addOffset("singUP", -20, 50);
				addOffset("singRIGHT", -51);
				addOffset("singLEFT", -30);
				addOffset("singDOWN", -30, -40);
				playAnim('idle');
			case 'monster-christmas':
				tex = Paths.getSparrowAtlas('characters/monsterChristmas');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle');
				addOffset("singUP", -20, 50);
				addOffset("singRIGHT", -51);
				addOffset("singLEFT", -30);
				addOffset("singDOWN", -40, -94);
				playAnim('idle');
			case 'pico':
				tex = Paths.getSparrowAtlas('characters/Pico_FNF_assetss');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
				}

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				addOffset('idle');
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -68, -7);
				addOffset("singLEFT", 65, 9);
				addOffset("singDOWN", 200, -70);
				addOffset("singUPmiss", -19, 67);
				addOffset("singRIGHTmiss", -60, 41);
				addOffset("singLEFTmiss", 62, 64);
				addOffset("singDOWNmiss", 210, -28);

				playAnim('idle');

				flipX = true;

			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;
				
			case 'bf-bside':
				var tex = Paths.getSparrowAtlas('bSide/BOYFRIEND', 'bonusWeek');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);

				playAnim('idle');

				flipX = true;

			case 'bf-christmas':
				var tex = Paths.getSparrowAtlas('characters/bfChristmas');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);

				playAnim('idle');

				flipX = true;
			case 'bf-car':
				var tex = Paths.getSparrowAtlas('characters/bfCar');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				playAnim('idle');

				flipX = true;
			case 'bf-pixel':
				frames = Paths.getSparrowAtlas('characters/bfPixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'bf-pixel-dead':
				frames = Paths.getSparrowAtlas('characters/bfPixelsDEAD');
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath');
				addOffset('deathLoop', -37);
				addOffset('deathConfirm', -37);
				playAnim('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;

			case 'senpai':
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);

				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'senpai-angry':
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'spirit':
				frames = Paths.getPackerAtlas('characters/spirit');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				addOffset('idle', -220, -280);
				addOffset('singUP', -220, -240);
				addOffset("singRIGHT", -220, -280);
				addOffset("singLEFT", -200, -280);
				addOffset("singDOWN", 170, 110);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;

			case 'parents-christmas':
				frames = Paths.getSparrowAtlas('characters/mom_dad_christmas_assets');
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				addOffset('idle');
				addOffset("singUP", -47, 24);
				addOffset("singRIGHT", -1, -23);
				addOffset("singLEFT", -30, 16);
				addOffset("singDOWN", -31, -29);
				addOffset("singUP-alt", -47, 24);
				addOffset("singRIGHT-alt", -1, -24);
				addOffset("singLEFT-alt", -30, 15);
				addOffset("singDOWN-alt", -30, -27);

				playAnim('idle');
			case 'sky':
				frames = Paths.getSparrowAtlas('sky/sky_assets');
				animation.addByIndices('danceRight', 'sky idle', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
				animation.addByIndices('danceLeft', 'sky idle', [8, 9, 10, 11, 12, 13, 14, 15], "", 24, false);
				animation.addByPrefix('singUP', 'sky up', 24, false);
				animation.addByPrefix('singDOWN', 'sky down', 24, false);
				animation.addByPrefix('singLEFT', 'sky left', 24, false);
				animation.addByPrefix('singRIGHT', 'sky right', 24, false);
				
				addOffset('danceRight');
				addOffset('danceLeft');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				
				playAnim('danceRight');
				
			case 'sky-annoyed':
				frames = Paths.getSparrowAtlas('sky/sky_annoyed_assets');
				animation.addByIndices('danceRight', 'sky annoyed idle', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
				animation.addByIndices('danceLeft', 'sky annoyed idle', [8, 9, 10, 11, 12, 13, 14, 15], "", 24, false);
				animation.addByPrefix('singUP', 'sky annoyed up', 24, false);
				animation.addByPrefix('singDOWN', 'sky annoyed down', 24, false);
				animation.addByPrefix('singLEFT', 'sky annoyed left', 24, false);
				animation.addByPrefix('singRIGHT', 'sky annoyed right', 24, false);
				
				animation.addByPrefix('oh', 'sky annoyed oh', 24, true);
				animation.addByPrefix('grr', 'sky annoyed grr', 24, true);
				animation.addByPrefix('huh', 'sky annoyed huh', 24, true);
				animation.addByPrefix('ugh', 'sky annoyed ugh', 24, false);
				animation.addByPrefix('manifest', 'sky annoyed manifest', 24, false);
				
				animation.addByIndices('danceRight-alt', 'sky annoyed alt idle', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
				animation.addByIndices('danceLeft-alt', 'sky annoyed alt idle', [8, 9, 10, 11, 12, 13, 14, 15], "", 24, false);
				animation.addByPrefix('singUP-alt', 'sky annoyed alt up', 24, false);
				animation.addByPrefix('singDOWN-alt', 'sky annoyed alt down', 24, false);
				animation.addByPrefix('singLEFT-alt', 'sky annoyed alt left', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'sky annoyed alt right', 24, false);
				
				addOffset('danceRight');
				addOffset('danceLeft');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				
				addOffset("oh");
				addOffset("grr");
				addOffset("huh");
				addOffset("ugh");
				addOffset("manifest");
				
				addOffset('danceRight-alt');
				addOffset('danceLeft-alt');
				addOffset("singUP-alt");
				addOffset("singRIGHT-alt");
				addOffset("singLEFT-alt");
				addOffset("singDOWN-alt");
				
				
				playAnim('danceRight');
				
			case 'sky-mad':
				frames = Paths.getSparrowAtlas('sky/sky_mad_assets');
				animation.addByIndices('danceRight', 'sky mad idle', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
				animation.addByIndices('danceLeft', 'sky mad idle', [8, 9, 10, 11, 12, 13, 14, 15], "", 24, false);
				animation.addByPrefix('singUP', 'sky mad up', 24, false);
				animation.addByPrefix('singDOWN', 'sky mad down', 24, false);
				animation.addByPrefix('singLEFT', 'sky mad left', 24, false);
				animation.addByPrefix('singRIGHT', 'sky mad right', 24, false);
				
				animation.addByIndices('danceRight-alt', 'sky mad idle', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
				animation.addByIndices('danceLeft-alt', 'sky mad idle', [8, 9, 10, 11, 12, 13, 14, 15], "", 24, false);
				animation.addByPrefix('singUP-alt', 'sky mad up', 24, false);
				animation.addByPrefix('singDOWN-alt', 'sky mad down', 24, false);
				animation.addByPrefix('singLEFT-alt', 'sky mad left', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'sky mad right', 24, false);
				
				addOffset('danceRight-alt');
				addOffset('danceLeft-alt');
				addOffset("singUP-alt");
				addOffset("singRIGHT-alt");
				addOffset("singLEFT-alt");
				addOffset("singDOWN-alt");
				
				addOffset('danceRight');
				addOffset('danceLeft');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				
				playAnim('danceRight');
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	function loadOffsetFile(a:String) 
	{
        var g:Array<String> = CoolUtil.coolTextFile(Paths.txtOffsets("characters/" + a + "Offsets"));
        for (b in 0 ... g.length) 
        {
        	var c:String = g[b];
        	var j:Array<String> = c.split(" ");
        	addOffset(j[0], Std.parseInt(j[1]), Std.parseInt(j[2]));
        }

    }

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
					
					case 'gf-whitty':
						if (!animation.curAnim.name.startsWith('hair'))
						{
							danced = !danced;
	
							if (danced)
								playAnim('danceRight');
							else
								playAnim('danceLeft');
						}
						case 'gf-whitty-bside':
							if (!animation.curAnim.name.startsWith('hair'))
							{
								danced = !danced;
		
								if (danced)
									playAnim('danceRight');
								else
									playAnim('danceLeft');
							}
							case 'gf-whitty-zoom':
								if (!animation.curAnim.name.startsWith('hair'))
								{
									danced = !danced;
			
									if (danced)
										playAnim('danceRight');
									else
										playAnim('danceLeft');
								}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
