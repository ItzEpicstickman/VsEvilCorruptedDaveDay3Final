package;

import flixel.FlxSprite;
import flixel.math.FlxMath;

class PissBoy extends FlxSprite
{
    public var bounceAnimState:Int = 0;

    public var bounceMultiplier:Float = 1;
    public var yBullshit:Float = 1;

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
                animation.play('bounceLeft', true);
            case 2:
                animation.play('bounceRight', true);
        }
    }

	override function update(elapsed:Float)
	{
        angle += elapsed * 1.25;
        x += 0.1 * bounceMultiplier;
        y += 0.1 * (bounceMultiplier * yBullshit);
		super.update(elapsed);
	}
}
