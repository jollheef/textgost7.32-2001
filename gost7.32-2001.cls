\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gost7.32-2001}[2017/05/27]
\LoadClass[12pt, final, a4paper, oneside]{extarticle}

\RequirePackage{polyglossia}  %% подключает пакет многоязыкой вёрстки
\newfontfamily{\cyrillicfont}{Liberation Serif}
%\setmainfont{Times New Roman}  %% задаёт основной шрифт документа
\setmainfont{Liberation Serif}  %% задаёт основной шрифт документа
\setsansfont{Liberation Sans}  %% задаёт шрифт без засечек
\setmonofont{Liberation Mono}  %% задаёт моноширинный шрифт
\defaultfontfeatures{Scale=MatchLowercase, Mapping=tex-text}  %% устанавливает поведение шрифтов по умолчанию
\setdefaultlanguage{russian}  %% устанавливает язык по умолчанию
\setotherlanguage{english}

\tolerance=1000
\sloppy
\RequirePackage[biblabel]{cite}
\RequirePackage{hyphenat}
\RequirePackage{indentfirst}
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage{lastpage}
\RequirePackage{tocloft}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{caption}    %TODO: Проверить пакеты на используемость
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{wrapfig}
\RequirePackage{lscape}
\RequirePackage{mathtools}
\RequirePackage{tabularx}
\RequirePackage{titlesec}
\RequirePackage{etoolbox}
\RequirePackage[left=3cm, right=1cm, top=2cm, bottom=2cm]{geometry}
\RequirePackage{listings}
\RequirePackage{multicol}
\RequirePackage{ragged2e}
\RequirePackage{eqparbox}
\RequirePackage{ulem}
\RequirePackage{afterpage}

%\pretolerance10000 % запрет переносов
\clubpenalty=10000  % откл. висячих
\widowpenalty=10000 %               строк
\setlength\parindent{1.5cm}
\pagestyle{plain}
\RequirePackage{setspace}
\setstretch{1.5} %полуторный интервал
%\parindent=1.5cm % отступ красной строки
\righthyphenmin=2 %кол-во букв, которые можно переносить
%\fussy

\newcommand{\dash}{ – }

