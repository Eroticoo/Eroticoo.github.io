# 步骤 1：运行自动化脚本

在您的博客项目根目录下，运行自动化脚本：
cd "/Users/erotico/Desktop/Master/All Code/Pycode/Eroticoo.github.io"
./auto_update.sh

# 步骤 2：输入文章标题

脚本会提示您输入文章标题，例如：
**请输入文章标题: 我的新博客文章**

# 步骤 3：脚本自动创建新文章并推送

脚本会自动：
	•	创建新的 Markdown 文件，位于 _posts 目录下，文件名格式为 YYYY-MM-DD-标题.md。
	•	添加基本的 Front Matter，包括精确到秒的时间戳。
	•	执行 git add .、git commit 和 git push，将新文章初始版本推送到 GitHub。

# 步骤 4：编辑新创建的文章

虽然脚本已经创建了新文章并推送，但默认内容只是一个模板，您需要编辑文章内容。
	1.	找到新文章文件
在 _posts 目录下，找到新创建的 Markdown 文件，例如：
_posts/2023-10-25-wo-de-xin-bo-ke-wen-zhang.md
 	2.	使用文本编辑器打开文件
您可以使用您喜欢的编辑器，如 VS Code、Sublime Text、Notepad++、Vim 等。
使用 VS Code：
	3.	编辑文章内容
在文件中，添加实际的文章内容。
示例：

# 步骤 5：提交并推送修改

由于您修改了文章内容，需要将更改提交并推送到 GitHub。**bash**
	1.	添加更改到 Git 
    git add "_posts/2023-10-25-wo-de-xin-bo-ke-wen-zhang.md"
	2.	提交更改
    git commit -m "更新文章内容：我的新博客文章"
    3.	推送到 GitHub
    git push origin main


    all in all：

    git add "_posts/文件名.md"
    git commit -m "更新文章内容：文章标题"
    git push origin main