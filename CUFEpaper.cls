%% CUFEpaper.cls
%% Copyright 2025 Connerald
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Connerald.
%
% This work consists of the files CUFEpaper.tex and CUFEpaper.cls
% and the derived file CUFEpaper.pdf.

% 本模板遵循 LaTeX Project Public License (LPPL)，允许自由使用、分发和修改，但请保留本版权声明。
% 本模板按“原样”提供，不附带任何明示或暗示的担保，包括但不限于适销性或特定用途适用性的担保。使用本模板所产生的任何后果，作者不承担任何责任。

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CUFEpaper}[2025/05/08 CUFE Paper Class]
\LoadClass[12pt,a4paper]{ctexart}
\RequirePackage[heading=true]{ctex}  % 中文支持
\RequirePackage[top=2.54cm, bottom=2.54cm, left=2.5cm, right=2.5cm]{geometry} % 页边距
\RequirePackage{graphicx} % 插图支持
\RequirePackage{titlesec} % 控制标题格式
\RequirePackage{zhnumber} % 中文数字支持
\RequirePackage{titletoc} % 控制目录格式
\RequirePackage{fancyhdr} % 页眉页脚
\RequirePackage{amsmath} % 数学公式支持
\RequirePackage{amsfonts} % 数学字体支持
\RequirePackage{amssymb} % 数学符号支持
\RequirePackage{hyperref} % 超链接支持
\RequirePackage{setspace} % 行距设置
\RequirePackage{float} % 浮动体支持
\RequirePackage{tabularx} % 表格支持
\RequirePackage{makecell} % 表格单元格支持
\RequirePackage[
  backend=biber,
  style=gb7714-2015ay,
  gbalign=right,
  gbcitelabel=parensqj
]{biblatex} % 作者-年份制引文，编号制参考文献
\addbibresource{references.bib} % 指定参考文献数据库文件

% 字体设置
\setCJKmainfont[AutoFakeBold=3]{simsun.ttc}
\setmainfont{Times New Roman} % 修改mainfont为Times New Roman 否则默认的字体为弯尾版本

\pagestyle{plain} % 只显示页码，不显示页眉

% 超链接设置
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    urlcolor=black
}

% Setter命令和默认值
\newcommand\term[1]{\def\@term{#1}}
\newcommand\course[1]{\def\@course{#1}}
\newcommand\code[1]{\def\@code{#1}}
\newcommand\teacher[1]{\def\@teacher{#1}}
\newcommand\name[1]{\def\@name{#1}}
\newcommand\stuid[1]{\def\@stuid{#1}}
\newcommand\class[1]{\def\@class{#1}}
\newcommand\score[1]{\def\@score{#1}}
\newcommand\grader[1]{\def\@grader{#1}}
\newcommand\papertitle[1]{\def\@papertitle{#1}}

% 功能：定宽下划线，内容居中，防止内容向左溢出
\def\CenterUnderlineBox[#1]#2{\underline{\hbox to #1{\hfil#2\hfil}}}

% === 中文 section 标题设置 ===
\ctexset{
  section = {
    format = {\zihao{4}\bfseries\centering},
    name = {,、},           % “一、”
    aftername={\hspace{0pt}},
    number = \chinese{section}
  },
  subsection = {
    format = {\zihao{-4}\bfseries},
    name = {（,）},         % “（一）”
    aftername={\hspace{0pt}},
    number = \chinese{subsection},
    indent = 2em
  },
  subsubsection = {
    format = {\zihao{-4}},
    name = {},
    aftername={\hspace{0.5em}},
    number = {\arabic{subsubsection}.}, % “1.”
    indent = 2em
  }
}

% 封面
\newcommand{\makecover}{%
  \begin{titlepage}
    \centering
    {\songti\fontsize{14pt}{22pt}\selectfont
      \vspace*{2\baselineskip}
      \includegraphics[width=0.65\textwidth]{figures/logo/school_logo.png}\par
    } % 这里完全参照中央财经大学课程论文、报告、案例分析考核封面
    % 封面表格部分，楷体小四号，双倍行距
    {\kaishu\fontsize{14pt}{18pt}\selectfont
      \vspace{1\baselineskip}
      \renewcommand{\baselinestretch}{2.0}\selectfont
      学年学期：\CenterUnderlineBox[8cm]{\@term}\\
      课程名称：\CenterUnderlineBox[8cm]{\@course}\\
      课程代码：\CenterUnderlineBox[8cm]{\@code}\\
      任课教师：\CenterUnderlineBox[8cm]{\@teacher}\\
      姓\hspace{2em}名：\CenterUnderlineBox[8cm]{\@name}\\
      学\hspace{2em}号：\CenterUnderlineBox[8cm]{\@stuid}\\
      班\hspace{2em}级：\CenterUnderlineBox[8cm]{\@class}\\
      \vspace{1\baselineskip}
      总\hspace{2em}分：\CenterUnderlineBox[8cm]{\@score}\\
      评\hspace{1ex}分\hspace{1ex}人：\CenterUnderlineBox[8cm]{\@grader}\\
    }
  \end{titlepage}
}

% 摘要页设置
% 中文摘要页（重定义abstract环境）
\ctexset{
  abstractname={\zihao{3}\bfseries 内\quad 容\quad 摘\quad 要}, % 摘要标题
}

\renewenvironment{abstract}{%
  \begin{center}
    {\heiti\zihao{2} \@papertitle \par} % 论文标题，黑体二号
    \vspace{1.5cm}
    {\zihao{3}\bfseries 内\quad 容\quad 摘\quad 要 \par} % 内容摘要，宋体三号加粗
    \vspace{0.5cm}
  \end{center}
  \renewcommand{\baselinestretch}{1.5}\selectfont % 摘要内容行距1.5倍
  \par
}{
  \par
  \clearpage
}

% 英文摘要页（可选）
\newcommand{\makeenabstract}[2]{%
  \clearpage
  \thispagestyle{empty}
  \begin{center}
    {\heiti\zihao{2} \@papertitle \par}
    \vspace{1.5cm}
    {\rmfamily\zihao{3}\bfseries ABSTRACT \par}
    \vspace{0.5cm}
  \end{center}
  \renewcommand{\baselinestretch}{1.5}\selectfont
  {\rmfamily\zihao{-4}
    \par
    #1
  }
  \par
  \textbf{KEYWORDS:} #2
  \clearpage
}

% 目录页设置
\ctexset{
  contentsname = {\zihao{3}\bfseries 目\qquad 录}, % 目录标题内容（两个全角空格）
  tocdepth = {2}, % 目录深度 显示到二级标题
}

% 一级标题目录样式
\titlecontents{section}[0pt]{\addvspace{0pt}\filright}%
  {\zihao{4}\bfseries\contentspush{\thecontentslabel\ }}%
  {}{\titlerule*[6pt]{·}\contentspage}

% 二级标题目录样式
\titlecontents{subsection}[2em]{\addvspace{0pt}\filright}%
  {\zihao{4}\contentspush{\thecontentslabel\ }}%
  {}{\titlerule*[6pt]{·}\contentspage}

% 参考文献页设置
\ctexset{
  bibname = {\zihao{4}\bfseries 参考文献}, % 参考文献标题内容
}

\renewcommand{\mkgbnumlabel}[1]{[{#1}].} % 设置用[]包裹序号并加. 例如[1].

\defbibheading{bibliography}[\bibname]{%
  \section*{#1\vspace*{12pt}}}