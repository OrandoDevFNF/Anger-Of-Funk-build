function onCreate()
    makeLuaSprite('blankBox', 'nil', -600, 0)
    makeGraphic('blankBox', 500, 150, '000000')
    setObjectCamera('blankBox', 'camOther', true)
    setProperty('blankBox.alpha', 0.5)
    screenCenter('blankBox', 'y')
    if checkFileExists('data/'..songPath..'/songCardInfo.txt') then
        addLuaSprite('blankBox', true)
    end 
    ----------------------------
	makeAnimatedLuaSprite('funnyDisc', 'anger_disc', -645, 540)
	addAnimationByPrefix('funnyDisc', 'discMove', 'disc', 24, true)
    setObjectCamera('funnyDisc', 'camOther', true)
    scaleObject('funnyDisc', 1, 1)
    screenCenter('funnyDisc', 'y')
    if checkFileExists('data/'..songPath..'/songCardInfo.txt') then
        addLuaSprite('funnyDisc', true)
    end
    ----------------------------
    makeLuaText('cardTxt', getTextFromFile('data/'..songPath..'/songCardInfo.txt'), 0, -500, 0)
    setTextAlignment('cardTxt', left)
    setTextSize('cardTxt', 27)
    setObjectCamera('cardTxt', 'camOther', true)
    screenCenter('cardTxt', 'y')
    if checkFileExists('data/'..songPath..'/songCardInfo.txt') then
        addLuaText('cardTxt')
    end
end

function onSongStart()
    if checkFileExists('data/'..songPath..'/songCardInfo.txt') then
        doTweenX('hiBox', 'blankBox', 0, 1, 'quintOut')
        doTweenX('hiDisc', 'funnyDisc', -45, 1, 'quintOut')
        doTweenX('hiText', 'cardTxt', 100, 1, 'quintOut')
        runTimer('cardWait', 2.5)
    else
        debugPrint('ERROR: songCardInfo.txt was not found.')
    end
end

function onTimerCompleted(cardWait)
    doTweenX('byeBox', 'blankBox', -600, 1, 'quintIn')
    doTweenX('byeDisc', 'funnyDisc', -645, 1, 'quintIn')
    doTweenX('byeText', 'cardTxt', -500, 1, 'quintIn')
end
