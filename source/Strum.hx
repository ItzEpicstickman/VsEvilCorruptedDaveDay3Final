package;

import flixel.FlxSprite;

class Strum extends FlxSprite
{
    var trueCoords:Array<Float>;
    var size:Array<Float>;

    public function new(x, y)
    {
        super(x, y);
        resetTrueCoords();
    }

    public function resetTrueCoords():Void
    {
        trueCoords = [x, y];
        size = [width, height];
    }

    public function smartCenterOffsets():Void
    {
        return;
        centerOffsets();
        setPosition(trueCoords[0], trueCoords[1]);
        x -= width - size[0];
        y -= height - size[1];
    }

    override function update(t:Float) {
        super.update(t);
        //if (PlayState.SONG.song.toLowerCase() == 'disability') centerOffsets();
    }
}