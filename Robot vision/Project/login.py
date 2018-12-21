import tkinter as tk
from tkinter import  *
import tkinter.messagebox
from tkinter.filedialog import *
import seg
import mainWin
import threading
import pygame

top = Tk()
top.title("监控视频的前景目标提取")
top.geometry('300x200')



label_title = tk.Label(top,text ='请登录系统')
label_title.place(x=120,y=5,anchor=NW)
entry_name = tk.Entry(top,show=None)
entry_pwd = tk.Entry(top,show='*')
label_name = tk.Label(top,text='用户名')
label_pwd = tk.Label(top,text='口令')
label_name.place(x=30,y=55,anchor=NW)
entry_name.place(x=120,y=55,anchor=NW)
label_pwd.place(x=30,y=85,anchor=NW)
entry_pwd.place(x=120,y=85,anchor=NW)

pygame.mixer.init()
track = pygame.mixer.music.load('cheekibreeki.mp3')
is_play = 0
def play_music():
    global is_play
    if is_play == 0:
        pygame.mixer.music.play()
        is_play  = 1
    else :
        is_play = 0
        pygame.mixer.music.stop()


def login():
    usr_name = entry_name.get()
    usr_pwd = entry_pwd.get()

    if usr_name == '123' and usr_pwd == '456':
        tk.messagebox.showinfo(title  ='welcome',message='欢迎,'+str(usr_name))
        top.destroy()
        t = threading.Thread(target=mainWin.run())
        t.start()
        t.join()
    else:
        tk.messagebox.showerror(title='wrong pwd',message='密码或用户名错误')
        play_music()




btn_login = tk.Button(top,text = '登录',command = login,width = 10)
btn_login.place(x=140,y=125,anchor=N)
top.mainloop()