% 115%
\renewcommand{\tiny}{\fontsize{7}{8.05pt}\selectfont}
\renewcommand{\scriptsize}{\fontsize{9}{10.35pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{11}{12.65pt}\selectfont}
\renewcommand{\small}{\fontsize{12}{13.8pt}\selectfont}
\renewcommand{\normalsize}{\fontsize{14}{16.1pt}\selectfont}
\renewcommand{\large}{\fontsize{16}{18.4pt}\selectfont}
\renewcommand{\Large}{\fontsize{18}{20.7pt}\selectfont}
\renewcommand{\LARGE}{\fontsize{20}{23pt}\selectfont}

%Подпись для рисунков
\DeclareCaptionLabelSeparator{dash}{ {\textemdash} }
\captionsetup{
  format=plain,
  justification=centering,
  labelsep=dash,
  font=normalsize,
  figurename=Рисунок}

%Подпись для таблиц
\captionsetup[table]{
  justification=raggedright,
  singlelinecheck=off}

\DeclareCaptionLabelFormat{continued}{{Продолжение таблицы} #2}

%Добавление изображения. Параметры:
%1 -- путь к картинке; 2 -- подпись; 3 -- label.
\newcommand{\gostfig}[3]{ 
\begin{figure}[H]
  \centering
  \includegraphics[width=\linewidth]{#1}
  \caption{#2}
  \label{#3}
\end{figure} }

\makeatletter % @ -> letter 
\newcommand*{\Ralph}[1]{\@Ralph{\@nameuse{c@#1}}}
\newcommand*{\@Ralph}[1]%
{\ifcase #1\or А\or Б\or В\or Г\or Д\or Е\or Ж\or И\or К\or Л\or М\or Н%
\or П\or Р\or С\or Т\or У\or Ф\or Х\or Ц\or Ш\or Щ\or Э\or Ю\or Я%
\else\@ctrerr \fi}

\renewcommand*{\alph}[1]{\@ralph{\@nameuse{c@#1}}} % если создать новую команду, почему-то не работает
\newcommand*{\@ralph}[1]%
{\ifcase #1\or а\or б\or в\or г\or д\or е\or ж\or и\or к\or л\or м\or н%
\or п\or р\or с\or т\or у\or ф\or х\or ц\or ш\or щ\or э\or ю\or я%
\else\@ctrerr \fi}

\renewcommand{\theparagraph}{%
\ifnum \c@subsection >0
\thesubsection.\@arabic\c@paragraph%
\else
\thesection.\@arabic\c@paragraph%
\fi}
\@addtoreset{paragraph}{subsection} % подчинение счетчика

\renewcommand{\theequation}{
  \ifnum \c@app > 0
  \theapp.\@arabic\c@equation
  \else
  \@arabic\c@equation
  \fi
}
\makeatother % letter -> @

\renewcommand{\theenumi}{\alph{enumi}}
\renewcommand{\theenumii}{\arabic{enumii}}

%перечисления
\setlist{nolistsep}
\setitemize[1]{label=\dash, fullwidth, itemindent=\parindent,
  listparindent=\parindent}% для дефисного списка
\setitemize[2]{label=\dash, fullwidth, itemindent=\parindent, leftmargin=1.5cm,
  listparindent=\parindent}

\setenumerate[1]{label=\theenumi), fullwidth, itemindent=\parindent, 
  listparindent=\parindent}% для нумерованного списка
\setenumerate[2]{label=\theenumii), fullwidth, itemindent=\parindent, leftmargin=1.5cm,
  listparindent=\parindent}%, labelwidth=-1.5cm}

\renewcommand{\cfttoctitlefont}{\hfil \normalsize}
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

\renewcommand*{\section}[1]{%
\refstepcounter{section}%
{\par\normalfont\normalsize\thesection\hspace{1ex}#1\par\nopagebreak%
\addcontentsline{toc}{section}{\thesection\hspace{1ex}#1}%
\setcounter{paragraph}{0}%
}}

\renewcommand*{\subsection}[1]{%
\refstepcounter{subsection}%
{\par\normalfont\normalsize\thesubsection\hspace{1ex}#1\par\nopagebreak%
\addcontentsline{toc}{subsection}{\thesubsection\hspace{1ex}#1}%
}}

\renewcommand{\paragraph}[1]{%
\refstepcounter{paragraph}%
{\par\normalfont\normalsize% заголовок
  \def\temp{}%    для проверки есть ли
  \def\tempa{#1}%                      параметр 
  \ifx\temp\tempa
  \theparagraph\hspace{1ex}%
  \else
  \theparagraph\hspace{1ex}#1\par\nopagebreak%
  \addcontentsline{toc}{paragraph}{\theparagraph\hspace{1ex}#1}%
  \fi%
}}


\renewcommand{\subparagraph}{%
\refstepcounter{subparagraph}%
{\par\thesubparagraph\hspace{1ex}}}


%Для специальных заголовков
\newcommand*{\specsec}[1]{%
{\parindent=0cm\par\normalfont\normalsize\filcenter#1% заголовок
\par% закончить заголовок
}}

% Заголовки для введения, заключения, списка литературы и прочего, что должно входить
% в содержание и не имеет нумерации
\newcommand*{\specsection}[1]{\clearpage%
  \specsec{\MakeUppercase{#1}}%
\addcontentsline{toc}{section}{#1}%
}

% Заголовки для реферата, терминов и определений и прочего, что не входит в содержание и не имеет нумерации
\newcommand*{\anonsection}[1]{\clearpage\specsec{\MakeUppercase{#1}}} 

\newcounter{app}
\renewcommand{\theapp}{\Ralph{app}}
\newcounter{eqcntr}

%титульник приложений #1 -- Название приложения, #2 -- label%
\newcommand*{\appsection}[2]{\refstepcounter{app}%
\setcounter{equation}{0}
\clearpage\null\vfill%
\specsec{Приложение~\theapp\\(обязательное)\\{#1}}%
\addcontentsline{toc}{section}{Приложение~\theapp~#1}\label{#2}%
\vfill\vfill\newpage}



\addto\captionsrussian{%
\renewcommand{\refname}{Список использованных источников}%
\renewcommand{\contentsname}{\normalsize{СОДЕРЖАНИЕ}}%
%\renewcommand{\tableofcontents}{\specsection{\contentsname}\@starttoc{toc}}%
}

\makeatletter % @ -> letter 
% Содержание
\renewcommand{\l@section}{\@dottedtocline{1}{0cm}{0em}}
\renewcommand{\l@subsection}{\@dottedtocline{2}{1.25cm}{-2.5em}}
\renewcommand{\l@paragraph}{\@dottedtocline{3}{2.5cm}{-5em}}

\renewcommand{\@biblabel}[1]{\hspace{1.5cm}#1\hspace{1ex}}

\newcounter{biblio}
\renewenvironment{thebibliography}
     {\specsection{\refname}%
      \list{\@biblabel{\@arabic\c@biblio}}%
           {\setlength{\leftmargin}{0cm}
            \setlength{\labelsep}{0ex}
            \setlength{\labelwidth}{0cm}
            \@openbib@code
            \usecounter{biblio}%
            \let\p@enumiv\@empty
            \renewcommand\thebiblio{\@arabic\c@biblio}
            \setlength{\topsep}{0pt}
            \setlength{\partopsep}{0pt}
            \setlength{\parskip}{0pt}
            \setlength{\itemsep}{0pt}
            \setlength{\parsep}{0pt}}%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\makeatother % letter -> @  

\newcounter{totfigures}
\newcounter{tottables}
\newcounter{totapps}
\newcounter{totbiblio}

%Подсчет количества рисунков, таблиц, приложений
\providecommand\totfig{}
\providecommand\tottab{}
\providecommand\totapp{}
\providecommand\totbib{}

\makeatletter
\AtEndDocument{%
  \addtocounter{totfigures}{\value{figure}}%
  \addtocounter{tottables}{\value{table}}%
  \addtocounter{totapps}{\value{app}}%
  \addtocounter{totbiblio}{\value{biblio}}%
  \immediate\write\@mainaux{%
    \string\gdef\string\totfig{\number\value{totfigures}}%
    \string\gdef\string\tottab{\number\value{tottables}}%
    \string\gdef\string\totapp{\number\value{totapps}}%
    \string\gdef\string\totbib{\number\value{totbiblio}}%
  }%
}
\makeatother
\pretocmd{\chapter}{\addtocounter{totfigures}{\value{figure}}\setcounter{figure}{0}}{}{}
\pretocmd{\chapter}{\addtocounter{tottables}{\value{table}}\setcounter{table}{0}}{}{}
\pretocmd{\chapter}{\addtocounter{totbiblio}{\value{biblio}}\setcounter{biblio}{0}}{}{}



\newcommand{\info} {%
Пояснительная записка содержит \pageref{LastPage}~с.%
\ifnum \totfig >0
    , \totfig~рис.%
\fi
%
\ifnum \tottab >0
    , \tottab~табл.%
\fi
%
\ifnum \totbib =1
    , \totbib~источник%
\else
    \ifnum \totbib >1
        \ifnum \totbib <5
            , \totbib~источника%
        \else
            , \totbib~источников%
        \fi
    \fi
\fi
%
\ifnum \totapp >0
    , \totapp~прил.%
\fi
}

\renewcommand{\lstlistingname}{Рисунок}%
%\linespread{1} % http://s.arboreus.com/2008/03/latex.html
\lstset{%
  captionpos=b,
  basicstyle=\footnotesize
}

%%
%%
%% TITLE PAGE / ТИТУЛЬНЫЙ ЛИСТ
%%
%%

\newcommand*\subject[1]{\gdef\Gsubject{#1}}
\newcommand*\student[1]{\gdef\Gstudent{#1}}
\newcommand*\captain[1]{\gdef\Gcaptain{#1}}
\newcommand*\inspector[1]{\gdef\Ginspector{#1}}
\newcommand*\reviewer[1]{\gdef\Greviewer{#1}}
\newcommand*\reviewerinfo[1]{\gdef\Greviewerinfo{#1}}
\newcommand*\reviewernewline[1]{\gdef\Greviewernewline{#1}}
\newcommand*\secretary[1]{\gdef\Gsecretary{#1}}
\newcommand*\departmenthead[1]{\gdef\Gdepartmenthead{#1}}

\reviewernewline{}

\newcommand{\wideunderline}[2][2em]{%
  \underline{\makebox[\ifdim\width>#1\width\else#1\fi][r]{#2}}%
}

\newcommand{\wideunderlineForHW}[2][2em]{%
  \mbox{%
    \underline{\qquad\qquad\quad}%
    \hspace{1em}%
    \underline{\makebox[\ifdim\width>#1\width\else#1\fi][r]{#2}}%
  }%
}

\renewcommand*{\maketitle}{%
  \begin{titlepage}
    \pretolerance10000
    \begin{centering}
      МИНИСТЕРСТВО ОБРАЗОВАНИЯ И НАУКИ РФ\\
      \begin{singlespace}\normalsize
        Федеральное государственное бюджетное образовательное учреждение \\
        высшего образования
      \end{singlespace}
      «ПЕНЗЕНСКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ»\\
      %
      %
      %
      \begin{multicols}{2}
      \begin{singlespace}\normalsize
        Политехнический институт\\
        {\centering Факультет приборостроения, информационных
          технологий и электроники}\\
      \end{singlespace}
      \begin{singlespace}\normalsize
        Кафедра \\
        «Информационная безопасность систем и технологий»
      \end{singlespace}
      \end{multicols}
      \vspace{-1em}
      \begin{multicols}{2}
        Специальность 100503 –

        \columnbreak
      \begin{singlespace}\normalsize\justifying\setlength{\parindent}{0cm} 
        Информационная безопасность \\ автоматизированных систем
      \end{singlespace}
      \end{multicols}
      \vspace{-2em}
      \begin{multicols}{2}
        Специализация –
        \columnbreak
      \begin{singlespace}\normalsize\justifying\setlength{\parindent}{0cm} 
      Защищенные автоматизированные \\ системы управления
      \end{singlespace}
      \end{multicols}
      %
      %
      %
      \vspace{0.5em}
      ДИПЛОМНЫЙ ПРОЕКТ\\
      на тему\\
      \vspace{-0.5em}
      \begin{center}
        \MakeUppercase{\Gsubject}
      \end{center}
    \end{centering}
    \begin{flushleft}
      Студент \hfill \wideunderlineForHW[8em]{\Gstudent}
      \\
      %
      Руководитель \hfill \wideunderlineForHW[8em]{\Gcaptain}
      \\
      %
      Нормконтроллер \hfill \wideunderlineForHW[8em]{\Ginspector}
      \\
      %
      %% Рецензент \underline{\Greviewerinfo} \hfill \underline{\hspace{3cm}}
      %% \wideunderline[8em]{\Greviewer}
      Рецензент \underline{\Greviewerinfo} \Greviewernewline \hfill \wideunderlineForHW[8em]{\Greviewer}
      \\
      %
      \vspace{2em}
      Работа допущена к защите (протокол заседания кафедры от
      \underline{\hspace{1.7cm}} № \underline{\hspace{1.2cm}})
      \vspace{1em}
      %
      Заведующий кафедрой \hfill \wideunderlineForHW[8em]{\Gdepartmenthead}
      \\
      %
      Работа защищена с отметкой \underline{\hspace{5cm}}(протокол заседания ГЭК
      от \underline{\hspace{3cm}} № \underline{\hspace{3cm}})\\
      %
      Секретарь ГЭК \hfill \wideunderlineForHW[8em]{\Gsecretary}
      %
    \end{flushleft}
    \vfill
    \centerline{Пенза 2017}
  \end{titlepage}
}

%%
%%
%% Макросы для рисунков
%%
%%

%% Usage: \gostpic{pic.png}{Name of picture}{fig:rings}
\newcommand*\gostpic[3]{%
  \afterpage{%
    \begin{figure}[H]
      \centering
      \includegraphics[height=0.4\textheight]{#1}
      \caption{#2}
      \label{#3}
    \end{figure}
  }
}

%% Usage: \gostpicorig{pic.png}{Name of picture}{fig:rings}
\newcommand*\gostpicorig[3]{%
  \afterpage{%
    \begin{figure}[H]
      \centering
      \includegraphics{#1}
      \caption{#2}
      \label{#3}
    \end{figure}
  }
}

%% Usage: \gostpicwidth{pic.png}{Name of picture}{fig:rings}
\newcommand*\gostpicwidth[3]{%
  \afterpage{%
    \begin{figure}[H]
      \centering
      \includegraphics[width=\linewidth]{#1}
      \caption{#2}
      \label{#3}
    \end{figure}
  }
}

%%
%%
%% Магия библиографии по госту
%%
%%
%% Как использовать:
%% В конце текста, как обычно
%% \begin{thebibliography}
%%   \gostbibitem{name}{value}
%%   \gostbibitem{anothername}{anothervalue}
%% \end{thebibliography}

%% В тексте
%% \gostcite{name}
%% \gostcite{anothername}

\newcounter{gostbiblaterdef} % just a dummy counter
\newcommand{\gostbiblaterdef}[2]{%
  \renewcommand\thegostbiblaterdef{#2}%
  \refstepcounter{gostbiblaterdef}\label{#1}%
}

\newcommand*\gostbibitem[2]{%
  \gostbiblaterdef{#1}{#2}
\bibitem{#1}
  \ref{#1}
}

\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

\newcommand*\gostcite[1]{%
  \cite{#1}%
}

\makeatletter
\AtBeginDocument{%
  \let\c@figure\c@lstlisting
  \let\thefigure\thelstlisting
  \let\ftype@lstlisting\ftype@figure % give the floats the same precedence
}
\makeatother
