# github-hosts
对hosts自动处理，动态添加Github的hosts映射，进而处理github无法访问的情况。
+ 你还在为访问不到github而烦恼吗？快双击github.bat吧！

# 执行
右击运行|双击运行Bat文件（需要提供管理员权限）；
+ 管理员权限是因为需要修改hosts文件

高级执行：
+ 您可以给windows添加定时任务，从而实现bat定时，定频率长期执行。
+ windows定时任务的创建请自行寻找方法（关键词：bat的定时执行）

# 创建原因
本人发现github无法访问的根本原因是国内对github采用了DNS污染的方式进行“隔离”。

个人用过 `SwitchHosts` 因为觉得太过于繁琐，不就是一个hosts文件的管理嘛？为什么弄得那么复杂。
+ 我为什么不用Github520自己实现hosts文件的刷新呢？

解决思路：
+ 既然是通过DNS污染解决的那么就可以通过hosts|也就是直接指定ip进行访问
+ 而windows中最好的方式就bat的批处理方式
+ 如果各位想实现Mac和Linux，可以自己编写批处理文件！

# 感谢
唯一致谢：[Github520](https://gitee.com/inChoong/GitHub520)

其接口大大简化了我的开发的路程，且提供的ip非常完善。
+ api地址：https://raw.fastgit.org/521xueweihan/GitHub520/main/hosts
+ 如果不想用此api地址，可以通过 [IPAddress](https://www.ipaddress.com/) 来实现手动爬取解析的ip地址结果
