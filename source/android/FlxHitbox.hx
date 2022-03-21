package android;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.ui.FlxButton;
import flixel.FlxSprite;

class FlxHitbox extends FlxSpriteGroup
{
	public var hitbox:FlxSpriteGroup;
	public var buttonLeft:FlxButton;
	public var buttonDown:FlxButton;
	public var buttonUp:FlxButton;
	public var buttonRight:FlxButton;

	var hitbox_hint:FlxSprite;
	
	public function new()
	{
		super();

		buttonLeft = new FlxButton(0, 0);
		buttonDown = new FlxButton(0, 0);
		buttonUp = new FlxButton(0, 0);
		buttonRight = new FlxButton(0, 0);

		hitbox = new FlxSpriteGroup();
		hitbox.add(add(buttonLeft = createhitbox(0, "left")));
		hitbox.add(add(buttonDown = createhitbox(320, "down")));
		hitbox.add(add(buttonUp = createhitbox(640, "up")));
		hitbox.add(add(buttonRight = createhitbox(960, "right")));

		hitbox_hint = new FlxSprite(0, 0).loadGraphic(Paths.image('androidcontrols/hitbox_hint'));
		hitbox_hint.alpha = 0.75;
		add(hitbox_hint);
	}

	public function createhitbox(hitboxposeX:Float, frames:String) {
		var hitboxframes = getHitboxFrames().getByName(frames);
		var graphic:FlxGraphic = FlxGraphic.fromFrame(hitboxframes);
		var button = new FlxButton(hitboxposeX, 0);
		button.loadGraphic(graphic);
		button.alpha = 0;

		button.onDown.callback = function (){
			FlxTween.num(0, 0.75, 0.075, {ease:FlxEase.circInOut}, function(alpha:Float){ 
				button.alpha = alpha;
			});
		};

		button.onUp.callback = function (){
			FlxTween.num(0.75, 0, 0.1, {ease:FlxEase.circInOut}, function(alpha:Float){ 
				button.alpha = alpha;
			});
		}

		button.onOut.callback = function (){
			FlxTween.num(button.alpha, 0, 0.2, {ease:FlxEase.circInOut}, function(alpha:Float){ 
				button.alpha = alpha;
			});
		}

		return button;
	}

	public static function getHitboxFrames():FlxAtlasFrames
	{
		return Paths.getSparrowAtlas('androidcontrols/hitbox');
	}

	override public function destroy():Void
	{
		super.destroy();

		buttonLeft = null;
		buttonDown = null;
		buttonUp = null;
		buttonRight = null;
	}
}
