# CUFEpaper

**自用的中央财经大学（CUFE）LaTeX 论文模板。** 课程论文模板已可使用，本科毕业论文模板正在规划。

| 想写哪种论文 | 从哪里开始 |
| --- | --- |
| 课程论文、报告或案例分析 | 编辑 [CUFEpaper.tex](CUFEpaper.tex)，可先看[课程论文 PDF 示例](CUFEpaper.pdf)。 |
| 本科毕业论文（undergraduate thesis） | LaTeX 入口待开发。现阶段可查阅[教务处格式要求、封面和声明](docs/template-sources/undergraduate-thesis/本科毕业论文材料（2025届及以后）/)及[知网学生端 Word 示例](docs/template-sources/undergraduate-thesis/cnki/中央财经大学通用本科生毕业论文（设计）模板.docx)。 |

本模板代码遵循 LaTeX Project Public License (LPPL)，允许自由使用、分发和修改，但请保留本版权声明。字体文件适用各自的许可。
本模板按“原样”提供，不附带任何明示或暗示的担保，包括但不限于适销性或特定用途适用性的担保。使用本模板所产生的任何后果，作者不承担任何责任。  

## 课程论文使用方法

1. 克隆本仓库。
   ```sh
   git clone https://github.com/Connerald/CUFEpaper.git
   ```
   或直接点击右上角 Code -> Download ZIP 下载/或右侧菜单直接下载最新 Releases 版本

2. 编辑 `CUFEpaper.tex`，填写课程、姓名、学号等信息，填入文章内容。

3. 按下方编译说明生成 PDF，并按任课教师的要求核对提交格式。

## 编译说明

使用 XeLaTeX 和 Biber 编译 `CUFEpaper.tex`，请保留 [fonts/](fonts/) 中的七个字体文件及其原名。

如果你使用 **TeXstudio**，可以在“选项” → “配置 TeXstudio” → “构建” → “用户命令”中添加如下自定义编译链：

```bash
xelatex %.tex | biber % | xelatex %.tex | xelatex %.tex
```

然后在“构建”菜单里选择刚刚创建的命令即可完成完整编译流程。

### 详细步骤：

1. 打开 TeXstudio，进入“选项” → “配置 TeXstudio” → “构建”。

2. 在“用户命令”里添加一个新命令，命名如 `xelatex+biber`，内容为：

   ```
   xelatex %.tex | biber % | xelatex %.tex | xelatex %.tex
   ```

3. 回到主界面，从“构建”菜单选择刚添加的 `xelatex+biber` 命令进行编译。

## 课程论文的适用范围

