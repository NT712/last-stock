local anims = {'LEFT', 'DOWN', 'UP', 'RIGHT'}
local cloud = false
local gf = false

function onStartCountdown()
    setProperty('dad.alpha', 1)
    setProperty('boyfriend.alpha', 0)
    doTweenX('yoma','boyfriend',1000,0.1,'linear')
	doTweenY('yoma3','boyfriend',650,0.1,'linear')
    triggerEvent('Camera Follow Pos',1100,600)
    return Function_Continue;
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Alt Animation' then
        cloud = true
        gf = false
    else
        cloud = false
        gf = true
    end
end

function onBeatHit()
    if cloud == true then
       characterPlayAnim('gf', 'lookCloud', true)
    elseif gf == true then
        characterPlayAnim('gf', 'lookGF', true)
    end
    if mustHitSection then
		setProperty('defaultCamZoom',1.5);
        doTweenAlpha('fadfe','dad',0,0.1,'quartIn')
        doTweenAlpha('fadfe2','boyfriend',1,0.1,'quartIn')
        triggerEvent('Camera Follow Pos',1100,700)
	else
		setProperty('defaultCamZoom',1);
        doTweenAlpha('fadfe','dad',1,0.1,'quartIn')
        doTweenAlpha('fadfe2','boyfriend',0,0.1,'quartIn')
        triggerEvent('Camera Follow Pos',1100,600)
	end
end

function onUpdate(elapsed)
  --  for i = 0,3 do
   --     setPropertyFromGroup('strumLineNotes', i, 'x', -1000)
  --  end
    
end