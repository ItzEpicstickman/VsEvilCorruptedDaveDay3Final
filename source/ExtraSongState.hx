package;

import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.util.FlxStringUtil;
import lime.utils.Assets;
import FreeplayState.SongMetadata;
#if desktop
import Discord.DiscordClient;
#end
using StringTools;

class ExtraSongState extends MusicBeatState
{

    var songs:Array<SongMetadata> = [];

    var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('backgrounds/SUSSUS AMOGUS'));
    var curSelected:Int = 0;

    private var iconArray:Array<HealthIcon> = [];

    var scoreText:FlxText;
	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

    var swagText:FlxText = new FlxText(FlxG.width - 300, 0, 0, 'my poop is brimming', 85);

    var songColors:Array<FlxColor> = [
    	0xFFca1f6f, // GF
		0xFF4965FF, // DAVE
		0xFF00B515, // MISTER BAMBI r slur (i cant reclaim)
		0xFF00FFFF //SPLIT THE THONNNNN
    ];
    
    private var grpSongs:FlxTypedGroup<Alphabet>;

    override function create() {
        #if desktop DiscordClient.changePresence("In the Freeplay Menu", null); #end

        bg.loadGraphic(MainMenuState.randomizeBG());
		bg.color = 0xFF4965FF;
		add(bg);
        
		addWeek(['Sugar-Rush', 'Cycles'], 2, ['bandu-candy', 'bandu-scaredy']);
        addWeek(['Thunderstorm', 'Dave-x-Bambi-Shipping-Cute', 'RECOVERED-PROJECT'], 1, ['dave-png', 'dave-good', 'RECOVERED_PROJECT']);

        grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

        swagText.setFormat("assets/fonts/vcr.ttf", 47, FlxColor.BLACK, RIGHT);
		swagText.screenCenter();
		swagText.x += 300;
        swagText.y -= 150;
		add(swagText);

		for (i in 0...songs.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].songName, true, false);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpSongs.add(songText);

            var icon:HealthIcon = new HealthIcon(songs[i].songCharacter);
			icon.sprTracker = songText;
			if(songs[i].blackoutIcon)
			{
				icon.color = FlxColor.BLACK;
			}

			iconArray.push(icon);
			add(icon);
		}

		scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
		scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);

		var scoreBG:FlxSprite = new FlxSprite(scoreText.x - 6, 0).makeGraphic(Std.int(FlxG.width * 0.35), 66, 0xFF000000);
		scoreBG.alpha = 0.6;
		add(scoreBG);

		add(scoreText);

		changeSelection();

        super.create();
    }

    public function addWeek(songs:Array<String>, weekNum:Int, ?songCharacters:Array<String>)
	{
		if (songCharacters == null)
			songCharacters = ['bf'];

		var num:Int = 0;
		for (song in songs)
		{
            if ((song.toLowerCase() == 'dave-x-bambi-shipping-cute' && !FlxG.save.data.shipUnlocked) || (song.toLowerCase() == 'recovered-project' && !FlxG.save.data.foundRecoveredProject))
                addSong('unknown', weekNum, songCharacters[num], true);
            else
			    addSong(song, weekNum, songCharacters[num], false);

			if (songCharacters.length != 1)
				num++;
		}
	}

    public function addSong(songName:String, weekNum:Int, songCharacter:String, blackoutIcon:Bool = false)
	{
		songs.push(new SongMetadata(songName, weekNum, songCharacter, blackoutIcon));
	}

    override function update(p:Float) {
        super.update(p);

        lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.4));

        if (controls.UP_P)
            changeSelection(-1);

        if (controls.DOWN_P)
            changeSelection(1);

        if (controls.BACK)
            FlxG.switchState(new PlayMenuState());

        if (controls.ACCEPT)
		{
            switch (songs[curSelected].songName.toLowerCase()) {
                case 'unknown':
                    FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                default:   
                    var poop:String = Highscore.formatSong(songs[curSelected].songName.toLowerCase(), 1);

                    trace(poop);

                    PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].songName.toLowerCase());
                    PlayState.isStoryMode = false;
                    PlayState.storyDifficulty = 1;
                    PlayState.xtraSong = true;

                    PlayState.storyWeek = songs[curSelected].week;
                    LoadingState.loadAndSwitchState(new CharacterSelectState());
            }
			
		}
    }

    function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		curSelected += change;

		if (curSelected < 0)
			curSelected = songs.length - 1;

		if (curSelected >= songs.length)
			curSelected = 0;

        switch(songs[curSelected].songName.toLowerCase()) {
            case 'unknown':
                swagText.text = 'A secret is required \nto unlock this song!';
                swagText.visible = true;
            default:
                swagText.visible = false;
        }

        
		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, 1);
		#end

		#if PRELOAD_ALL
		FlxG.sound.playMusic(Paths.inst(songs[curSelected].songName), 0);
		#end

		var bullShit:Int = 0;

        for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0.6;
		}

		iconArray[curSelected].alpha = 1;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;

			if (item.targetY == 0)
			{
				item.alpha = 1;
			}
		}
		FlxTween.color(bg, 0.25, bg.color, songColors[songs[curSelected].week]);
	}
}