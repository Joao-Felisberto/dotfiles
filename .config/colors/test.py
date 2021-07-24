import sys

from theme import ThemeManager

# no arg        - reloads
# -s <theme>    - sets the theme
# -n            - switches to the next

print(len(sys.argv))
tm = ThemeManager()

if len(sys.argv) == 1:
    tm.change_theme(update=True)
    sys.exit()

if sys.argv[1] == '-n':
    tm.change_theme()
    sys.exit()

if sys.argv[1] == '-s':
    if len(sys.argv) < 3:
        sys.exit("Provide a theme")

    tm.change_theme(name="".join(sys.argv[2:]))
