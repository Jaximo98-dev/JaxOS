This file is a guide to the keybindings of this flake, and the design of it. 


# ------> WIP <-----

## What am I focusing
The idea is to have the keybindings set in the way that speed and ease of memorization are the priority.
## Apps
Firefox, mainly managing tabs and quick search.
Terminal, easy text manipulation and multiple windows and aliases for common stuff.
Code editors, using vim motions mainly, this is where I want to practise first.
WM, easy window manipulation with the most common ones being locked into a specific slot.

## Layers
So, there are a few "layers" for the keybindings, the rules are:
- Vim motions are prioritized, so there should be no overlapping of actions between this and other features
- Keybindings shall be organized into two layers, system and application, with no overlapping either.

## Keybindings

i3 WindowManager



---

/*
dark0_hard = rgba(1d2021ff);   /* #1d2021 - 29-32-33 
dark0      = rgba(282828ff);   /* #282828 - 40-40-40 
dark0_soft = rgba(32302fff);   /* #32302f - 50-48-47 
dark1      = rgba(3c3836ff);   /* #3c3836 - 60-56-54 
dark2      = rgba(504945ff);   /* #504945 - 80-73-69 
dark3      = rgba(665c54ff);   /* #665c54 - 102-92-84
dark4      = rgba(7c6f64ff);   /* #7c6f64 - 124-111-100 
dark4_256  = rgba(7c6f64ff);   /* #7c6f64 - 124-111-100 

gray_245   = rgba(928374ff);   /* #928374 - 146-131-116 
gray_244   = rgba(928374ff);   /* #928374 - 146-131-116 

light0_hard = rgba(f9f5d7ff);  /* #f9f5d7 - 249-245-215 
light0      = rgba(fbf1c7ff);  /* #fbf1c7 - 253-244-193 
light0_soft = rgba(f2e5bcff);  /* #f2e5bc - 242-229-188 
light1      = rgba(ebdbb2ff);  /* #ebdbb2 - 235-219-178 
light2      = rgba(d5c4a1ff);  /* #d5c4a1 - 213-196-161 
light3      = rgba(bdae93ff);  /* #bdae93 - 189-174-147 
light4      = rgba(a89984ff);  /* #a89984 - 168-153-132 
light4_256  = rgba(a89984ff);  /* #a89984 - 168-153-132 

bright_red    = rgba(fb4934ff);  /* #fb4934 - 251-73-52 
bright_green  = rgba(b8bb26ff);  /* #b8bb26 - 184-187-38 
bright_yellow = rgba(fabd2fff);  /* #fabd2f - 250-189-47 
bright_blue   = rgba(83a598ff);  /* #83a598 - 131-165-152 
bright_purple = rgba(d3869bff);  /* #d3869b - 211-134-155 
bright_aqua   = rgba(8ec07cff);  /* #8ec07c - 142-192-124 
bright_orange = rgba(fe8019ff);  /* #fe8019 - 254-128-25 

neutral_red    = rgba(cc241dff); /* #cc241d - 204-36-29 
neutral_green  = rgba(98971aff); /* #98971a - 152-151-26 
neutral_yellow = rgba(d79921ff); /* #d79921 - 215-153-33 
neutral_blue   = rgba(458588ff); /* #458588 - 69-133-136 
neutral_purple = rgba(b16286ff); /* #b16286 - 177-98-134 
neutral_aqua   = rgba(689d6aff); /* #689d6a - 104-157-106 
neutral_orange = rgba(d65d0eff); /* #d65d0e - 214-93-14 

faded_red      = rgba(9d0006ff); /* #9d0006 - 157-0-6 
faded_green    = rgba(79740eff); /* #79740e - 121-116-14 
faded_yellow   = rgba(b57614ff); /* #b57614 - 181-118-20 
faded_blue     = rgba(076678ff); /* #076678 - 7-102-120 
faded_purple   = rgba(8f3f71ff); /* #8f3f71 - 143-63-113 
faded_aqua     = rgba(427b58ff); /* #427b58 - 66-123-88 
faded_orange   = rgba(af3a03ff); /* #af3a03 - 175-58-3 
*/