{-# LANGUAGE RebindableSyntax #-}
import XMonad.Config.Prime
import XMonad.Config.Desktop (desktopConfig)

import XMonad.Actions.CopyWindow (copy, kill1)
import XMonad.Actions.CycleRecentWS (cycleRecentWS)
import XMonad.Actions.DynamicWorkspaceGroups (promptWSGroupAdd
  , promptWSGroupForget, promptWSGroupView)
import XMonad.Actions.GridSelect (defaultGSConfig, goToSelected)
import XMonad.Actions.SwapWorkspaces (swapWithCurrent)
import XMonad.Actions.WindowBringer (bringMenuArgs, gotoMenuArgs)

import XMonad.Hooks.SetWMName (setWMName)

import XMonad.Layout.Fullscreen (fullscreenSupport)
import XMonad.Layout.NoBorders (smartBorders)

import XMonad.Util.NamedScratchpad (customFloating, defaultFloating
  , namedScratchpadAction, namedScratchpadManageHook, NamedScratchpad(NS))

import XMonad.Prompt (defaultXPConfig, font, height, promptBorderWidth)
import XMonad.StackSet (greedyView, shift, RationalRect(RationalRect))

main = xmonad $ do
  startWith desktopConfig
  focusedBorderColor =: "#008db8"
  modMask =: mod4Mask
  terminal =: terminalCommand
  modifyLayout smartBorders
  apply fullscreenSupport
  manageHook =+ namedScratchpadManageHook scratchpads
  startupHook =+ setWMName "LG3D"
  withWorkspaces $ do
    wsActions =+ [
        ("M-C-", windows . swapWithCurrent)
        , ("M-S-C-", windows . copy)
      ]
    wsKeys =+ ["0"]
  keys =- [
      ("M-S-c")
    ]
  keys =+ [
      ("M-p", spawn ("dmenu_run " ++ dmenuConfig))
      , ("M-S-p", spawn ("p=`echo '' | dmenu " ++ dmenuFont
        ++ " -p 'Open File:'` && d=`locate $p | dmenu " ++ dmenuConfig
        ++ " ` && xdg-open \"$d\""))
      , ("M-g", gotoMenuArgs dmenuArgs)
      , ("M-S-g", goToSelected defaultGSConfig)
      , ("M-S-b", bringMenuArgs dmenuArgs)
      , ("M-`", cycleRecentWS [xK_Super_L] xK_grave xK_grave)
      , ("M-x", kill)
      , ("M-S-x", kill1)
      , ("M-o", spawn "mate-screenshot -w")
    ]
  -- workspace support for number pad keys
  keys =+ [
      ("M-" ++ m ++ k, windows $ f i)
        | (i, k) <- zip workspaceIds numpadKeys
        , (f, m) <- [
            (greedyView, "")
            , (shift, "S-")
            , (swapWithCurrent, "M-C-")
            , (copy, "M-S-C-")
          ]
    ]
  -- dynamic workspace groups
  keys =+ [
      ("M-C-a", promptWSGroupAdd promptConfig "Name this group: ")
      , ("M-C-f", promptWSGroupForget promptConfig "Forget group: ")
      , ("M-C-v", promptWSGroupView promptConfig "Go to group: ")
    ]
  -- named scratchpads
  keys =+ [
      ("M-C-k", namedScratchpadAction scratchpads "keepassx")
      , ("M-<F12>", namedScratchpadAction scratchpads "terminal")
      , ("M-<F3>", namedScratchpadAction scratchpads "rhythmbox")
    ]
  where
  dmenuFont = "-fn 'Inconsolata-14:bold'"
  dmenuConfig = dmenuFont ++ " -l 20"
  dmenuArgs = words dmenuConfig
  workspaceIds = map show $ [1..9] ++ [0]
  numpadKeys = [
      "<KP_End>", "<KP_Down>", "<KP_Page_Down>", "<KP_Left>", "<KP_Begin>"
      , "<KP_Right>", "<KP_Home>", "<KP_Up>", "<KP_Page_Up>", "<KP_Insert>"
    ]
  promptConfig = defaultXPConfig {
    font = "xft:Inconsolata:pixelsize=24:weight=bold"
    , height = 30
    , promptBorderWidth = 0
  }
  scratchpads = [
      NS "keepassx" "keepassx" (className =? "Keepassx") defaultFloating
      , NS "terminal" scratchpadCommand 
          (stringProperty "WM_WINDOW_ROLE" =? "scratchpad")
          (customFloating $ RationalRect (1/6) (1/6) (2/3) (2/3))
      , NS "rhythmbox" "rhythmbox" (className =? "Rhythmbox") defaultFloating
    ]
  scratchpadCommand = terminalCommand ++ " --role=scratchpad"
  terminalCommand = "mate-terminal -e '" ++ tmuxCommand ++ "'"
  tmuxCommand = "tmux -2 new"
