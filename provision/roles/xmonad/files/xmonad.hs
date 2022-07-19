import XMonad
import XMonad.Actions.CopyWindow (copy, kill1)
import XMonad.Actions.CycleRecentWS (cycleRecentWS)
import XMonad.Actions.GridSelect (goToSelected, gridselectWindow)
import XMonad.Actions.SwapWorkspaces (swapWithCurrent)
import XMonad.Actions.WindowBringer (bringMenuArgs, gotoMenuArgs)
import XMonad.Config.Mate (desktopLayoutModifiers, mateConfig)
import XMonad.Hooks.ManageHelpers (doCenterFloat, doRectFloat)
import XMonad.Hooks.SetWMName (setWMName)
import XMonad.Layout.Fullscreen (fullscreenSupport)
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.StackSet (RationalRect(RationalRect))
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)
import XMonad.Util.NamedScratchpad (namedScratchpadAction, nonFloating, NamedScratchpad(NS))

isKeepass = className =? "keepassx"
isMatePanel = className =? "Mate-panel"
isMusicPlayer = className =? "Deadbeef"
isScratchPad = (className =? "Mate-terminal") <&&> (stringProperty "WM_WINDOW_ROLE" =? "Scratchpad")

keepassCommand = "keepassx"
musicPlayerCommand = "/opt/deadbeef/bin/deadbeef"
scratchCommand = "mate-terminal --role=Scratchpad"

myModMask = mod4Mask

dmenuFont = "-fn 'Inconsolata-14:bold'"
dmenuConfig = dmenuFont ++ " -l 20"
dmenuArgs = words dmenuConfig

workspaceIds = map show $ [1..9]

myKeys = [
    ("M-i", spawn "firefox")
    , ("M-o", spawn "mate-screenshot -w")
    , ("M-u", spawn "caja --no-desktop $HOME")
    , ("M-x", kill)
    , ("M-S-x", kill1)
    , ("M-g", gotoMenuArgs dmenuArgs)
    , ("M-S-g", goToSelected def)
    , ("M-S-b", bringMenuArgs dmenuArgs)
    , ("M-;", cycleRecentWS [xK_Super_L, xK_Super_R] xK_semicolon xK_colon)
    , ("M-<F3>", namedScratchpadAction myScratchpads "musicplayer")
    , ("M-<F12>", namedScratchpadAction myScratchpads "terminal")
    , ("M-C-k", namedScratchpadAction myScratchpads "keepass")
    , ("M-S-p", spawn ("p=`echo '' | dmenu " ++ dmenuFont
        ++ " -p 'Open File:'` && d=`locate $p | dmenu " ++ dmenuConfig
        ++ " ` && xdg-open \"$d\""))
    ]
    ++
    [
    ("M-" ++ modifier ++ id, windows $ command id)
        | (id) <- workspaceIds
        , (command, modifier) <- [
            (swapWithCurrent, "C-")
            , (copy, "S-C-")
        ]
    ]

myScratchpads = [
    NS "keepass" keepassCommand isKeepass nonFloating
    , NS "musicplayer" musicPlayerCommand isMusicPlayer nonFloating
    , NS "terminal" scratchCommand isScratchPad nonFloating 
    ]

myManageHook = composeAll
    [
        isKeepass --> doCenterFloat
        , isMatePanel --> doCenterFloat
        , isMusicPlayer --> doCenterFloat
        , isScratchPad --> doRectFloat (RationalRect (1/6) (1/6) (2/3) (2/3))
    ]

main = xmonad
    $ fullscreenSupport
    $ mateConfig {
        modMask = myModMask
        , focusedBorderColor = "#008db8"
        , layoutHook = smartBorders $ desktopLayoutModifiers $ layoutHook def
        , manageHook = manageHook mateConfig <+> myManageHook
        , startupHook = do
            startupHook mateConfig
            setWMName "LG3D"
    }
    `additionalKeysP` myKeys
    `removeKeysP` [("M-S-c")]
