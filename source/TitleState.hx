package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;
import openfl.Assets;
#if desktop
import Discord.DiscordClient;
#end

using StringTools;

class TitleState extends MusicBeatState
{
	static var initialized:Bool = false;

	var blackScreen:FlxSprite;
	var credGroup:FlxGroup;
	var credTextShit:Alphabet;
	var textGroup:FlxGroup;
	var ngSpr:FlxSprite;

	var curWacky:Array<String> = [];

	var wackyImage:FlxSprite;

	var titleDude:FlxSprite;

	var altIdle:Bool = false;

	//var fun:Int; fuck you

	var danced:Bool = false;

	override public function create():Void
	{
		#if polymod
		polymod.Polymod.init({modRoot: "mods", dirs: ['introMod']});
		#end
		
		#if sys
		if (!sys.FileSystem.exists(Sys.getCwd() + "\\assets\\replays"))
			sys.FileSystem.createDirectory(Sys.getCwd() + "\\assets\\replays");
		#end

		// preload all the long songs
		var preloadSongs:Array<String> = [
			'Algebra', 'AppleCore'
		];

		for (song in preloadSongs) {
			FlxG.sound.cache(Paths.inst(song));
			FlxG.sound.cache(Paths.voices(song));
		}

		/*fun = FlxG.random.int(0, 999); //fuck you programmer
		if(fun == 1)
		{
			LoadingState.loadAndSwitchState(new SusState());
		}*/

		PlayerSettings.init();

		curWacky = FlxG.random.getObject(getIntroTextShit());

		// DEBUG BULLSHIT

		#if desktop
		DiscordClient.initialize();
		#end

		super.create();

		#if ng
		var ng:NGio = new NGio(APIStuff.API, APIStuff.EncKey);
		trace('NEWGROUNDS LOL');
		#end
			
		FlxG.save.bind('funkin', 'ninjamuffin99');

		SaveDataHandler.initSave();

		Highscore.load();

		if (FlxG.save.data.weekUnlocked != null)
		{
			// FIX LATER!!!
			// WEEK UNLOCK PROGRESSION!!
			// StoryMenuState.weekUnlocked = FlxG.save.data.weekUnlocked;

			if (StoryMenuState.weekUnlocked.length < 4)
				StoryMenuState.weekUnlocked.insert(0, true);

			// QUICK PATCH OOPS!
			if (!StoryMenuState.weekUnlocked[0])
				StoryMenuState.weekUnlocked[0] = true;
		}

		#if FREEPLAY
		FlxG.switchState(new FreeplayState());
		#elseif CHARTING
		FlxG.switchState(new ChartingState());
		#else
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			startIntro();
		});
		#end
	}

	var logoBl:FlxSprite;
	var titleText:FlxSprite;


	function startIntro()
	{
		if (!initialized)
		{
			var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;

			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(-1, 0), {asset: diamond, width: 32, height: 32},
				new FlxRect(-200, -200, FlxG.width * 1.42, FlxG.height * 4.2));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(1, 0),
				{asset: diamond, width: 32, height: 32}, new FlxRect(-200, -200, FlxG.width * 1.42, FlxG.height * 4.2));

			transIn = FlxTransitionableState.defaultTransIn;
			transOut = FlxTransitionableState.defaultTransOut;

			FlxG.sound.playMusic(Paths.music('freakyMenu'), 0);

			FlxG.sound.music.fadeIn(4, 0, 0.7);
		}

		Conductor.changeBPM(150);
		persistentUpdate = true;

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		logoBl = new FlxSprite(-185, -430);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
		logoBl.antialiasing = true;
		logoBl.animation.addByIndices('bumpLeft', 'logo bumpin', [for (i in 0...14) i], '', 24, false);
		logoBl.animation.addByIndices('bumpRight', 'logo bumpin', [for (i in 15...29) i], '', 24, false);
		logoBl.animation.play('bumpLeft');
		logoBl.scale.set(0.75, 0.75);
		logoBl.updateHitbox();

		logoBl.screenCenter();
		logoBl.x += 335;
		logoBl.y -= 75;

		logoBl.scale.set(0.85, 0.85);

		titleDude = new FlxSprite(-150, 1000);
		titleDude.frames = Paths.getSparrowAtlas('golden_apple_title_guys');
		var fuckingStupid:Int = FlxG.random.int(0,999);
		if(fuckingStupid == 0)
		{
			altIdle = true;
		}
		titleDude.animation.addByIndices('idle-alt-false', 'ALT-IDLE', [0, 1, 2, 3, 4, 5, 6], '', 24, false);
		titleDude.animation.addByIndices('idle-false', 'IDLE', [0, 1, 2, 3, 4, 5, 6], '', 24, false);

		titleDude.animation.addByIndices('idle-alt-true', 'ALT-IDLE', [6, 5, 4, 3, 2, 1, 0], '', 24, false);
		titleDude.animation.addByIndices('idle-true', 'IDLE', [6, 5, 4, 3, 2, 1, 0], '', 24, false);

		if(altIdle){titleDude.animation.play('idle-alt-true');}else{titleDude.animation.play('idle-true');}
		add(titleDude);

		add(logoBl);

		titleText = new FlxSprite(100, FlxG.height * 0.8);
		titleText.frames = Paths.getSparrowAtlas('titleEnter');
		titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
		titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
		titleText.antialiasing = true;
		titleText.animation.play('idle');
		titleText.updateHitbox();
		add(titleText);

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		credGroup.add(blackScreen);

		credTextShit = new Alphabet(0, 0, "MoldyGH\nMissingTextureMan101\nRapparep\nKrisspo\nTheBuilder\nCyndaquilDAC\nT5mpler\nErizur", true);
		credTextShit.screenCenter();

		// credTextShit.alignment = CENTER;

		credTextShit.visible = false;

		ngSpr = new FlxSprite(0, FlxG.height * 0.52).loadGraphic(Paths.image('newgrounds_logo'));
		add(ngSpr);
		ngSpr.visible = false;
		ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
		ngSpr.updateHitbox();
		ngSpr.screenCenter(X);
		ngSpr.antialiasing = true;

		FlxTween.tween(credTextShit, {y: credTextShit.y + 20}, 2.9, {ease: FlxEase.quadInOut, type: PINGPONG});

		FlxG.mouse.visible = false;

		if (initialized)
			skipIntro();
		else
			initialized = true;

		createCoolText(['Created by people like:']);

		// credGroup.add(credTextShit);
	}

	function getIntroTextShit():Array<Array<String>>
	{
		var fullText:String = Assets.getText(Paths.txt('introText'));

		var firstArray:Array<String> = fullText.split('\n');
		var swagGoodArray:Array<Array<String>> = [];

		for (i in firstArray)
		{
			swagGoodArray.push(i.split('--'));
		}

		return swagGoodArray;
	}

	var transitioning:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		// FlxG.watch.addQuick('amp', FlxG.sound.music.amplitude);

		if (FlxG.keys.justPressed.F)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}

		var pressedEnter:Bool = FlxG.keys.justPressed.ENTER;

		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				pressedEnter = true;
			}
		}
		#end

		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad != null)
		{
			if (gamepad.justPressed.START)
				pressedEnter = true;

			#if switch
			if (gamepad.justPressed.B)
				pressedEnter = true;
			#end
		}

		if (pressedEnter && !transitioning && skippedIntro)
		{
			#if !switch
			NGio.unlockMedal(60960);

			// If it's Friday according to da clock
			if (Date.now().getDay() == 5)
				NGio.unlockMedal(61034);
			#end

			titleText.animation.play('press');

			FlxG.camera.flash(FlxColor.WHITE, 1);
			FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

			transitioning = true;
			// FlxG.sound.music.stop();

			new FlxTimer().start(2, function(tmr:FlxTimer)
			{

				FlxG.switchState(OutdatedSubState.leftState ? new MainMenuState() : new OutdatedSubState());

			});
			// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
		}

		if (pressedEnter && !skippedIntro)
		{
			skipIntro();
		}

		super.update(elapsed);
	}

	function createCoolText(textArray:Array<String>)
	{
		for (i in 0...textArray.length)
		{
			var money:FlxText = new FlxText(0, 0, FlxG.width, textArray[i], 48);
			money.setFormat("Comic Sans MS Bold", 48, FlxColor.WHITE, CENTER);
			money.screenCenter(X);
			money.y += (i * 60) + 200;
			credGroup.add(money);
			textGroup.add(money);
		}
	}

	function addMoreText(text:String)
	{
		var coolText:FlxText = new FlxText(0, 0, FlxG.width, text, 48);
		coolText.setFormat("Comic Sans MS Bold", 48, FlxColor.WHITE, CENTER);
		coolText.screenCenter(X);
		coolText.y += (textGroup.length * 60) + 200;
		credGroup.add(coolText);
		textGroup.add(coolText);
	}

	function deleteCoolText()
	{
		while (textGroup.members.length > 0)
		{
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	function deleteOneCoolText()
	{
		credGroup.remove(textGroup.members[0], true);
		textGroup.remove(textGroup.members[0], true);
	}

	override function stepHit() {
		super.stepHit();
		if (curStep % 2 == 0) {
			stupid++;
			altIdle ?
				titleDude.animation.play('idle-alt-${stupid % 2 == 0}', true):
				titleDude.animation.play('idle-${stupid % 2 == 0}', true);
		}
	}

	var stupid:Int = 0;

	override function beatHit()
	{
		super.beatHit();

		if(curBeat % 2 == 0)
		{
			if(danced)
			{
				logoBl.animation.play('bumpRight', true);
			}
			else
			{
				logoBl.animation.play('bumpLeft', true);
			}
		}

		danced = !danced;

		FlxG.log.add(curBeat);

		switch (curBeat)
		{
			case 2:
				addMoreText('Grantare\nLancey\nBezieAnims');
			case 3:
				addMoreText('RubysArt_\nCyndaquilDAC');
			case 4:
				deleteCoolText();
			case 5:
				createCoolText(['Special Thanks to:']);
			case 6:
				addMoreText('The VS. Dave and Bambi Team');
			case 7:
				addMoreText('and you, for playing our mod!');
			case 8:
				deleteCoolText();
				ngSpr.visible = false;
			case 9:
				createCoolText([curWacky[0]]);
			case 10:
				addMoreText(curWacky[1]);
			case 11:
				deleteCoolText();
			case 12:
				addMoreText("Friday Night Funkin'");
			case 13:
				addMoreText('VS. Dave and Bambi:');
			case 14:
				addMoreText('Golden Apple');
			case 15:
				deleteCoolText();
			case 16:
				skipIntro();
		}
	}

	var skippedIntro:Bool = false;

	function skipIntro():Void
	{
		if (!skippedIntro)
		{
			remove(ngSpr);

			FlxG.camera.flash(FlxColor.WHITE, 4);
			remove(credGroup);
			FlxTween.tween(titleDude, {y: -50}, 1, {ease: FlxEase.expoInOut});
			skippedIntro = true;
		}
	}
}
