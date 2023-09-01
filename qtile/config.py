from pathlib import Path
from itertools import cycle
from libqtile import bar, layout
from libqtile.config import (
    Click,
    Drag,
    Group,
    Key,
    Match,
    Screen,
)
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras import widget
from qtile_extras.resources import wallpapers
from qtile_extras.widget.decorations import (
    PowerLineDecoration
)


mod = 'mod4'

# Terminals in my preference order
terminal = guess_terminal([
    'kitty',
    'foot',
    'st',
    'gnome-terminal'
])

icons_dir = Path('~/.config/qtile/images')

keys = [
    Key([mod], 'h', lazy.layout.left()),
    Key([mod], 'j', lazy.layout.down()),
    Key([mod], 'k', lazy.layout.up()),
    Key([mod], 'l', lazy.layout.right()),
    Key([mod], 'n', lazy.layout.normalize()),
    Key([mod], 'r', lazy.spawncmd()),
    Key([mod], 'w', lazy.window.kill()),
    Key([mod], 'space', lazy.layout.next()),
    Key([mod], 'Tab', lazy.next_layout()),
    Key([mod], 'Return', lazy.spawn(terminal)),
    Key([mod,  'shift'], 'h', lazy.layout.shuffle_left()),
    Key([mod,  'shift'], 'j', lazy.layout.shuffle_down()),
    Key([mod,  'shift'], 'k', lazy.layout.shuffle_up()),
    Key([mod,  'shift'], 'l', lazy.layout.shuffle_right()),
    Key([mod,  'shift'], 'Return', lazy.layout.toggle_split()),
    Key([mod,  'control'], 'h', lazy.layout.grow_left()),
    Key([mod,  'control'], 'j', lazy.layout.grow_down()),
    Key([mod,  'control'], 'k', lazy.layout.grow_up()),
    Key([mod,  'control'], 'l', lazy.layout.grow_right()),
    Key([mod,  'control'], 'q', lazy.shutdown()),
    Key([mod,  'control'], 'r', lazy.reload_config()),
]

for _ in (Group(_) for _ in '123456789'):
    keys.extend([
        Key([mod], _.name, lazy.group[_.name].toscreen(),),
        Key([mod, 'shift'], _.name, lazy.window.togroup(_.name, switch_group=True)),
        # Key([mod, 'shift'], i.name, lazy.window.togroup(i.name))
    ])

layout_borders = {
    'border_on_single': True,
    'border_focus': '#0f9fdf',
    'border_focus_stack': '#0f9fdf',
    'border_normal': '#b0b0b0',
    'border_normal_stack': '#b0b0b0',
    'margin': 3
}

layouts = [
    layout.Columns(**layout_borders),
    layout.Max(**layout_borders),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2, **layout_borders),
    # layout.Bsp(**layout_borders),
    # layout.Matrix(**layout_borders),
    layout.MonadTall(**layout_borders),
    # layout.MonadWide(**layout_borders),
    # layout.RatioTile(**layout_borders),
    # layout.Tile(**layout_borders),
    # layout.TreeTab(**layout_borders),
    # layout.VerticalTile(**layout_borders),
    # layout.Zoomy(**layout_borders),
]

powerline = {
    'decorations': [
        # arrow_left
        # arrow_right
        # forward_slash
        # back_slash
        # zig_zag
        # rounded_left
        # rounded_right
        PowerLineDecoration(path='forward_slash')
    ]
}

widget_defaults = dict(
    font='FiraCode Nerd Font Mono',
    fontsize=11,
    padding=3,
    foreground='#000000',
    **powerline
)

extension_defaults = widget_defaults.copy()

bg = cycle(('#afafaf', '#0f9fdf'))

openweather_config = dict(
    app_key='23f22b04945a57e3400b72e7ff4f36c7',
    cityid='3449324',  # São Caetano do Sul
    format='{main_temp:2.0f}°{units_temperature} {humidity:2.0f}%',
)

groupbox_config = dict(
    borderwidth=2,
    active='#ffffff',
    inactive='#404040',
    disable_drag=True,
    block_highlight_text_color='#ffffff',
    highlight_color='#0f9fdf',
    highlight_method='block'
)

logoff_button = dict(
    filename=icons_dir/'logout.svg',
    foreground='#ffffff',
    background='#ff0000',
    mouse_callbacks={'Button1': lazy.shutdown()},
    decorations=[],
)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(background=next(bg), decorations=[]),
                widget.GroupBox(**groupbox_config, background=next(bg)),
                widget.WindowName(background=next(bg)),
                widget.Clock(format='%A, %d/%m %H:%M', background=next(bg)),
                widget.OpenWeather(**openweather_config, background=next(bg)),
                widget.Image(**logoff_button),
            ],
            20,
        ),
        # wallpaper=wallpapers.WALLPAPER_TILES,
        # wallpaper=wallpapers.WALLPAPER_TRIANGLES,
        wallpaper=wallpapers.WALLPAPER_TRIANGLES_ROUNDED,
        wallpaper_mode="fill"
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], 'Button1', lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], 'Button3', lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], 'Button2', lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = 'smart'
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = 'LG3D'
