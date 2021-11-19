package;

import flixel.FlxSprite;

class StupidDumbSprite extends FlxSprite
{
    public var name:String = 'deez';
    
    public function new(x, y, krunkName)
    {
        super(x, y);
        name = krunkName;
    }
}