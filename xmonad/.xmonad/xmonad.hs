{-# LANGUAGE TypeSynonymInstances, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances #-}

-- XMonad Core Imports
import XMonad
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

-- Standard
import Control.Lens hiding ((??), elements)

-- Config
import XMonad.Config.Azerty

-- Utilities
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)
import XMonad.Util.Run (safeSpawn, unsafeSpawn, runInTerm, spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.Loggers

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks (avoidStruts, ToggleStruts(..))
import XMonad.Hooks.XPropManage
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

-- Actions
import XMonad.Actions.Promote
import XMonad.Actions.CycleWS (moveTo, shiftTo,prevWS, nextWS, WSType(..), shiftToPrev, shiftToNext)
import XMonad.Actions.GridSelect (GSConfig(..), goToSelected, bringSelected, colorRangeFromClassName, buildDefaultGSConfig)
import XMonad.Actions.CopyWindow hiding (copy)
import XMonad.Actions.TagWindows
import XMonad.Actions.CycleWindows

-- Layouts
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.WindowNavigation as WN
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.Spacing
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.Grid
import XMonad.Layout.Tabbed
import XMonad.Layout.Gaps
import XMonad.Layout.DragPane
import XMonad.Actions.TagWindows
import XMonad.Layout.MultiToggle
import XMonad.Layout.NoBorders
import XMonad.Layout.ComboP
import XMonad.Layout.Combo
import XMonad.Layout.TwoPane
import XMonad.Layout.IfMax
import XMonad.Layout.BoringWindows (boringWindows, focusUp, markBoring)
import XMonad.Layout.Reflect
import XMonad.Layout.ThreeColumns
import XMonad.Layout.StackTile
import XMonad.Layout.ZoomRow
import XMonad.Layout.MultiColumns


-- Prompt
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Window
import XMonad.Prompt.XMonad
import XMonad.Prompt.ConfirmPrompt
import XMonad.Actions.GridSelect


import XMonad.Layout.Decoration
import XMonad.Util.Types

-- Local
import Unsplash
import Sidebar

-- Mod key
myModMask       = mod4Mask -- Super

-- Defualt Apps
myBrowser       = "google-chrome-beta"
myTerminal      = "urxvt"
myLock          = "env XSECURELOCK_SAVER=saver_mplayer xsecurelock"
myMusic         = "LD_PRELOAD=/usr/lib/libcurl.so.3:~/.xmonad/spotifywm.so $(which spotify)"
myCompositor    = "compton"
myPWAs          = [
                      ("chat.google.com", "chat.google.com")
                    , ("keep.google.com", "keep.google.com")
                    , ("calendar.google.com", "calendar.google.com")
                    , ("tasks.google.com/embed/list/~default?fullWidth=1", "tasks.google.com")
                ]
myBar           =  "~/.cabal/bin/xmobar"
myIRC           = "hexchat"
myScreenshot    = "flameshot gui -p ~/Documents/screenshots"

-- dock
myDockApps      = pwaList myBrowser myPWAs ++ [(myMusic, "spotify")]
myDockTag       = "dock"
myNormalTag     = "undocked"

-- Misc
myAutostart     = [myCompositor, myBar]
myNext          = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"
myPrev          = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"
myPlayPause     = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"

-- Theme
myFont =  "xft:Inconsolata:size=9"
myBorderWidth   = 0
myColorDark       = "#1f1f1f"
myColorGrey       = "#8e9eab"
myColorLight      = "#f7ece2"
myColorWhite      = "#fdd6b5"

-- workspaces
myWorkspaces = ["●", "● ●", "● ● ●", "● ● ● ●"]

-- Keyboard shortcuts (for key codes see):
-- http://hackage.haskell.org/package/xmonad-contrib-0.14/docs/XMonad-Util-EZConfig.html
myKeys =
    [
    -- WM
      ("M-M1-q",         confirmPrompt myPromptConfig "exit" $ io exitSuccess)
    , ("M-l",            spawn myLock)
    
    -- Windows
    , ("M-q",            kill1)
    , ("M-z",            windows W.swapUp)
    , ("M-S-z",          rotUnfocusedUp)
    , ("M-<Tab>",        focusUpTagged myNormalTag)
    , ("M-S-<Tab>",      focusUpTagged myDockTag)
    , ("M-r",            spawnApps myDockApps)
    , ("M-a" ,           sendMessage NextLayout)
    , ("M-x",            sendMessage Shrink)
    , ("M-s",            sendMessage Expand)
    , ("M-w",            withFocused $ windows . W.sink)
    , ("M-]",            nextWS)
    , ("M-[",            prevWS)
    , ("M-S-[",          sequence_ [shiftToPrev, prevWS])
    , ("M-S-]",          sequence_ [shiftToNext, nextWS])
    , ("M-M1-[",         sendMessage $ WN.Move L)
    , ("M-M1-]",         sendMessage $ WN.Move R)
    , ("M-S-`",          withFocused $ toggleTag myDockTag myNormalTag)
    -- http://hackage.haskell.org/package/xmonad-contrib-0.16/docs/XMonad-Actions-GridSelect.html
    -- http://hackage.haskell.org/package/xmonad-contrib-0.16/docs/XMonad-Actions-Submap.html
    --, ("M-S-p",        https://hackage.haskell.org/package/xmonad-contrib-0.13/docs/XMonad-Actions-WindowGo.html
    , ("M-,",            spawn myPrev)
    , ("M-.",            spawn myNext)
    , ("M-/",            spawn myPlayPause)

    -- Apps
    , ("M-<Return>",     spawn myTerminal)
    , ("M-S-<Return>",   spawn myBrowser)
    , ("M-<Space>",      shellPrompt myPromptConfig)
    , ("M-M1-<Space>",   wallPrompt myPromptConfig myUnsplashConfig)
    , ("M-S-<Space>",    windowPrompt myPromptConfig Bring allWindows)
    , ("M-p",            goToSelected defaultGSConfig)
    , ("M-M1-s",         spawn myScreenshot)

    -- Windows
    , ("M-`",            sequence_ [(sendMessage $ Toggle BAR), copyTagged myDockTag])
    , ("M-h",            sendMessage $ Toggle HIDE)
    , ("M-d",            sendMessage $ Toggle DIFF)
    , ("M-f",            sendMessage $ Toggle NBFULL)
    ] 

-- Tabbed window config
myTabConfig = def {
      activeColor = myColorWhite
    , activeTextColor = myColorDark
    , activeBorderColor = myColorWhite
    , inactiveColor = myColorDark
    , inactiveTextColor = myColorLight
    , inactiveBorderColor = myColorDark
    , fontName =  myFont
    , decoHeight = 24
}

myUnsplashConfig = def { 
      queries = [ "film" ]
    , url = "https://api.unsplash.com/photos/random?orientation=squarish&query="
    , command = "feh --bg-center /var/tmp/bg --image-bg '#1f1f1f'"
    }

-- Xmobar config
myBarConfig :: PP
myBarConfig = def {   
      ppCurrent          = xmobarColor myColorWhite ""
    , ppVisible          = xmobarColor myColorWhite ""
    , ppHidden           = const ""
    , ppHiddenNoWindows  = const ""
    , ppUrgent           = const ""
    , ppTitle            = const ""
    , ppLayout           = const ""
}

-- Launcher config
myPromptConfig :: XPConfig
myPromptConfig = 
    def { 
      font = myFont
	, fgColor = myColorLight
	, bgColor = myColorDark
	, bgHLight    = myColorDark
    , fgHLight    = myColorWhite
    , promptBorderWidth = 0
    , height = 100
    , position = Bottom
    , historySize = 20
    , showCompletionOnTab = True
    , historyFilter = deleteConsecutive
    }

myGridConfig colorizer = (buildDefaultGSConfig colorizer) {
      gs_font = myFont
    , gs_bordercolor = myColorWhite
    , gs_cellheight = 50
    , gs_cellwidth = 200
}

-- Hooks
myTagHook = myManageHook <+> manageHook def

myManageHook = composeAll
    [ className =? "MPlayer"         --> doFloat
    , className =? "Rofi"            --> doFloat
    , role =? "GtkFileChooserDialog" --> doSink
    , tagWindowGroup dockApps [myDockTag]
    , tagWindowGroup normalApps [myNormalTag]
    ] where 
        role = stringProperty "WM_WINDOW_ROLE"
        doSink = ask >>= doF . W.sink
        dockApps = resourceGroup dockClasses
        normalApps = resourceExcludeGroup dockClasses
        dockClasses = unzip myDockApps ^. _2

-- Layouts
myLayoutHook = let
    l = (decL $ small ||| (pad $ display)) ||| laptop
    display = IfMax 1 (gap $ normal) normal
    normal = IfMax 6 grid centered
    small = IfMax 5 (Mirror $ Tall 2 0.3 0.65) tabs
    laptop = IfMax 3 gold tabs
    grid = GridRatio 1  
    tabs = decU $ tabbedBottomAlways shrinkText myTabConfig
    gold = Tall 1 0.03 (toRational (2/(1 + sqrt 5 :: Double)))
    centered = ThreeColMid 1 (20/100) (56/100)
    gap = gaps [(U,40), (D,40), (L,500), (R,500)]
    pad = spacingRaw True (Border 0 10 10 10) True (Border 20 20 20 20) True
    tag = Tagged myDockTag
    layout = Tall 1 (1/50) (0/9)
    in
        WN.windowNavigation $
        mkToggle1 BAR $
        mkToggle1 HIDE $
        mkToggle ( NBFULL ?? DIFF ?? EOT ) $ avoidStruts $ combineTwoP layout EmptyLayout l tag

-- Custom Toggled Layouts
data CustomTransformers = BAR | DIFF | FANCY | HIDE
    deriving (Read, Show, Eq, Typeable)

instance Transformer CustomTransformers Window where
    transform BAR x k = let
        layout = Tall 1 (1/50) (3/10)
        no_wnd = gap $ pad $ Mirror $ Tall 1 (1/50) (10/10)
        dock =  boringWindows $ avoidStruts $ tabbedAlways shrinkText myTabConfig
        tag = Tagged myDockTag
        gap = gaps [(U,40), (D,40), (L,400), (R,400)]
        pad = spacingRaw True (Border 10 10 10 10) True (Border 30 30 30 30) True
        name = renamed [Replace myDockTag]
        in k (name $ combineTwoP layout dock x tag) (const x)
    transform DIFF x k = let
        layout = dragPane Vertical 0.05 0.5
        diff = avoidStruts $ smartBorders $ tabbedBottomAlways shrinkText myTabConfig
        in k (combineTwo layout diff diff) (const x)
    transform HIDE x k = k (EmptyLayout) (\EmptyLayout -> x)


-- PWA (Progressive web application) creator
pwaThis :: String -> (String, String) -> (String, String)
pwaThis browser (url, clss) = (
    browser 
    ++ " --password-store=gnome --profile-directory=Default --app=https://"
    ++ url
    , clss)

-- Generate list of PWAs from list
pwaList :: String -> [(String, String)] -> [(String, String)]
pwaList browser pwa = map (pwaThis browser) pwa


myStartupHook :: X ()
myStartupHook = do
    setWallpaper myUnsplashConfig
    sequence $ map spawnOnce myAutostart
    spawnApps myDockApps
    spawn "unclutter &"

myTheme :: Theme
myTheme = defaultTheme
    { activeColor = myColorWhite
    , inactiveColor = myColorDark
    , activeBorderColor = myColorWhite
    , inactiveBorderColor = myColorDark
    , activeTextColor = myColorWhite
    , inactiveTextColor = myColorDark
    , decoHeight = 6
    , decoWidth = 10
    }

decU :: Eq a => l a -> ModifiedLayout (Decoration SideDecoration DefaultShrinker) l a
decU = decoration shrinkText myTheme (SideDecoration U)

decD :: Eq a => l a -> ModifiedLayout (Decoration SideDecoration DefaultShrinker) l a
decD = decoration shrinkText myTheme (SideDecoration D)

decL :: Eq a => l a -> ModifiedLayout (Decoration SideDecoration DefaultShrinker) l a
decL = decoration shrinkText myTheme (SideDecoration L)

decR :: Eq a => l a -> ModifiedLayout (Decoration SideDecoration DefaultShrinker) l a
decR = decoration shrinkText myTheme (SideDecoration R)

data SideDecoration a = SideDecoration Direction2D
    deriving (Show, Read)

instance Eq a => DecorationStyle SideDecoration a where
    shrink b (Rectangle _ _ dw dh) (Rectangle x y w h)
        | SideDecoration U <- b = Rectangle x (y + fi dh) w (h - dh)
        | SideDecoration R <- b = Rectangle x y (w - dw) h
        | SideDecoration D <- b = Rectangle x y w (h - dh)
        | SideDecoration L <- b = Rectangle (x + fi dw) y (w - dw) h
    pureDecoration b dw dh _ st _ (win, Rectangle x y w h)
        | win `elem` W.integrate st && dw < w && dh < h = Just $ case b of
            SideDecoration U -> Rectangle x y w dh
            SideDecoration R -> Rectangle (x + fi (w - dw)) y dw h
            SideDecoration D -> Rectangle x (y + fi (h - dh)) w dh
            SideDecoration L -> Rectangle x y dw h
        | otherwise = Nothing    


main = do
    xmproc <- spawnPipe myBar
    xmonad $ docks $ azertyConfig {
      modMask            = myModMask
    , terminal           = myTerminal
    , manageHook         = myTagHook
    , logHook            = dynamicLogWithPP myBarConfig { ppOutput = hPutStrLn xmproc}
    , layoutHook         = myLayoutHook
    , startupHook        = myStartupHook
    , workspaces         = myWorkspaces
    , borderWidth        = myBorderWidth
    , normalBorderColor  = myColorDark
    , focusedBorderColor = myColorWhite
    } `additionalKeysP`    myKeys
