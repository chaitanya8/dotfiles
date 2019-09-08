# i3wm : Setup Automatic Display Switching

## Credits
* [ARandR][l_arandr]
* [autorandr][l_autorandr]

## Steps
1. Install autorandr

```sudo apt install autorandr arandr```

2. Disconnect all except your primary display (such as your laptop display only)

```autorandr --save mobile```

3. Connect an additional display (eg. laptop + external), configure it using **arandr**. You can set a particular display as primary. Save the setup:

```autorandr --save docked```

4. Check if your configurations are listed and shown as activated. 

```bash
$ autorandr
  mobile
  docked (detected)
```

5. Enable Service using below command, provide password wherever needed.
```bash
systemctl enable autorandr
```

Now whenever you plug/unplug display, autorandr should switch the layout accordingly.

## Pro Tip
If you want to perform some operations based on what display setup you are using, you can put trigger scripts for the same. Refer to [advanced section][l_autorandr_adv] on autorandr Github page



[l_autorandr]: https://github.com/phillipberndt/autorandr
[l_autorandr_adv]: https://github.com/phillipberndt/autorandr#advanced-usage
[l_arandr]: https://christian.amsuess.com/tools/arandr
