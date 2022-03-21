package;

#if desktop
import cpp.abi.Abi;
#end
import flixel.graphics.FlxGraphic;
import flixel.FlxCamera;
import flixel.addons.plugin.taskManager.FlxTask;
import flixel.group.FlxSpriteGroup;
import flixel.addons.ui.FlxUIGroup;
import flixel.ui.FlxButton;
import flixel.FlxObject;
import flixel.FlxBasic;
import flixel.group.FlxGroup;
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
import flixel.tweens.misc.ColorTween;
import flixel.util.FlxStringUtil;
import lime.utils.Assets;
#if desktop
import Discord.DiscordClient;
#end
using StringTools;
/*
hi cool lil committers looking at this code, 95% of this is my code and I'd appreciate if you didn't steal it without asking for my permission
-vs dave dev T5mpler 
i have to put this here just in case you think of doing so
*/
class CreditsMenuState extends MusicBeatState
{
	var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('backgrounds/SUSSUS AMOGUS'));
   var selectedFormat:FlxText;
   var defaultFormat:FlxText;
   var curNameSelected:Int = 0;
   var creditsTextGroup:Array<CreditsText> = new Array<CreditsText>();
   var menuItems:Array<CreditsText> = new Array<CreditsText>();
   var state:State;
   var selectedPersonGroup:FlxSpriteGroup = new FlxSpriteGroup();
   var selectPersonCam:FlxCamera = new FlxCamera();
   var mainCam:FlxCamera = new FlxCamera();
   var transitioning:Bool = false;

   var curSocialMediaSelected:Int = 0;
   var socialButtons:Array<SocialButton> = new Array<SocialButton>();
   var hasSocialMedia:Bool = true;
   var peopleInCredits:Array<Person> = 
   [
      //devs
      new Person("Saw (M.A. Jigsaw)", CreditsType.Dev, "Android Port",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UC2Sk7vtPzOvbVzdVTWrribQ'),
         ]
      ),
      new Person("Grantare", CreditsType.Dev, "Director, Programmer, Composer, Animator, Charter",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCKbKOSJPbP4u81cpBpoSntw'),
            new Social('twitter', 'https://twitter.com/GrantareP')
         ]
      ),
      new Person("Lancey", CreditsType.Dev, "Artist, Animator",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCXLzKLUzVUewu_NXHMb-_cQ'),
            new Social('twitter', 'https://twitter.com/Lancey170')
         ]
      ),
      new Person("CyndaquilDAC", CreditsType.Dev, "Programmer, Composer, Animator, Menu Button Artist, Charter",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCTaq4jni33NoaI1TfMXCRcA'),
            new Social('twitter', 'https://twitter.com/CyndaquilDAC')
         ]
      ),
      new Person("BezieAnims", CreditsType.Dev, "Charter, Menu Button Artist, Cycles cover",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCdkHxFQnvyIKHSPcRRu-9PQ'),
         ]
      ),
      new Person("RubysArt", CreditsType.Dev, "Wheels Composer, Charter, Concepts",
         [
            new Social('twitter', 'https://twitter.com/RubysArt_')
         ]
      ),
      //contributors
      new Person("Dragolii", CreditsType.Contributor, "Ringi OC, Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCqugunMIMN6HXHBOWAIpCqQ')
         ]
      ),
      new Person("Emiko", CreditsType.Contributor, "Bambom OC, Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UC3mIybwSekVs5VEJSe2yjog')
         ]
      ),
      new Person("DanWiki", CreditsType.Contributor, "Bendu OC, Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UC-EX5eyi6RpP80wp54RpX0A')
         ]
      ),
      //testers
      new Person("MoldyGH", CreditsType.BetaTester, "Beta Tester",
         [
           new Social('youtube', 'https://www.youtube.com/channel/UCHIvkOUDfbMCv-BEIPGgpmA'), 
           new Social('twitter', 'https://twitter.com/moldy_gh'),
           new Social('soundcloud', 'https://soundcloud.com/moldygh')
         ]
      ),
      new Person("MissingTextureMan101", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCCJna2KG54d1604L2lhZINQ'),
            new Social('twitter', 'https://twitter.com/OfficialMTM101')
         ]
      ),
      new Person("rapparep lol", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCKfdkmcdFftv4pFWr0Bh45A'),
            new Social('twitter', 'https://twitter.com/rappareplol')
         ]
      ),
      new Person("TheBuilderXD", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/user/99percentMember'),
            new Social('twitter', 'https://twitter.com/TheBuilderXD')
         ]
      ),
      new Person("T5mpler", CreditsType.BetaTester, "Beta Tester",
         [
	    new Social('youtube', 'https://www.youtube.com/channel/UCgNoOsE_NDjH6ac4umyADrw'),
	    new Social('twitter', 'https://twitter.com/RealT5mpler')
         ]
      ),
      new Person("Cuzsie", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('twitter', 'https://twitter.com/cuzsiedev')
         ]
      ),
      new Person("Billy Bobbo", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCWbxUPrpRb3lWFHULkmR0IQ'),
            new Social('twitter', 'https://twitter.com/BillyBobboLOL')
         ]
      ),
      new Person("Rodri", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCzQM6rrim_Xj-SQ_w6uVBDA'),
            new Social('twitter', 'https://twitter.com/RodriX5000')
         ]
      ),
      new Person("GamingTastic", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCuPWpA6fqAF9QAxT9Hl-f-A'),
            new Social('twitter', 'https://twitter.com/GamingTatic')
         ]
      ),
      new Person("Memory_001", CreditsType.BetaTester, "Beta Tester",
         [

         ]
      ),
      new Person("mfhx99", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCAIeiM_Vo8emQDm4SDNyAFQ'),
            new Social('twitter', 'https://twitter.com/dave_algebra')
         ]
      ),
      new Person("Knocks", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCvEK0fyppueqINTaWbLSaUw')
         ]
      ),
      new Person("ThatPizzaTowerFan", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UC7-0Iemmc842O6HYtVYl7MQ'),
            new Social('twitter', 'https://twitter.com/abithorrified')
         ]
      ),
      new Person("Cótiles", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UClNnrTqtgzAQ16w4_eC7rwA'),
            new Social('twitter', 'https://twitter.com/Ctiles1')
         ]
      ),
      new Person("EggsDeePrince", CreditsType.BetaTester, "Beta Tester",
         [

         ]
      ),
      new Person("R34LD34L", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCVbNlXsQ-9WA2WcN8u2se_Q'),
            new Social('twitter', 'https://twitter.com/TH3_R34L_D34L')
         ]
      ),
      new Person("Slóter", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UClICtrOL6iNLD532CjQd-HQ')
         ]
      ),
      new Person("Galcy / Turron", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('twitter', 'https://twitter.com/Galcy6660')
         ]
      ),
      new Person("Awesomepancake3001", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCVJE4Q2duYszNHIGfC18Fyw'),
            new Social('twitter', 'https://twitter.com/TheAmazingAD1')
         ]
      ),
      new Person("WhatsDown", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCL3oNN5ss7sI8bHq8i9Unhg'),
            new Social('twitter', 'https://twitter.com/WhatisDownnnnn')
         ]
      ),
      new Person("DaveDotCom", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCrbiBK9StsF8mZ_M7y-p7XA'),
            new Social('twitter', 'https://twitter.com/DavedotComLIVE')
         ]
      ),
      new Person("NewPlayer", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCqxtnCuemVF_EXK7P0Mo3lw')
         ]
      ),
      new Person("Foxnap", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCFMq8C3d6QvZlzR8vBBnITg'),
            new Social('twitter', 'https://twitter.com/Foxnap2')
         ]
      ),
      new Person("Grunf", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UChTTBaqjvCw5_1rFQ5cHj3g')
         ]
      ),
      new Person("Jukebox", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCwA3jnG5cu3toaVCOhc-Tqw'),
            new Social('twitter', 'https://twitter.com/Culistic1')
         ]
      ),
      new Person("Log Man", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCnGg-cLnXuQNfSzIq6xF8hw')
         ]
      ),
      new Person("PumpkinPelt", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('twitter', 'https://twitter.com/peltpumpkin')
         ]
      ),
      new Person("J (ReverbfartSFX)", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('twitter', 'https://twitter.com/reverbfartsfx')
         ]
      ),
      new Person("TheLoser", CreditsType.BetaTester, "Beta Tester",
         [

         ]
      ),
      new Person("Villezen", CreditsType.BetaTester, "Beta Tester",
         [
            new Social('youtube', 'https://www.youtube.com/channel/UCo0J58hC0TqrM7G8uaQilxA'),
            new Social('twitter', 'https://twitter.com/villezen1')
         ]
      ),
   ];

	override function create()
	{
      #if desktop
      DiscordClient.changePresence("In the Credits Menu", null);
      #end

      mainCam.bgColor.alpha = 0;
      selectPersonCam.bgColor.alpha = 0;
      FlxG.cameras.reset(mainCam);
      FlxG.cameras.add(selectPersonCam);

      FlxCamera.defaultCameras = [mainCam];
      selectedPersonGroup.cameras = [selectPersonCam];

      state = State.SelectingName;
      defaultFormat = new FlxText().setFormat("Comic Sans MS Bold", 32, FlxColor.WHITE, CENTER);
      selectedFormat = new FlxText().setFormat("Comic Sans MS Bold", 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
      
      bg.loadGraphic(MainMenuState.randomizeBG());
		bg.color = 0xFFFF0000;
      bg.scrollFactor.set();
		add(bg);
      
      var developers:Array<Person> = new Array<Person>();
      var betaTesters:Array<Person> = new Array<Person>();
      var contributors:Array<Person> = new Array<Person>();

      for (person in peopleInCredits) 
      {
         switch (person.creditsType)
         {
            case Dev: developers.push(person);
            case BetaTester: betaTesters.push(person);
            case Contributor: contributors.push(person);
         }
      }

      for (i in 0...peopleInCredits.length)
      {
         var currentPerson = peopleInCredits[i];
         if (currentPerson == developers[0] || currentPerson == contributors[0] || currentPerson == betaTesters[0])
         {
            var textString:String = '';
            switch (currentPerson.creditsType)
            {
               case Dev:
                  textString = 'Developers';
               case Contributor:
                  textString = 'Contributors';
               case BetaTester:
                  textString = 'Beta Testers';
            }
            var titleText:FlxText = new FlxText(0, 0, 0, textString);
            titleText.setFormat("Comic Sans MS Bold", 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            titleText.borderSize = 3;
            titleText.borderQuality = 3;
            titleText.screenCenter(X);
            titleText.scrollFactor.set(0, 1);

            var creditsTextTitleText = new CreditsText(titleText, false);
            creditsTextGroup.push(creditsTextTitleText);
            add(titleText);
         }

         var textItem:FlxText = new FlxText(0, i * 50, 0, currentPerson.name, 32);
         textItem.setFormat(defaultFormat.font, defaultFormat.size, defaultFormat.color, defaultFormat.alignment, defaultFormat.borderStyle, defaultFormat.borderColor);
         textItem.borderSize = 3;
         textItem.borderQuality = 3;
         textItem.screenCenter(X);
         textItem.scrollFactor.set(0, 1);
         
         var creditsTextItem:CreditsText = new CreditsText(textItem, true);

         add(textItem);
         creditsTextGroup.push(creditsTextItem);
         menuItems.push(creditsTextItem);
      }
      var selection = 0;
      changeSelection();
      for (creditsText in creditsTextGroup)
      {
         creditsText.selectionId = selection - curNameSelected;
         selection++;  
      }
      for (creditsText in creditsTextGroup)
      {
         var scaledY = FlxMath.remapToRange(creditsText.selectionId, 0, 1, 0, 1.3);
         creditsText.text.y = scaledY * 75 + (FlxG.height * 0.5);
      }

                #if android
	        addVirtualPad(UP_DOWN, A_B);
                #end

		super.create();
	}
   
	override function update(elapsed:Float)
   {
      var fadeTimer:Float = 0.08;
      var upPressed = controls.UP_P;
		var downPressed = controls.DOWN_P;
		var back = controls.BACK;
		var accept = controls.ACCEPT;
      switch (state)
      {
         case State.SelectingName:
				if (upPressed)
				{
               changeSelection(-1);
				}
				if (downPressed)
				{
               changeSelection(1);
            }
				if (back)
				{
					FlxG.switchState(new MainMenuState());
				}
				if (accept && !transitioning)
				{
               transitioning = true;
               for (creditsText in creditsTextGroup)
               {
                  FlxTween.tween(creditsText.text, {alpha: 0}, fadeTimer);
                  if (creditsText == creditsTextGroup[creditsTextGroup.length - 1])
                  {
                     FlxTween.tween(creditsText.text, {alpha: 0}, fadeTimer, 
                     {
                        onComplete: function(tween:FlxTween)
                        {
                           FlxCamera.defaultCameras = [selectPersonCam];
                           selectPerson(peopleInCredits[curNameSelected]);
                        }
                     });
                  }
               }
				}
         case State.OnName:
            if (back && !transitioning)
            {
               transitioning = true; 
               for (item in selectedPersonGroup)
               {
                  FlxTween.tween(item, {alpha: 0}, fadeTimer);
                  if (item == selectedPersonGroup.members[selectedPersonGroup.members.length - 1])
                  {
                     FlxTween.tween(item, {alpha: 0}, fadeTimer,
                     { 
                        onComplete: function (tween:FlxTween) 
                        {
                           selectedPersonGroup.forEach(function(spr:FlxSprite)
                           {
                              remove(selectedPersonGroup.remove(spr, true));
                           });
                           for (i in 0...socialButtons.length) 
                           {
                              socialButtons.remove(socialButtons[i]);
                           }
                           FlxCamera.defaultCameras = [mainCam];
                           for (creditsText in creditsTextGroup)
                           {
                              FlxTween.tween(creditsText.text, {alpha: 1}, fadeTimer);
                              if (creditsText == creditsTextGroup[creditsTextGroup.length - 1])
                              {
                                 FlxTween.tween(creditsText.text, {alpha: 1}, fadeTimer, 
                                 {
                                    onComplete: function(tween:FlxTween)
                                    {
                                       selectedPersonGroup = new FlxSpriteGroup();
                                       socialButtons = new Array<SocialButton>();
                                       FlxG.mouse.visible = false;
                                       transitioning = false;
                                       state = State.SelectingName;
                                    }
                                 });
                              }
                           }
                        }
                     });
                  }
               }
            }
            if (hasSocialMedia)
            {
               if (upPressed)
               {
                    changeSocialMediaSelection(-1);
               }
               if (downPressed)
               {
                  changeSocialMediaSelection(1);
               }
               if (accept)
               {
                  var socialButton = socialButtons[curSocialMediaSelected];
                  if (socialButton != null && socialButton.socialMedia.socialMediaName != 'discord')
                  {
                     FlxG.openURL(socialButton.socialMedia.socialLink);
                  }
               }
            }
      }
      
      super.update(elapsed);
   }

   function changeSelection(amount:Int = 0)
   {
      if (amount != 0)
      {
         FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
         curNameSelected += amount;
      }
      if (curNameSelected > peopleInCredits.length - 1)
      {
         curNameSelected = 0;
      }
      if (curNameSelected < 0)
      {
         curNameSelected = peopleInCredits.length - 1;
      }
      FlxG.camera.follow(menuItems[curNameSelected].text, 0.1);
      updateText(curNameSelected);
   }
   function changeSocialMediaSelection(amount:Int = 0)
   {
      if (amount != 0)
      {
         FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
         curSocialMediaSelected += amount;
      }
      if (curSocialMediaSelected > socialButtons.length - 1)
      {
         curSocialMediaSelected = 0;
      }
      if (curSocialMediaSelected < 0)
      {
         curSocialMediaSelected = socialButtons.length - 1;
      }
      updateSocialMediaUI();
   }

   function updateText(index:Int)
   {
      var currentText:FlxText = menuItems[index].text;
      if (menuItems[index].menuItem)
      {
		   currentText.setFormat(selectedFormat.font, selectedFormat.size, selectedFormat.color, selectedFormat.alignment, selectedFormat.borderStyle, 
            selectedFormat.borderColor);
      }
		for (i in 0...menuItems.length)
		{
         if (menuItems[i] == menuItems[curNameSelected])
         {
            continue;
         }
			var currentText:FlxText = menuItems[i].text;
			currentText.setFormat(defaultFormat.font, defaultFormat.size, defaultFormat.color, defaultFormat.alignment, defaultFormat.borderStyle,
				defaultFormat.borderColor);
			currentText.screenCenter(X);
		}
   }
   function updateSocialMediaUI()
   {
      if (hasSocialMedia)
      {
         for (socialButton in socialButtons)
         {
            var isCurrentSelected = socialButton == socialButtons[curSocialMediaSelected];
            if (isCurrentSelected)
            {
               fadeSocialMedia(socialButton, 1);
            }
            else
            {
               fadeSocialMedia(socialButton, 0.3);
            }
         }
      }
   }
   function fadeSocialMedia(socialButton:SocialButton, amount:Float)
   {
      for (i in 0...socialButton.graphics.length) 
      {
         var graphic:FlxSprite = socialButton.graphics[i];
         graphic.alpha = amount;
      }
   }

   function selectPerson(selectedPerson:Person)
   {
      curSocialMediaSelected = 0;
      var fadeTime:Float = 0.4;
      var blackBg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
      blackBg.screenCenter(X);
      blackBg.updateHitbox();
      blackBg.scrollFactor.set();
      blackBg.active = false;

      var personName:FlxText = new FlxText(0, 100, 0, selectedPerson.name, 50);
      personName.setFormat(selectedFormat.font, selectedFormat.size, selectedFormat.color, selectedFormat.alignment, selectedFormat.borderStyle, selectedFormat.borderColor);
      personName.screenCenter(X);
      personName.updateHitbox();
      personName.scrollFactor.set();
      personName.active = false;
      
      var credits:FlxText = new FlxText(0, personName.y + 50, FlxG.width / 1.25, selectedPerson.credits, 25);
      credits.setFormat(selectedFormat.font, selectedFormat.size, selectedFormat.color, selectedFormat.alignment, selectedFormat.borderStyle, selectedFormat.borderColor);
      credits.screenCenter(X);
      credits.updateHitbox();
      credits.scrollFactor.set();
      credits.active = false;

      blackBg.alpha = 0;
      personName.alpha = 0;
      credits.alpha = 0;
      
      selectedPersonGroup.add(blackBg);
      selectedPersonGroup.add(personName);
      selectedPersonGroup.add(credits);

      add(blackBg);
      add(personName);
      add(credits);

      FlxTween.tween(blackBg, { alpha: 0.7 }, fadeTime);
      FlxTween.tween(personName, { alpha: 1 }, fadeTime);
      FlxTween.tween(credits, { alpha: 1 }, fadeTime, { onComplete: function(tween:FlxTween)
      {
         if (selectedPerson.socialMedia.length == 0)
         {
            transitioning = false;
            state = State.OnName;
         }
      }});
      
      for (i in 0...selectedPerson.socialMedia.length)
      {
         var social:Social = selectedPerson.socialMedia[i];
         var socialGraphic:FlxSprite = new FlxSprite(0, credits.y + 100 + (i * 100)).loadGraphic(Paths.image('credits/' + social.socialMediaName));
         var discordText:FlxText = null;
         socialGraphic.updateHitbox();
         socialGraphic.screenCenter(X);
         socialGraphic.scrollFactor.set();
         socialGraphic.active = false;
         socialGraphic.alpha = 0;
         add(socialGraphic);

         if (social.socialMediaName == 'discord')
         {
            var offsetY:Float = 20;
            discordText = new FlxText(socialGraphic.x + 100, socialGraphic.y + (i * 100) + offsetY, 0, social.socialLink, 40);
            discordText.setFormat(defaultFormat.font, defaultFormat.size, defaultFormat.color, defaultFormat.alignment, defaultFormat.borderStyle,
               defaultFormat.borderColor);
            discordText.alpha = 0;
            discordText.updateHitbox();
            discordText.scrollFactor.set();
            discordText.active = false;
            add(discordText);
            FlxTween.tween(discordText, { alpha: 1 }, fadeTime);
            selectedPersonGroup.add(discordText);
         }

         var socialButton:SocialButton;
         
         if (discordText != null)
         {
            socialButton = new SocialButton([socialGraphic, discordText], social);
         }
         else
         {
            socialButton = new SocialButton([socialGraphic], social);
         }
         socialButtons.push(socialButton);
         selectedPersonGroup.add(socialGraphic);
         
         var isCurrentSelectedButton = socialButton == socialButtons[curSocialMediaSelected];
         var targetAlpha = isCurrentSelectedButton ? 1 : 0.3;

         if (i == selectedPerson.socialMedia.length - 1)
         {
            FlxTween.tween(socialGraphic, { alpha: targetAlpha }, fadeTime, { onComplete: function(tween:FlxTween)
            {
               transitioning = false;
               state = State.OnName;
            }});
         }
         else
         {
            FlxTween.tween(socialGraphic, { alpha: targetAlpha }, fadeTime);
         }
      }
      hasSocialMedia = socialButtons.length != 0;

   }
}

class Person
{
   public var name:String;
   public var creditsType:CreditsType;
   public var credits:String;
	public var socialMedia:Array<Social>;

	public function new(name:String, creditsType:CreditsType, credits:String, socialMedia:Array<Social>)
	{
      this.name = name;
      this.creditsType = creditsType;
		this.credits = credits;
      this.socialMedia = socialMedia;
	}
}
class Social
{
   public var socialMediaName:String;
   public var socialLink:String;

   public function new(socialMedia:String, socialLink:String)
   {
      this.socialMediaName = socialMedia;
      this.socialLink = socialLink;
   }
}
class CreditsText
{
   public var text:FlxText;
   public var menuItem:Bool;
   public var selectionId:Int;

   public function new(text:FlxText, menuItem:Bool)
   {
      this.text = text;
      this.menuItem = menuItem;
   }
}
class SocialButton
{
   public var graphics:Array<FlxSprite>;
   public var socialMedia:Social;

   public function new(graphics:Array<FlxSprite>, socialMedia:Social)
   {
      this.graphics = graphics;
      this.socialMedia = socialMedia;
   }
}
enum CreditsType
{
   Dev; BetaTester; Contributor;
}
enum State
{
   SelectingName; OnName;
}
