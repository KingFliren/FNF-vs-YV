--Thanks Psych Docs
--Made by Smalltalk, who prefers Luacode

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Gun_Note_Hard' then --Check charting, for different notes
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/Bullet_Notes_Hard'); --Texturee
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); Do we even need this??
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			--setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Anti Miss
			end
		end
	end
end

local GunAnims = {"hey", "hey", "hey", "hey"} --Placeholder, just here for stuff atm
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Gun_Note_Hard' then
		--if difficulty == 2 then ((for later!))
			
		--end
		characterPlayAnim('dad', GunAnims[direction + 1], false);
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.02)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Gun_Note_Hard' and difficulty == 2 then
		setProperty('health', getProperty('health')-1); --What the heck is Psych's health System..
		characterPlayAnim('dad', GunAnims[direction + 1], false);
		characterPlayAnim('boyfriend', 'hurt', true);
		characterPlayAnim('boyfriend', 'hurt', true);
	elseif noteType == 'Gun_Note_Hard' and difficulty == 1 then
		setProperty('health', getProperty('health')-1); --What the heck is Psych's health System..
		characterPlayAnim('dad', GunAnims[direction + 1], false);
		characterPlayAnim('boyfriend', 'hurt', true);
		characterPlayAnim('boyfriend', 'hurt', true);  --Double due to Psych being Dumb
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	-- Thanks wiki
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.001);
	end
end