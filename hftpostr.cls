\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hftpostr}[2019/03/11 v1.0 Poster class for posters at HFT Stuttgart]

\LoadClass[xcolor={dvipsnames}]{beamer}

\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage{kvoptions}
\RequirePackage{hyperref}

% Package options
\DeclareStringOption[1.5]{scale}
\DeclareStringOption[37mm]{marginLeftRight}
\DeclareStringOption[23mm]{marginTop}
\DeclareStringOption[5mm]{marginBelowHeadline}
\DeclareStringOption[7ex]{blockDistance}
\ProcessKeyvalOptions*

% Define commands
\newcommand*{\studyProgramme}[1]{\def\@studyProgramme{#1}}
\newcommand*{\advisor}[1]{\def\@advisor{#1}}
\newcommand*{\authorLabel}[1]{\def\@authorLabel{#1}}
\newcommand*{\advisorLabel}[1]{\def\@advisorLabel{#1}}

% Set default values
\studyProgramme{Bachelor-Studiengang Mathematik}
\advisor{Prof. Dr. XY}
\author{Name des Autors/der Autorin}
\authorLabel{ (Autor)}
\advisorLabel{ (Betreuer)}

% The central package for our poster
\RequirePackage[orientation=portrait, size=a1, scale=\hftpostr@scale]{beamerposter}
% Some text will be set to absolute postions on the poster
\RequirePackage[overlay, absolute]{textpos}
% For justified text
\RequirePackage{ragged2e}
% Code listings
\RequirePackage{listings}
% We need to calculate some lengths
\RequirePackage{calc}
% macro to shorten code for lenght definitions
\newcommand{\defineLength}[2]{
    \expandafter\newlength\csname #1\endcsname
    \expandafter\setlength\csname #1\endcsname{#2}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General Theme beahviour
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% check if background pdf file exists and set it as background
\IfFileExists{./hftpostrbackground.pdf}{
  \usebackgroundtemplate{\includegraphics[width=\paperwidth,height=\paperheight]{hftpostrbackground.pdf}}
}{
  \ClassError{hftpostr}{No background file found! There must be a file hftpostrbackground.pdf}{}
}
% define some important lengths as global values
\defineLength{marginLeftRight}{\hftpostr@marginLeftRight}
\defineLength{marginTop}{\hftpostr@marginTop}
\defineLength{marginBelowHeadline}{\hftpostr@marginBelowHeadline}
% Width of red bar on the left of the HFT poster template
\defineLength{leftSidebarWidth}{15.7mm}
% Calculate maximum width of headline
\defineLength{headline}{\paperwidth - \leftSidebarWidth - 2\marginLeftRight}
% Calculate left page margin including the red bar on the left
\defineLength{leftSpace}{\leftSidebarWidth + \marginLeftRight}
% Set calculated margins
\setbeamersize{text margin left=\leftSpace, text margin right=\marginLeftRight}
% Define the "HFT red" colors
\definecolor{HFTred1}{RGB}{230,6,31}
\definecolor{HFTred2}{RGB}{237,65,84}
\definecolor{HFTred3}{RGB}{242,105,120}
% set color palettes and other general things
\setbeamercolor{palette primary}{bg=HFTred1,fg=white}
\setbeamercolor{palette secondary}{bg=HFTred1,fg=white}
\setbeamercolor{palette tertiary}{bg=HFTred1,fg=white}
\setbeamercolor{palette quaternary}{bg=HFTred1,fg=white}
\setbeamercolor{structure}{fg=HFTred1}
\setbeamercolor{headline}{bg=white, fg=HFTred1}
\setbeamercolor{block title}{bg=white, fg=HFTred1}
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{itemize item}[triangle]
\setbeamertemplate{caption}{\raggedright\insertcaption\par}
% set headline
\defineLength{leftSpaceHeadline}{\leftSpace - 1.4 mm}
\setbeamertemplate{headline}{
  \vskip\marginTop
  \hspace{\leftSpaceHeadline}
  \begin{beamercolorbox}[wd=\headline]{headline}
    \begin{center}
      \usebeamercolor{title in headline}{\color{fg}\textbf{\huge{\inserttitle}}}
    \end{center}
  \end{beamercolorbox}
  \vskip\marginBelowHeadline
}
% set block design
\defineLength{blockDistance}{\hftpostr@blockDistance}
\setbeamertemplate{block begin}{
  \vskip\blockDistance
  \begin{beamercolorbox}[rounded=false,leftskip=0cm,colsep*=.75ex]{block title}
    \usebeamerfont*{block title}\insertblocktitle
  \end{beamercolorbox}
  {\ifbeamercolorempty[bg]{block body}{}{\nointerlineskip\vskip-0.5pt}}
  \usebeamerfont{block body}
  \begin{beamercolorbox}[rounded=false,colsep*=.75ex,sep=.75ex,vmode]{block body}
    \ifbeamercolorempty[bg]{block body}{\vskip-.25ex}{\vskip-.75ex}\vbox{}
    \justifying
}
\setbeamertemplate{block end}{
  \justifying
  \end{beamercolorbox}
}
% set author, advisor und study programme
\AtBeginDocument{
  \begin{textblock*}{560mm}(25mm,700mm)
    \fontsize{44pt}{0mm}\selectfont
    \usebeamercolor{title in headline}{\color{bg}\insertauthor\@authorLabel}
  \end{textblock*}
  \begin{textblock*}{560mm}(25mm,718mm)
    \fontsize{44pt}{0mm}\selectfont
    \usebeamercolor{title in headline}{\color{bg}\@advisor\@advisorLabel}
  \end{textblock*}
  \begin{textblock*}{560mm}(12mm,751mm)
    \fontsize{65pt}{0mm}\selectfont
    \usebeamercolor{title in headline}{\color{bg}\@studyProgramme}
  \end{textblock*}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
