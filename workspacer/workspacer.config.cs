#r "C:\Program Files\workspacer\workspacer.Shared.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

using System;
using workspacer;
using workspacer.Bar;
using workspacer.ActionMenu;
using workspacer.FocusIndicator;

// documentation
// https://github.com/workspacer/workspacer/blob/f981f23fa2ea5244a3741dbcd59b7e63a259af05/src/workspacer/Keybinds/KeybindManager.cs#L220

Action<IConfigContext> doConfig = (context) =>
{
    var monitors = context.MonitorContainer.GetAllMonitors();

    context.AddBar(new BarPluginConfig()
    {
        BarHeight = 24,
        FontSize = 8,
        FontName="Consolas",

        DefaultWidgetForeground = Color.Yellow,
        DefaultWidgetBackground = Color.Black,
        // Background = Color.Green
    });

    context.AddFocusIndicator(new FocusIndicatorPluginConfig()
    {
        BorderColor = Color.Red,
        BorderSize = 20,
        TimeToShow = 500
    });
    // context.DefaultLayouts = () => new ILayoutEngine[] { new FullLayoutEngine() };
    // var actionMenu = context.AddActionMenu();

    //filters
    // context.WindowRouter.AddRoute((window) => window.Title.Contains("Everything") ? context.WorkspaceContainer["Left"]:null);
 
    // allow minimize window
    context.CanMinimizeWindows = false;

    context.DefaultLayouts = () => new ILayoutEngine[] { new DwindleLayoutEngine(), new FullLayoutEngine() };

    //sticky ------------------
    var sticky = new StickyWorkspaceContainer(context, StickyWorkspaceIndexMode.Local);
    context.WorkspaceContainer = sticky;
    sticky.CreateWorkspaces(monitors[0], "1", "2", "3");
    sticky.CreateWorkspaces(monitors[1], "1", "2", "3");
    sticky.CreateWorkspaces(monitors[2], "1", "2", "3");
    sticky.CreateWorkspaces(monitors[3], "1", "2", "3");
    // ------------------


    //g the StickyWorkspaceContainer is useful if you want to emulate workspace modes in awesome/dwm
    //g where workspaces are specifically assigned to monitors
    context.Keybinds.UnsubscribeAll();
    var mod = KeyModifiers.Control | KeyModifiers.Alt;
    // context.Keybinds.UnsubscribeAll();
    // context.Keybinds.Unsubscribe(mod, Keys.Space);
    context.Keybinds.Unsubscribe(mod, Keys.H);
    context.Keybinds.Unsubscribe(mod, Keys.L);



    // context.Keybinds.Unsubscribe(mod , Keys.Q);
    // context.Keybinds.Unsubscribe(mod | KeyModifiers.LShift, Keys.Q);
    // context.Keybinds.Unsubscribe(mod , Keys.E);
    // context.Keybinds.Unsubscribe(mod  | KeyModifiers.LShift, Keys.E);
    // context.Keybinds.Unsubscribe(mod | KeyModifiers.LShift, Keys.W);

    // context.Keybinds.Unsubscribe(mod, Keys.Right);
   
   
    context.Keybinds.Subscribe(mod, Keys.Space, () => context.Workspaces.FocusedWorkspace.NextLayoutEngine(), "next layout");
   
    context.Keybinds.Subscribe(mod , Keys.K, ()=> context.Workspaces.FocusedWorkspace.FocusNextWindow());
    context.Keybinds.Subscribe(mod , Keys.J, ()=> context.Workspaces.FocusedWorkspace.FocusPreviousWindow());
    context.Keybinds.Subscribe(mod , Keys.Enter, ()=> context.Workspaces.FocusedWorkspace.SwapFocusAndPrimaryWindow());
    context.Keybinds.Subscribe(mod , Keys.H, ()=> context.Workspaces.FocusedWorkspace.ShrinkPrimaryArea());
    context.Keybinds.Subscribe(mod , Keys.L, ()=> context.Workspaces.FocusedWorkspace.ExpandPrimaryArea());

    context.Keybinds.Subscribe(mod , Keys.T, ()=> context.Windows.ToggleFocusedWindowTiling());
    context.Keybinds.Subscribe(mod , Keys.D1, ()=> context.Workspaces.SwitchToWorkspace(0));
    context.Keybinds.Subscribe(mod , Keys.D2, ()=> context.Workspaces.SwitchToWorkspace(1));
    context.Keybinds.Subscribe(mod , Keys.D3, ()=> context.Workspaces.SwitchToWorkspace(2));
    // context.Keybinds.Subscribe(mod , Keys.Oemcomma, ()=> context.Workspaces.FocusedWorkspace.IncrementNumberOfPrimaryWindows());
    // context.Keybinds.Subscribe(mod , Keys.OemPeriod, ()=> context.Workspaces.FocusedWorkspace.DecrementNumberOfPrimaryWindows());
    context.Keybinds.Subscribe(mod | KeyModifiers.LShift, Keys.D1, ()=> context.Workspaces.MoveFocusedWindowToWorkspace(0));
    context.Keybinds.Subscribe(mod | KeyModifiers.LShift, Keys.D2, ()=> context.Workspaces.MoveFocusedWindowToWorkspace(1));
   
   
    // context.Keybinds.Unsubscribe(mod, Keys.Enter);
    // context.Keybinds.Unsubscribe(mod, Keys.T);
    // context.Keybinds.Unsubscribe(mod, Keys.D);
    // context.Keybinds.Unsubscribe(mod | KeyModifiers.LShift, Keys.W);
    // context.Keybinds.Unsubscribe(mod | KeyModifiers.LShift, Keys.E);
    // context.Keybinds.Unsubscribe(mod | KeyModifiers.LShift, Keys.R);
    // context.Keybinds.Unsubscribe(mod | KeyModifiers.LShift, Keys.C);

   var MONITOR_LEFT = 3;
   var MONITOR_MIDDLE = 0;
   var MONITOR_RIGHT = 1;
   var MONITOR_UP = 2;

    context.Keybinds.Subscribe(mod, Keys.N, () => context.Workspaces.SwitchFocusedMonitor(MONITOR_LEFT), "monitor 3");
    context.Keybinds.Subscribe(mod, Keys.M, () => context.Workspaces.SwitchFocusedMonitor(MONITOR_UP), "monitor 0");
    context.Keybinds.Subscribe(mod, Keys.Oemcomma, () => context.Workspaces.SwitchFocusedMonitor(MONITOR_MIDDLE), "monitor 1");
    context.Keybinds.Subscribe(mod, Keys.OemPeriod, () => context.Workspaces.SwitchFocusedMonitor(MONITOR_RIGHT), "monitor 2");

    context.Keybinds.Subscribe(mod | KeyModifiers.LShift, Keys.N, () => {
        context.Workspaces.MoveFocusedWindowToMonitor(MONITOR_LEFT);
        context.Workspaces.SwitchFocusedMonitor(MONITOR_LEFT);
        }, "move focused window to monitor right");

    context.Keybinds.Subscribe(mod | KeyModifiers.LShift, Keys.M, () => {
        context.Workspaces.MoveFocusedWindowToMonitor(MONITOR_UP);
        context.Workspaces.SwitchFocusedMonitor(MONITOR_UP);
        }, "move focused window to monitor left");

    context.Keybinds.Subscribe(mod | KeyModifiers.LShift, Keys.Oemcomma, () => {
        context.Workspaces.MoveFocusedWindowToMonitor(MONITOR_MIDDLE);
        context.Workspaces.SwitchFocusedMonitor(MONITOR_MIDDLE);
        }, "move focused window to monitor middle");

    context.Keybinds.Subscribe(mod | KeyModifiers.LShift, Keys.OemPeriod, () => {
        context.Workspaces.MoveFocusedWindowToMonitor(MONITOR_RIGHT);
        context.Workspaces.SwitchFocusedMonitor(MONITOR_RIGHT);
        }, "move focused window to monitor right");

    // context.Keybinds.Subscribe(mod, Keys.S, () => context.Workspaces.SwitchFocusedMonitor(0), "monitor 2");
    // context.Keybinds.Subscribe(mod, Keys.D, () => context.Workspaces.SwitchFocusedMonitor(2), "monitor 3");

    // context.Keybinds.Subscribe(mod, Keys.Q, () =>
    // {
    //     context.Workspaces.MoveFocusedWindowToMonitor(1);
    //     context.Workspaces.SwitchFocusedMonitor(1);
    // }, "move to monitor 1");
    // context.Keybinds.Subscribe(mod, Keys.W, () =>
    // {
    //     context.Workspaces.MoveFocusedWindowToMonitor(0);
    //     context.Workspaces.SwitchFocusedMonitor(0);
    // }, "move to monitor 0");

    // context.Keybinds.Subscribe(mod, Keys.E, () =>
    // {
    //     context.Workspaces.MoveFocusedWindowToMonitor(2);
    //     context.Workspaces.SwitchFocusedMonitor(2);
    // }, "move to monitor 2");
    // context.Keybinds.Subscribe(mod, Keys.Enter, () => context.Windows.ToggleFocusedWindowTiling(), "toggle tiling");
// 

    // custom filter for everything search
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Everything"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Explorateur"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("Explorer"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("explorer"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("This PC"));
    context.WindowRouter.AddFilter((window) => !window.Title.Contains("QEMU"));
    context.WindowRouter.AddFilter((window) => !window.ProcessName.Contains("explorer.exe"));
    context.WindowRouter.AddFilter((window) => !window.ProcessName.Contains("mobaXTerm"));




};
return doConfig;