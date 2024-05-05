import XMonad
import XMonad.Actions.CopyWindow (copy, kill1)
import XMonad.Actions.CycleRecentWS (cycleRecentWS)
import XMonad.Actions.GridSelect (goToSelected, gridselectWindow)
import XMonad.Actions.DwmPromote (dwmpromote)
import XMonad.Actions.SwapWorkspaces (swapWithCurrent)
import XMonad.Actions.WindowBringer (bringMenuArgs, gotoMenuArgs)
import XMonad.Config.Mate (mateConfig)
import XMonad.Hooks.FloatNext (floatNextHook, toggleFloatNext)
import XMonad.Hooks.ManageHelpers (doCenterFloat, doRectFloat)
import XMonad.Hooks.SetWMName (setWMName)
import XMonad.Layout.Fullscreen (fullscreenSupport)
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.Spacing (smartSpacing)
import XMonad.StackSet (RationalRect(RationalRect))
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)
import XMonad.Util.NamedScratchpad (namedScratchpadAction, nonFloating, NamedScratchpad(NS))

isCalculator = className =? "Gnome-calculator"
isGimp = className =? "Gimp-2.10"
isKeepass = className =? "KeePassXC"
isMusicPlayer = className =? "Deadbeef"
isScratchPad = className =? "Alacritty_Scratchpad"

keepassCommand = "keepassxc"
musicPlayerCommand = "/opt/deadbeef/bin/deadbeef"
scratchCommand = "alacritty --class Alacritty_Scratchpad"

myModMask = mod4Mask

dmenuConfig = "-fn Inconsolata-16:regular -l 20 -x 400 -y 250 -w 1120 -dim 0.5"
dmenuGotoArgs = words dmenuConfig ++ ["-p", "Go to Window:"]
dmenuBringArgs = words dmenuConfig ++ ["-p", "Bring Window:"]

workspaceIds = map show $ [1..9]

myKeys = [
    ("M-i", spawn "firefox")
    , ("M-n", spawn "jgmenu_run")
    , ("M-o", spawn "mate-screenshot")
    , ("M-S-o", spawn "mate-screenshot -i")
    , ("M-u", spawn "caja --no-desktop $HOME")
    , ("M-x", kill)
    , ("M-S-x", kill1)
    , ("M-g", gotoMenuArgs dmenuGotoArgs)
    , ("M-S-g", goToSelected def)
    , ("M-S-b", bringMenuArgs dmenuBringArgs)
    , ("M-'", cycleRecentWS [xK_Super_L, xK_Super_R] xK_semicolon xK_apostrophe)
    , ("M-<Return>", dwmpromote)
    , ("M-f", toggleFloatNext)
    , ("M-y", namedScratchpadAction myScratchpads "musicplayer")
    , ("M-;", namedScratchpadAction myScratchpads "terminal")
    , ("M-C-k", namedScratchpadAction myScratchpads "keepass")
    , ("M-p", spawn ("dmenu_run " ++ dmenuConfig ++ " -p 'Run Executable:'"))
    , ("M-S-p", spawn ("p=`dmenu " ++ dmenuConfig ++ " -p 'Open File:'`"
        ++ " && d=`fdfind -a -H -E '*.swp' --mount $p / | dmenu " ++ dmenuConfig ++ " -p 'Path:'`"
        ++ " && user-shell-wrapper xdg-open \"$d\""))
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
        floatNextHook
        , isCalculator --> doCenterFloat
        , isGimp --> doCenterFloat
        , isKeepass --> doCenterFloat
        , isMusicPlayer --> doCenterFloat
        , isScratchPad --> doRectFloat (RationalRect (1/8) (1/8) (3/4) (3/4))
    ]

main = xmonad
    $ fullscreenSupport
    $ mateConfig {
        modMask = myModMask
        , focusedBorderColor = "#008db8"
        , layoutHook = smartBorders $ smartSpacing 5 $ layoutHook mateConfig
        , manageHook = manageHook mateConfig <+> myManageHook
        , startupHook = do
            startupHook mateConfig
            setWMName "LG3D"
            spawn "compton -b"
        , terminal = "alacritty"
    }
    `additionalKeysP` myKeys
    `removeKeysP` [("M-S-c")]
