import os
import sys
import json
import re
import subprocess


home = os.path.expanduser("~")
theme_f = f"{home}/.config/colors/themes.json"

class ThemeManager:
    def __init__(self): 
        #self.theme = 0
        pass


    def get_theme1(self):
        return {'color': ['#3b3e44', '#a63a3a', '#849440', '#de9f5f', '#607d9e', '#88678f', '#5e8c8a', '#80796f', '#545a63', '#cc7070', '#bbbd68', '#f0bc73', '#82a8bf', '#ae93ba', '#8cbfb4', '#c7c5c3'], 'foreground': '#c7c5c3', 'background': '#211f1d'}


    def get_theme(self):
        with open(theme_f, 'r') as f:
            json_data = json.load(f)

            index = json_data["index"]
            themes = json_data["themes"]

        #return themes[index]
        return index, themes

    def choose_theme(self):
        _, themes = self.get_theme()

        names = "\\n".join([t['name'] for t in themes]) 
        print(names)
        
        choice = os.popen(f"printf '{names}' | rofi -show drun -dmenu -theme mine").read()[:-1]
        print(f"You chose {choice}")

        self.change_theme(name=choice)

    def change_theme(self, name=None, update=False):
        print("Next theme", name)
        with open(theme_f, 'r') as f:
            json_data = json.load(f)
            index = json_data["index"]
            themes = json_data["themes"]
            
        # name is the name of the theme, if no theme is found with that name the theme shall not change
        if update:
            pass
        elif name == None:
            index = int((index + 1) % len(themes))
        else:
            i = 0
            for t in themes:
                if t["name"] == name:
                    index = i
                    break
                i += 1

            if i >= len(themes):
                return None

        theme = themes[index]
        cmap = theme["map"]
        cols = theme["color"]
        
        self.update_alacritty(
                theme["background"], 
                theme["foreground"], 
                theme["color"])
       
        self.update_polybar(
                theme["background"], 
                theme["foreground"], 
                cols, cmap)
        
        self.update_rofi(
                theme["foreground"],    # txt 
                theme["foreground"],    # l_bg
                theme["background"],    # bg
                theme["color"][3+8],    # red
                theme["color"][6],      # orange
                cols[cmap["act"]])      # blue

        self.update_zathura(
                bg=theme["background"],    # bg
                fg=theme["foreground"],    # fg
                c1=theme["color"][6],      # c1
                c2=theme["color"][6+8]     # c2
                )

        self.update_gtk(
                theme["gtk-theme"], 
                theme["gtk-icons"]
                )
        
        self.update_vim(
                theme["vim-theme"] 
                )

        # MUST BE LAST because it's here where i3 is updated
        self.update_i3(
                theme["background"],    # bg
                theme["foreground"],    # brd
                cols[cmap["brd"]],      # brd_i
                theme["foreground"])    # txt

        print("bg name: " + theme["name"])

        self.change_bg(theme)

        with open(theme_f, 'w') as f1:
            json_data["index"] = index
            
            json.dump(json_data, f1, indent=4)


    def change_bg(self, theme):
        
        #home = os.path.expanduser("~")
        f = None
        f1 = None
        name = theme["name"]
        print("chegada: " + name)
        try:
            f = open(theme["name"])
        except IOError:
            name = home+'/.config/colors/'+theme["name"]+'.jpg'
            try:
                f1 = open(home+'/.config/colors/'+theme["name"]+'.jpg')
            except IOError:
                col = hex_to_rgb(theme["background"])

                from PIL import Image, ImageDraw
                
                image = Image.new("RGB", (1920, 1080), col)
                image.save(home+'/.config/colors/'+theme["name"]+'.jpg')
            finally:
                if f1 is not None:
                    f1.close()
        finally:
            if f is not None:
                f.close()

        print(name)
        os.system(f'feh --bg-scale {name} &')

    
    def update_polybar(self, background, foreground, cols, cmap):
        f_dir = f"{home}/.config/polybar/template.ini"

        with open(f_dir, 'r') as f:
            f_str = "".join(f.readlines())
        
        f_str = f_str.format(bg=background, fg=foreground, 
                bga = cols[cmap['bg']],
                fga = cols[cmap['fg']],
                act = cols[cmap['act']],
                brd = cols[cmap['brd']],
                txt = cols[cmap['txt']])

        with open(f"{home}/.config/polybar/colors.ini", 'w') as poly:
            poly.write(f_str)

        subprocess.Popen(f"bash {home}/.config/polybar/launch.sh".split())

        return f_str


    def update_alacritty(self, background, foreground, colors):
        f_dir = f"{home}/.config/alacritty/template.toml"

        with open(f_dir, 'r') as f:
            f_str = "".join(f.readlines())

        f_str = f_str.format(bg=background, fg=foreground, cols=colors)

        with open(f"{home}/.config/alacritty/alacritty.toml", 'w') as alac:
            alac.write(f_str)

        return f_str

    def update_i3(self, bg, brd, brd_i, txt):
        f_dir = f"{home}/.config/i3/colors.txt"

        with open(f_dir, 'r') as f:
            f_str = "".join(f.readlines())
        
        f_str = f_str.format(bg=bg, brd=brd, brd_i=brd_i, txt=txt)

        f_cfg = f"{home}/.config/i3/config"

        with open(f_cfg+".template", 'r') as f:
            cfg = "".join(f.readlines())

        cfg = f_str + cfg

        with open(f_cfg, 'w') as i3:
            i3.write(cfg)

        subprocess.Popen(f"i3 reload".split())

        return cfg


    def update_rofi(self, txt, l_bg, bg, red, orange, blue):
        css_vals = [
                f"text-color:                  {txt};\n",
                f"background-color:            {bg};\n",
                f"lightbg:                     {l_bg};\n",
                f"red:                         {red};\n",
                f"orange:                      {orange};\n",
                f"blue:                        {blue};\n"
                ]

        f_dir = f"{home}/.config/rofi/template.css"

        with open(f_dir, 'r') as f:
            lns = f.readlines()
        
        lns[4:10] = css_vals
        lns = "".join(lns)

        f_cfg = f"{home}/.config/rofi/mine.rasi"

        with open(f_cfg, 'w') as rofi:
            rofi.write(lns)

    def update_zathura(self, bg, fg, c1, c2):
        f_dir = f"{home}/.config/zathura/zathurarc.template"

        with open(f_dir, 'r') as f:
            f_str = "".join(f.readlines())

        f_str = f_str.format(bg=bg, fg=fg, c1=c1, c2=c2)

        with open(f"{home}/.config/zathura/zathurarc", 'w') as zath:
            zath.write(f_str)

        return f_str


    def update_gtk(self, themen, icons):
        f_dir = f"{home}/.config/xsettingsd/template.conf"
        
        with open(f_dir, 'r') as f:
            f_str = f.read()

        f_str = f_str.format(gtk_theme=themen, gtk_icons=icons)
        
        with open(f"{home}/.config/xsettingsd/xsettingsd.conf", 'w') as f:
            f.write(f_str)

        os.system("killall -HUP xsettingsd")
        return f_str
#        f_dir = f"{home}/.config/gtk-3.0/settings.template"
#
#        with open(f_dir, 'r') as f:
#            f_str = "".join(f.readlines())
#
#        f_str = f_str.format(gtk_theme=themen, gtk_icons=icons)
#
#        with open(f"{home}/.config/gtk-3.0/settings.ini", 'w') as gtk:
#            gtk.write(f_str)
#
#        return f_str


    def update_vim(self, vim_theme):
        f_dir = f"{home}/.config/vim/vimrc"

        with open(f_dir, 'r') as f:
            f_str = f.read()

        f_str = f_str.format(theme=vim_theme)

        with open(f"{home}/.vimrc", 'w') as zath:
            zath.write(f_str)

        return f_str
        

def hex_to_rgb(value):
    value = value[1:]
    lv = len(value)
    return tuple(int(value[i:i + lv // 3], 16) for i in range(0, lv, lv // 3))

#import sys
#
#if __name__ == "__main__":
#    if sys.argv[1] == "i":
#        ThemeManager().convert_pywal()
#        exit()
