package;

import flixel.math.FlxRandom;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
#if polymod
import polymod.format.ParseRules.TargetSignatureElement;
#end

using StringTools;

class Note extends FlxSprite
{
	public var strumTime:Float = 0;

	public var mustPress:Bool = false;
	public var finishedGenerating:Bool = false;
	public var noteData:Int = 0;
	public var canBeHit:Bool = false;
	public var tooLate:Bool = false;
	public var wasGoodHit:Bool = false;
	public var prevNote:Note;
	public var LocalScrollSpeed:Float = 1;

	public var sustainLength:Float = 0;
	public var isSustainNote:Bool = false;


	public var noteScore:Float = 1;
	public var mania:Int = 0;

	public static var noteyOff1:Array<Float> = [4, 0, 0, 0, 0, 0];
	public static var noteyOff2:Array<Float> = [0, 0, 0, 0, 0, 0];
	public static var noteyOff3:Array<Float> = [0, 0, 0, 0, 0, 0];

	public static var scales:Array<Float> = [0.7, 0.6, 0.55, 0.46];


	public static var swagWidth:Float = 160 * 0.7;
	public static var noteScale:Float;
	public static var PURP_NOTE:Int = 0;
	public static var GREEN_NOTE:Int = 2;
	public static var BLUE_NOTE:Int = 1;
	public static var RED_NOTE:Int = 3;
	
	public static var tooMuch:Float = 30;

	private var notetolookfor = 0;

	public var MyStrum:FlxSprite;

	private var InPlayState:Bool = false;

	public static var CharactersWith3D:Array<String> = ["dave-angey", "bambi-3d", 'dave-annoyed-3d', 'dave-3d-standing-bruh-what', 'bambi-unfair', 'bambi-piss-3d', 'bandu', 'tunnel-dave', 'badai', 'unfair-junker', 'og-dave', 'split-dave-3d', 'garrett', 'og-dave-angey', '3d-bf', 'bandu-candy', 'bandu-scaredy', 'sart-producer', 'ringi', 'bambom', 'bendu', 'diamond-man', 'sart-producer-night', 'bandu-origin', 'RECOVERED_PROJECT', 'RECOVERED_PROJECT_2', 'RECOVERED_PROJECT_3', 'hall-monitor', 'playrobot', 'playrobot-crazy'];

	public var rating:String = "shit";

