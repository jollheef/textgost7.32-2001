\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gost7.32-2001}[2017/05/27]
\LoadClass[12pt, final, a4paper, oneside]{extarticle}

\RequirePackage{polyglossia}  %% подключает пакет многоязыкой вёрстки
\newfontfamily{\cyrillicfont}{Liberation Serif}
%\setmainfont{Times New Roman}  %% задаёт основной шрифт документа
\setmainfont{Liberation Serif}  %% задаёт основной шрифт документа
\setsansfont{DejaVu Sans}  %% задаёт шрифт без засечек
\setmonofont{DejaVu Sans Mono}  %% задаёт моноширинный шрифт
\defaultfontfeatures{Scale=MatchLowercase, Mapping=tex-text}  %% устанавливает поведение шрифтов по умолчанию
\setdefaultlanguage{russian}  %% устанавливает язык по умолчанию
\setotherlanguage{english}

\tolerance=1000
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
\RequirePackage[left=3cm, right=1.5cm, top=2cm, bottom=2.5cm]{geometry}
\RequirePackage{listings}

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
\setitemize[1]{label=-, fullwidth, itemindent=\parindent, 
  listparindent=\parindent}% для дефисного списка
\setitemize[2]{label=-, fullwidth, itemindent=\parindent, leftmargin=1.5cm,
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
{\par\normalfont\large\thesection\hspace{1ex}#1\par\nopagebreak%
\addcontentsline{toc}{section}{\thesection\hspace{1ex}#1}%
\setcounter{paragraph}{0}%
}}

\renewcommand*{\subsection}[1]{%
\refstepcounter{subsection}%
{\par\normalfont\large\thesubsection\hspace{1ex}#1\par\nopagebreak%
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
{\parindent=0cm\par\normalfont\large\filcenter#1% заголовок
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
\addcontentsline{toc}{section}{Приложение~\theapp}\label{#2}%
\vfill\vfill\newpage}



\addto\captionsrussian{%
\renewcommand{\refname}{Список использованных источников}%
\renewcommand{\contentsname}{\large{СОДЕРЖАНИЕ}}%
%\renewcommand{\tableofcontents}{\specsection{\contentsname}\@starttoc{toc}}%
}

\makeatletter % @ -> letter 
% Содержание
\renewcommand{\l@section}{\@dottedtocline{1}{0cm}{0em}}
\renewcommand{\l@subsection}{\@dottedtocline{2}{0cm}{0em}}
\renewcommand{\l@paragraph}{\@dottedtocline{3}{0cm}{0em}}

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

\renewcommand{\lstlistingname}{Листинг}%
%\linespread{1} % http://s.arboreus.com/2008/03/latex.html
\lstset{%
  captionpos=b,
  basicstyle=\footnotesize
}