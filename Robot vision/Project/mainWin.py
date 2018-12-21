import tkinter as tk
from tkinter import  *
import tkinter.messagebox
from tkinter.filedialog import *
import seg
import os
from subprocess import Popen, PIPE
import threading
global key
def run():
    global key
    key = 0
    root = tk.Tk()
    root.title('监控视频的前景目标提取')
    root.geometry('350x200')

    var = tk.StringVar()
    var.set('欢迎,请选择对应的模式')
    title = tk.Label(root,textvariable=var,font=('Arial', 12))
    title.place(x=100,y=20,anchor=NW)

    def open1():
        global key
        filename = askopenfilename(initialdir='C:/Users/lenovo/PycharmProjects/segmet/video')
        t = threading.Thread(target=seg.capture(filename,key))
        t.start()
        t.join()
    def open2():
        global  key
        if os.path.exists('./result') == False:
            os.mkdir('./result')
        filename = askopenfilename(initialdir='C:/Users/lenovo/PycharmProjects/segmet/video')
        p = Popen('vibe-gray.exe -i '+filename+' -o ./result/result.avi -ro -n 48',shell=True)
        p.wait()
        if p.poll() != -1:
            seg.show(filename,key=key)

    var1 = tk.IntVar()
    def change_key():
        global key
        if var1.get() == 1 :
            key = 1
        else:
            key = 0

    def about():
        win=Tk()
        win.title('关于本系统')
        win.geometry('270x100')
        Str=''
        with  open('about.txt','r',encoding='UTF-8') as f:
            for line in f.readlines():
                Str += line
        WIN_lable=tk.Label(win,text=Str)
        WIN_lable.pack()
    def hp():
        tk.messagebox.showinfo(title='帮助',message='请查看目录下的使用指南.txt')
    btn_open = tk.Button(root,text='静态背景',command = open1)
    btn_open.place(x=80,y=80,anchor=NW)
    btn_quit = tk.Button(root,text='动态背景',command = open2)
    btn_quit.place(x=200,y=80,anchor=NW)
    check_btn_key = tk.Checkbutton(root,variable = var1,text="显示关键帧",onvalue=1,offvalue=0,command=change_key)
    check_btn_key.place(x=80,y=120,anchor=NW)
    #创建菜单栏
    menubar=Menu(root)
    root.config(menu=menubar)
    menu = Menu(menubar,tearoff=0)
    menubar.add_cascade(label="帮助", menu=menu)
    # 在菜单项下面添加一个名为about的选项
    menu.add_command(label="关于",command=about)
    menu.add_command(label='使用指南',command=hp)
    root.mainloop()

if __name__ == '__main__':
    run()