	public function new(strumTime:Float, noteData:Int, ?prevNote:Note, ?sustainNote:Bool = false, ?musthit:Bool = true, noteStyle:String = "normal") //had to add a new variable to this because FNF dumb
	{
		swagWidth = 160 * 0.7; //factor not the same as noteScale
		noteScale = 0.7;
		mania = 0;
		if (PlayState.SONG.mania == 1)
		{
			swagWidth = 120 * 0.7;
			noteScale = 0.6;
			mania = 1;
		}
		else if (PlayState.SONG.mania == 2)
		{
			swagWidth = 90 * 0.7;
			noteScale = 0.46;
			mania = 2;
		}
		else if (PlayState.SONG.mania == 3)
		{
			swagWidth = 100 * 0.7;
			noteScale = 0.55;
			mania = 3;
		}
		super();

		if (prevNote == null)
			prevNote = this;

		this.prevNote = prevNote;
		isSustainNote = sustainNote;

		x += 50;
		y += 13.5;
		if (PlayState.SONG.mania == 2)
		{
			x -= tooMuch;
		}
		// MAKE SURE ITS DEFINITELY OFF SCREEN?
		y -= 2000;
		this.strumTime = strumTime + FlxG.save.data.offset;

		var addto = FlxG.save.data.offset;
		if (Main.editor) //xd
		{
			addto = 0;
		}
		if (this.strumTime < 0 )
			this.strumTime = 0;

		this.noteData = noteData;

		var daStage:String = PlayState.curStage;
		if (((CharactersWith3D.contains(PlayState.dadChar) && !musthit) || (CharactersWith3D.contains(PlayState.bfChar) && musthit)) || ((CharactersWith3D.contains(PlayState.SONG.player2) || CharactersWith3D.contains(PlayState.SONG.player1)) && ((this.strumTime / 50) % 20 > 10)))
		{
				frames = Paths.getSparrowAtlas('NOTE_assets_3D');

				animation.addByPrefix('greenScroll', 'green0');
				animation.addByPrefix('redScroll', 'red0');
				animation.addByPrefix('blueScroll', 'blue0');
				animation.addByPrefix('purpleScroll', 'purple0');
				animation.addByPrefix('whiteScroll', 'white0');
				animation.addByPrefix('yellowScroll', 'yellow0');
				animation.addByPrefix('violetScroll', 'violet0');
				animation.addByPrefix('blackScroll', 'black0');
				animation.addByPrefix('darkScroll', 'dark0');


				animation.addByPrefix('purpleholdend', 'pruple end hold');
				animation.addByPrefix('greenholdend', 'green hold end');
				animation.addByPrefix('redholdend', 'red hold end');
				animation.addByPrefix('blueholdend', 'blue hold end');
				animation.addByPrefix('whiteholdend', 'white hold end');
				animation.addByPrefix('yellowholdend', 'yellow hold end');
				animation.addByPrefix('violetholdend', 'violet hold end');
				animation.addByPrefix('blackholdend', 'black hold end');
				animation.addByPrefix('darkholdend', 'dark hold end');

				animation.addByPrefix('purplehold', 'purple hold piece');
				animation.addByPrefix('greenhold', 'green hold piece');
				animation.addByPrefix('redhold', 'red hold piece');
				animation.addByPrefix('bluehold', 'blue hold piece');
				animation.addByPrefix('whitehold', 'white hold piece');
				animation.addByPrefix('yellowhold', 'yellow hold piece');
				animation.addByPrefix('violethold', 'violet hold piece');
				animation.addByPrefix('blackhold', 'black hold piece');
				animation.addByPrefix('darkhold', 'dark hold piece');

				setGraphicSize(Std.int(width * noteScale));
				updateHitbox();
				antialiasing = true;
		}
		else
		{
			switch (daStage)
			{
				default:
				var dumbasspath:String = 'NOTE_assets';

				    switch(noteStyle)
				    {
						case 'phone':
							dumbasspath = 'NOTE_phone';
						default:
							dumbasspath = 'NOTE_assets';
					}
					frames = Paths.getSparrowAtlas(dumbasspath);

					animation.addByPrefix('greenScroll', 'green0');
					animation.addByPrefix('redScroll', 'red0');
					animation.addByPrefix('blueScroll', 'blue0');
					animation.addByPrefix('purpleScroll', 'purple0');
					animation.addByPrefix('whiteScroll', 'white0');
					animation.addByPrefix('yellowScroll', 'yellow0');
					animation.addByPrefix('violetScroll', 'violet0');
					animation.addByPrefix('blackScroll', 'black0');
					animation.addByPrefix('darkScroll', 'dark0');
	
	
					animation.addByPrefix('purpleholdend', 'pruple end hold');
					animation.addByPrefix('greenholdend', 'green hold end');
					animation.addByPrefix('redholdend', 'red hold end');
					animation.addByPrefix('blueholdend', 'blue hold end');
					animation.addByPrefix('whiteholdend', 'white hold end');
					animation.addByPrefix('yellowholdend', 'yellow hold end');
					animation.addByPrefix('violetholdend', 'violet hold end');
					animation.addByPrefix('blackholdend', 'black hold end');
					animation.addByPrefix('darkholdend', 'dark hold end');
	
					animation.addByPrefix('purplehold', 'purple hold piece');
					animation.addByPrefix('greenhold', 'green hold piece');
					animation.addByPrefix('redhold', 'red hold piece');
					animation.addByPrefix('bluehold', 'blue hold piece');
					animation.addByPrefix('whitehold', 'white hold piece');
					animation.addByPrefix('yellowhold', 'yellow hold piece');
					animation.addByPrefix('violethold', 'violet hold piece');
					animation.addByPrefix('blackhold', 'black hold piece');
					animation.addByPrefix('darkhold', 'dark hold piece');

					setGraphicSize(Std.int(width * noteScale));
					updateHitbox();
					antialiasing = true;
			}
		}

		var frameN:Array<String> = ['purple', 'blue', 'green', 'red'];
		if (mania == 1) frameN = ['purple', 'green', 'red', 'yellow', 'blue', 'dark'];
		else if (mania == 2) frameN = ['purple', 'blue', 'green', 'red', 'white', 'yellow', 'violet', 'black', 'dark'];
		else if (mania == 3) frameN = ['purple', 'green', 'red', 'white', 'yellow', 'blue', 'dark'];
		
		if (PlayState.SONG.song.toLowerCase() == 'cheating' && !FlxG.save.data.modchart) //siete ca update
		{
			if (mania == 0) {
				switch (noteData)
				{
					case 0:
						x += swagWidth * 3;
						notetolookfor = 3;
						animation.play('purpleScroll');
					case 1:
						x += swagWidth * 1;
						notetolookfor = 1;
						animation.play('blueScroll');
					case 2:
						x += swagWidth * 0;
						notetolookfor = 0;
						animation.play('greenScroll');
					case 3:
						notetolookfor = 2;
						x += swagWidth * 2;
						animation.play('redScroll');
				}
			}
			else if (mania == 1) {
				switch (noteData)
				{
					case 0:
						x += swagWidth * 5;
						notetolookfor = 5;
						animation.play('purpleScroll');
					case 1:
						x += swagWidth * 3;
						notetolookfor = 3;
						animation.play('greenScroll');
					case 2:
						notetolookfor = 1;
						x += swagWidth * 1;
						animation.play('redScroll');
					case 3:
						notetolookfor = 2;
						x += swagWidth * 2;
						animation.play('yellowScroll');
					case 4:
						x += swagWidth * 0;
						notetolookfor = 0;
						animation.play('blueScroll');
					case 5:
						x += swagWidth * 4;
						notetolookfor = 4;
						animation.play('darkScroll');
				}
			}
			else if (mania == 2) {
				switch (noteData)
				{
					case 0:
						x += swagWidth * 5;
						notetolookfor = 5;
						animation.play('purpleScroll');
					case 1:
						x += swagWidth * 1;
						notetolookfor = 1;
						animation.play('blueScroll');
					case 2:
						x += swagWidth * 7;
						notetolookfor = 7;
						animation.play('greenScroll');
					case 3:
						notetolookfor = 3;
						x += swagWidth * 3;
						animation.play('redScroll');
					case 4:
						x += swagWidth * 0;
						notetolookfor = 0;
						animation.play('whiteScroll');
					case 5:
						x += swagWidth * 2;
						notetolookfor = 2;
						animation.play('yellowScroll');
					case 6:
						x += swagWidth * 8;
						notetolookfor = 8;
						animation.play('violetScroll');
					case 7:
						x += swagWidth * 6;
						notetolookfor = 6;
						animation.play('blackScroll');
					case 8:
						notetolookfor = 4;
						x += swagWidth * 4;
						animation.play('darkScroll');
				}
			}
			else {
				switch (noteData)
				{
					case 0:
						x += swagWidth * 6;
						notetolookfor = 6;
						animation.play('purpleScroll');
					case 1:
						x += swagWidth * 4;
						notetolookfor = 4;
						animation.play('greenScroll');
					case 2:
						notetolookfor = 1;
						x += swagWidth * 1;
						animation.play('redScroll');
					case 3:
						notetolookfor = 3;
						x += swagWidth * 3;
						animation.play('whiteScroll');
					case 4:
						notetolookfor = 2;
						x += swagWidth * 2;
						animation.play('yellowScroll');
					case 5:
						x += swagWidth * 0;
						notetolookfor = 0;
						animation.play('blueScroll');
					case 6:
						x += swagWidth * 5;
						notetolookfor = 5;
						animation.play('darkScroll');
				}
			}
	
			flipY = (Math.round(Math.random()) == 0); //fuck you
			flipX = (Math.round(Math.random()) == 1);
		}
		else
		{
			x += swagWidth * (noteData % Main.keyAmmo[mania]);
			notetolookfor = noteData % Main.keyAmmo[mania];
			animation.play(frameN[noteData % Main.keyAmmo[mania]] + 'Scroll');
		}
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'cheating' | 'unfairness' | 'applecore':
				if (Type.getClassName(Type.getClass(FlxG.state)).contains("PlayState")  && !FlxG.save.data.modchart)
				{
					var state:PlayState = cast(FlxG.state,PlayState);
					InPlayState = true;
					if (musthit)
					{
						state.playerStrums.forEach(function(spr:Strum)
						{
							if (spr.ID == notetolookfor)
							{
								x = spr.x;
								MyStrum = spr;
							}
						});
					}
					else
					{
						state.dadStrums.forEach(function(spr:Strum)
						{
							if (spr.ID == notetolookfor)
							{
									x = spr.x;
									MyStrum = spr;
								}
							});
					}
				}
		}
		if (PlayState.SONG.song.toLowerCase() == 'unfairness' || PlayState.SONG.song.toLowerCase() == 'applecore' && !FlxG.save.data.modchart)
		{
			var rng:FlxRandom = new FlxRandom();
			if (rng.int(0,120) == 1)
			{
				LocalScrollSpeed = 0.1;
			}
			else
			{
				LocalScrollSpeed = rng.float(1,3);
			}
		}
		

