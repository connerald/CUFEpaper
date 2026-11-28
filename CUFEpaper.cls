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
\LoadClass[12pt,a4paper,fontset=none]{ctexart}
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
\RequirePackage{nameref} % 引用标题名称
\RequirePackage{listings} % 代码高亮支持
\RequirePackage{xcolor} % 颜色支持
\RequirePackage[
  backend=biber,
  style=gb7714-2015ay,
  gbalign=right,
  gbcitelabel=parensqj
]{biblatex} % 作者-年份制引文，编号制参考文献
\addbibresource{bib/references.bib} % 指定参考文献数据库文件

% 正文与中文字体切换命令共用同一组项目字体。
\renewcommand{\CJKrmdefault}{zhsong}
\renewcommand{\CJKsfdefault}{zhhei}
\renewcommand{\CJKttdefault}{zhsong}
\setCJKmainfont[Path=fonts/, FontIndex=0, AutoFakeBold=3]{simsun.ttc}
\setCJKsansfont[Path=fonts/]{simhei.ttf}
\setCJKfamilyfont{zhkai}[Path=fonts/]{simkai.ttf}
\providecommand{\songti}{\CJKfamily{zhsong}}
\providecommand{\heiti}{\CJKfamily{zhhei}}
\providecommand{\kaishu}{\CJKfamily{zhkai}}
\setmainfont[
    Path=fonts/,
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf
]{times.ttf}
\newfontfamily\CUFEcoverlatin[Path=fonts/]{simkai.ttf}
% ① 至 ⑩ 由当前中文字体排印。
\xeCJKDeclareCharClass{CJK}{"2460 -> "2469}

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

% Word 的 22 磅对应 22bp。先选字号，再固定普通段落的基线距离。
\newdimen\CUFE@line
\CUFE@line=22bp
\newcommand*\CUFEfixedleading{%
  \linespread{1}\fontsize{\f@size}{\CUFE@line}\selectfont}

\AddToHook{begindocument/end}{%
  \let\CUFE@originalstretch\baselinestretch
  \AddToHook{cmd/normalsize/after}{\CUFEfixedleading}%
  \CUFEfixedleading}

% === 中文 section 标题设置 ===
\ctexset{
  section = {
    format = {\zihao{4}\bfseries\CUFEfixedleading\centering},
    name = {,、},           % “一、”
    aftername={\hspace{0pt}},
    number = \chinese{section}
  },
  subsection = {
    format = {\zihao{-4}\bfseries\CUFEfixedleading},
    name = {（,）},         % “（一）”
    aftername={\hspace{0pt}},
    number = \chinese{subsection},
    indent = 2em
  },
  subsubsection = {
    format = {\zihao{-4}\CUFEfixedleading},
    name = {},
    aftername={\hspace{0.5em}},
    number = {\arabic{subsubsection}.}, % “1.”
    indent = 2em
  }
}

% 封面
\newcommand{\makecover}{%
  \begin{titlepage}
    \linespread{\CUFE@originalstretch}\selectfont
    \centering
    {\songti\fontsize{14pt}{22pt}\selectfont
      \vspace*{2\baselineskip}
      \includegraphics[width=0.65\textwidth]{figures/logo/school_logo.png}\par
    } % 这里完全参照中央财经大学课程论文、报告、案例分析考核封面
    % 考核封面的中西文填写栏均用楷体四号。
    {\kaishu\CUFEcoverlatin\fontsize{14pt}{18pt}\selectfont
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

% 独立标题的末行和下文首行之间留一个空行。
\newcommand*\CUFE@centeredheading[2]{%
  \par{\centering #1\CUFEfixedleading #2\par}%
  \addvspace{\CUFE@line}}

\renewenvironment{abstract}{%
  \CUFEfixedleading
  {\centering\heiti\zihao{2}\CUFEfixedleading \@papertitle\par}%
  % 题名至“内容摘要”沿用旧模板的 1.5 cm 留白和三号标题字行。
  \vspace{1.5cm}%
  {\centering\linespread{\CUFE@originalstretch}\zihao{3}\bfseries 内\quad 容\quad 摘\quad 要\par}%
  \addvspace{\CUFE@line}%
}{\par}

% 中文关键词之后空一行接排英文摘要，较长的摘要自然续页。
\newcommand{\makeenabstract}[2]{%
  \par\addvspace{\CUFE@line}%
  {\rmfamily\zihao{-4}\CUFEfixedleading
    \CUFE@centeredheading{\zihao{3}\bfseries}{ABSTRACT}%
    #1\par
    \textbf{KEY WORDS:} #2\par
  }
}

% 目录页设置
\ctexset{
  contentsname = {\zihao{3}\bfseries\CUFEfixedleading 目\qquad 录},
  tocdepth = {2}, % 目录深度 显示到二级标题
}
\AddToHook{cmd/tableofcontents/before}{\clearpage}

% titletoc 分组排标题文字，整条目录与四号标题都要指定行距。
% 一级标题目录样式
\titlecontents{section}[0pt]{\addvspace{0pt}\filright\CUFEfixedleading}%
  {\zihao{4}\bfseries\CUFEfixedleading\contentspush{\thecontentslabel\ }}%
  {\zihao{4}\bfseries\CUFEfixedleading}{\titlerule*[6pt]{·}\contentspage}

% 二级标题目录样式
\titlecontents{subsection}[2em]{\addvspace{0pt}\filright\CUFEfixedleading}%
  {\zihao{4}\CUFEfixedleading\contentspush{\thecontentslabel\ }}%
  {}{\titlerule*[6pt]{·}\contentspage}

% 条目内固定 22 磅，条目之间沿用参考文献样式的段距。
\renewcommand*\bibfont{\normalfont\normalsize\CUFEfixedleading}

% 参考文献页设置
\ctexset{
  bibname = {\zihao{4}\bfseries 参考文献}, % 参考文献标题内容
}

\renewcommand{\mkgbnumlabel}[1]{[{#1}].} % 设置用[]包裹序号并加. 例如[1].

\defbibheading{bibliography}[\bibname]{%
  \section*{#1\vspace*{12pt}}}
