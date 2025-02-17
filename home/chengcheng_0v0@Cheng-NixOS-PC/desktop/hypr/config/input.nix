{
  input = {
    kb_layout = "us";
    follow_mouse = 1;
    sensitivity = 0;
    touchpad.natural_scroll = false;
    repeat_rate = 35;
    repeat_delay = 180;
    kb_options = "caps:swapescape";
  };

  gestures.workspace_swipe = false;

  device = [
    {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    }
    {
      name = "wacom-one-by-wacom-s-pen";
      output = "DP-1";
    }
  ];
}
