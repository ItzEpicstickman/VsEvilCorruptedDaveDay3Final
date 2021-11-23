package;

import flixel.FlxSprite;
import flixel.math.FlxMath;

class PissBoy extends FlxSprite
{
    public var bounceAnimState:Int = 0;

    public var bounceMultiplier:Float = 1;
    public var yBullshit:Float = 1;

    public var inCutscene:Bool = true;

	public function new(x:Float, y:Float)
	{
		super(x,y);

		frames = Paths.getSparrowAtlas('dave/pissBoy');
        animation.addByPrefix('idle', 'IDLE', 24, false);
        animation.addByPrefix('bounceLeft', 'EDGE', 24, false);
        animation.addByPrefix('bounceRight', 'EDGE', 24, false, true);
        animation.play('idle');
	}

    public function dance()
    {
        switch(bounceAnimState)
        {
            case 0:
                animation.play('idle', true);
            case 1:
                animation.play('bounceLeft');
            case 2:
                animation.play('bounceRight');
        }
    }

	override function update(elapsed:Float)
	{
        angle += elapsed * 20;
        if(!inCutscene)
            x += 1 * bounceMultiplier;
            y += 1 * (bounceMultiplier * yBullshit);
		super.update(elapsed);
	}
}