封面采用中央财经大学课程论文考核封面，正文参照金融学院的课程论文样例和写作格式。学校期末考核通知要求开课单位规定正文格式，允许参照毕业论文格式，具体以本门课程的布置为准。[教务处通知（创新发展学院转载）](https://sind.cufe.edu.cn/info/1029/1155.htm)

金融学院 2024 年 5 月版出题模板要求第一页放封面，第二页首行写论文题目，随后写摘要，英文摘要和英文关键词可省略。当前示例会生成英文摘要页，按该要求交稿时，可在 `CUFEpaper.tex` 中删去整段 `\makeenabstract{…}{…}` 调用。编译封面时请保留 `figures/logo/school_logo.png`。[金融学院课程论文材料（附件 1 至 4）](https://sf.cufe.edu.cn/info/1121/11752.htm)

## 已支持功能

- 自动封面生成
- 中文/英文摘要页
- 目录自动生成，点线填充
- 章节标题中文编号（如“一、”“（一）”）
- 宋体中文正文
- 章节标题、目录样式
- 作者-年份制引文，编号制参考文献
- 表格支持

## 待完善的功能

下一轮按两种论文分别校样，保留现有课程论文的编译入口。

1. **课程论文。** 按金融学院附件 1、3、4 调整示例中的摘要，核对固定 22 磅行距、分段页码和参考文献的引用先后顺序。
2. **本科毕业论文。** 新增独立的 LaTeX 入口，先按全校通用格式完成封面、中外文摘要、目录、正文、参考文献、声明和致谢，说明五张过程表的装订位置。法学院、社会与心理学院心理学系、外国语学院的专门格式见教务处原包。
3. **验证共用样式。** 分别编译两份示例，对照各自原件检查封面字段、页码和文献顺序，再提取两者一致的排版设置。

课程论文另有以下排版细节待完善。

- 图片注解
- 代码展示
- 数学公式

## 参考资料

1. 中央财经大学金融学院（2022-05-24）。《本科课程论文考核出题模板、报告格式等》。[学院发布页](https://sf.cufe.edu.cn/info/1121/11752.htm)

   - 附件 1《〈XXX〉课程期末论文考核出题模板》（202405）。[Word 原件](docs/template-sources/course-paper/附件1：《XXX》课程期末论文考核出题模板-202405.docx)
   - 附件 2《中央财经大学课程论文、报告、案例分析考核封面》。[Word 原件](docs/template-sources/course-paper/附件2：中央财经大学课程论文、报告、案例分析考核封面.docx) · [仓库 PDF 预览](docs/template-sources/course-paper/附件2：中央财经大学课程论文、报告、案例分析考核封面.pdf)
   - 附件 3《课程论文、报告模板（参照本科生毕业论文模板）》。[Word 原件](docs/template-sources/course-paper/附件3：课程论文、报告模板（参照本科生毕业论文模板）.doc) · [仓库 PDF 预览](docs/template-sources/course-paper/附件3：课程论文、报告模板（参照本科生毕业论文模板）.pdf)
   - 附件 4《课程论文、报告写作格式（参照本科生毕业论文格式要求）》。[Word 原件](docs/template-sources/course-paper/附件4：课程论文、报告写作格式（参照本科生毕业论文格式要求）.doc)

2. 中央财经大学教务处（2024-03-01）。《本科毕业论文材料（2025届及以后）》。本科毕业论文通用模板以该材料包中的全校版为准。[教务处发布页及完整材料包](https://jwc.cufe.edu.cn/info/1124/3608.htm)

   - [附件 1《本科生毕业论文（设计）格式要求（全校本科生）》](docs/template-sources/undergraduate-thesis/本科毕业论文材料（2025届及以后）/本科生毕业论文%28设计）格式要求/附件1：本科生毕业论文（设计）格式要求（全校本科生）.pdf)
   - [本科生毕业论文（设计）封面](docs/template-sources/undergraduate-thesis/本科毕业论文材料（2025届及以后）/本科生毕业论文（设计）封面.docx)
   - [本科生毕业论文（设计）开题报告表](docs/template-sources/undergraduate-thesis/本科毕业论文材料（2025届及以后）/本科生毕业论文（设计）开题报告表.doc)
   - [本科生毕业论文（设计）指导过程记录表](docs/template-sources/undergraduate-thesis/本科毕业论文材料（2025届及以后）/本科生毕业论文（设计）指导过程记录表.doc)
   - [本科生毕业论文（设计）中期检查表](docs/template-sources/undergraduate-thesis/本科毕业论文材料（2025届及以后）/本科生毕业论文（设计）中期检查表.doc)
   - [本科生毕业论文（设计）推荐答辩意见书](docs/template-sources/undergraduate-thesis/本科毕业论文材料（2025届及以后）/本科生毕业论文（设计）推荐答辩意见书.doc)
   - [本科生毕业论文（设计）答辩记录表](docs/template-sources/undergraduate-thesis/本科毕业论文材料（2025届及以后）/本科生毕业论文（设计）答辩记录表.doc)
   - [本科生毕业论文（设计）原创性声明（含版权使用授权书）](docs/template-sources/undergraduate-thesis/本科毕业论文材料（2025届及以后）/本科生毕业论文（设计）原创性声明.docx)

3. 中央财经大学教务处（2026-11-13）。《关于做好2027届本科生毕业论文（设计）工作的通知》（教字〔2026〕174 号）。第四条指定《中央财经大学本科生毕业论文（设计）撰写规范》（校发〔2024〕51 号），第五条列出装订顺序。[教务处通知](https://jwc.cufe.edu.cn/info/1101/8339.htm)

4. 中央财经大学教务处（2022-11-29）。《关于做好2022年秋季学期本科生期末课程考核工作的通知》。第六条说明课程论文的考核封面和正文格式要求。[创新发展学院转载](https://sind.cufe.edu.cn/info/1029/1155.htm)

5. 中国知网大学生毕业论文管理系统（学生端）。《中央财经大学通用本科生毕业论文（设计）模板》。用于对照 Word 排版效果。[本地 Word 示例](docs/template-sources/undergraduate-thesis/cnki/中央财经大学通用本科生毕业论文（设计）模板.docx)

6. CTeX 宏集（2022-07-14）。《CTeX 宏集手册》。[手册全文](https://texdoc.org/serve/ctex/0)

7. biblatex-gb7714-2015（2025-03-03）。《符合 GB/T 7714-2015 标准的 biblatex 参考文献样式》。[样式手册全文](https://ctan.math.illinois.edu/macros/latex/contrib/biblatex-contrib/biblatex-gb7714-2015/biblatex-gb7714-2015.pdf)

教务处全校版与知网示例的逐项差异见[参考资料核对记录](docs/template-sources/README.md#全校版与知网示例的差异)，核对日期为 2026-11-24。