		// trace(prevNote);

		// we make sure its downscroll and its a SUSTAIN NOTE (aka a trail, not a note)
		// and flip it so it doesn't look weird.
		// THIS DOESN'T FUCKING FLIP THE NOTE, CONTRIBUTERS DON'T JUST COMMENT THIS OUT JESUS
		if (FlxG.save.data.downscroll && sustainNote) 
			flipY = true;

		if (isSustainNote && prevNote != null)
		{
			noteScore * 0.2;
			alpha = 0.6;
			if (FlxG.save.data.downscroll)
			{
				scale.y *= -1;
			}

			x += width / 2;

			animation.play(frameN[noteData % Main.keyAmmo[mania]] + 'holdend');
			switch (noteData)
			{
				case 0:
				//nada
			}

			updateHitbox();

			x -= width / 2;

			if (PlayState.curStage.startsWith('school'))
				x += 30;

			if (prevNote.isSustainNote)
			{
				switch (prevNote.noteData)
				{
					case 0:
					//nada
				}
				prevNote.animation.play(frameN[prevNote.noteData] + 'hold');
				prevNote.scale.y *= Conductor.stepCrochet / 100 * 1.5 * PlayState.SONG.speed * (0.7 / noteScale);
				prevNote.updateHitbox();
				// prevNote.setGraphicSize();
			}
		}
	}

	public var isAlt:Bool = false;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (MyStrum != null && !isAlt)
		{
			x = MyStrum.x + (isSustainNote ? width : 0);
			//angle = MyStrum.angle;
		}
		else
		{
			if (InPlayState && !isAlt && !FlxG.save.data.modchart)
			{
				var state:PlayState = cast(FlxG.state,PlayState);
				if (mustPress)
					{
						state.playerStrums.forEach(function(spr:Strum)
						{
							if (spr.ID == notetolookfor)
							{
								x = spr.x;
								//angle = spr.angle;
								MyStrum = spr;
							}
						});
					}
					else
					{
						state.dadStrums.forEach(function(spr:Strum)
							{
								if (spr.ID == notetolookfor)
								{
									x = spr.x;
									//angle = spr.angle;
									MyStrum = spr;
								}
							});
					}
			}
		}
		if (mustPress)
		{
			// The * 0.5 is so that it's easier to hit them too late, instead of too early
			if (strumTime > Conductor.songPosition - Conductor.safeZoneOffset
				&& strumTime < Conductor.songPosition + (Conductor.safeZoneOffset * 0.5))
				canBeHit = true;
			else
				canBeHit = false;

			if (strumTime < Conductor.songPosition - Conductor.safeZoneOffset && !wasGoodHit)
				tooLate = true;
		}
		else
		{
			canBeHit = false;

			if (strumTime <= Conductor.songPosition)
				wasGoodHit = true;
		}

		if (tooLate)
		{
			if (alpha > 0.3)
				alpha = 0.3;
			
		}
	}
}
