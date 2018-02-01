%% Identification
%% The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hfscript}[2017/11/14 Latex Template for script at HF-ICT]

%% Preliminary definitions, needed by the options
\LoadClass[
    fontsize=12pt,          % Schriftgröße 12pt
    twoside=false,          % Einseitig
    titlepage=false,        % keine eigene Seite für Titel
    parskip=true,           % Kein Einzug auf erster Absatzzeile, Abstand zwischen Absätzen
    bibliography=totoc,     % Quellenverzeichnis im Inhaltsverzeichnis
    listof=totoc,           % Abbildungs- und Tabellenverzeichnis im Inhaltsverzeichnis
    toc=sectionentrywithdots% Verzeichnisse mit Punkten auffüllen (zw. Titel und Seitenzahl)
]{scrartcl}  
\RequirePackage[
    footskip=2cm,           % Abstand zwischen Text und Fußzeile
    includefoot,            % Fußzeile im Textspiegel (d.h. Rand 1.5cm ab Fusszeile)
    includehead,            % Kopfzeile im Textspiegel
    top=1.5cm,              % Rand oben
    head=24pt,
    left=2cm,               % Rand links
    right=2cm,              % Rand rechts
    bottom=1.5cm            % Rand unten
]{geometry}
\RequirePackage[
    headsepline,            % Trennlinie zwischen Kopfzeile und Text
    footsepline,            % Trennlinie zwischen Fußzeile und Text
    plainfootsepline        % Trennlinie auch auf "plain"-Pagestyles
]{scrlayer-scrpage}

%% Important Packages
\RequirePackage[utf8]{inputenc} % ermöglicht Eingabe von Umlauten
\RequirePackage[T1]{fontenc}    % ermöglicht Ausgabe von Umlauten
\RequirePackage[ngerman]{babel} % Neue deutsche Rechtschreibung
\RequirePackage{lmodern}        % Lmodern als Schriftart verwenden
\RequirePackage{lastpage}       % stellt \lastpage für Fußzeile zur Verfügung
\RequirePackage{textcomp}       % stellt schönere Symbole (Copyright, Fußzeile) zur Verfügung

\makeatletter
%% Makros für Kopf- und Fusszeile
\newcommand{\hfsem}[1]{\newcommand{\@hfsem}{#1}}    % Semester
\newcommand{\hffach}[1]{\newcommand{\@hffach}{#1}}  % Fach
\newcommand{\dozent}[1]{\newcommand{\@dozent}{#1}}  % Dozent

%% Maketitle neu definieren um Dozent drinnen zu haben
\def\@maketitle{%
\ifx%
	\@titlehead\@empty%
\else%
	\begin {minipage}[t]{\textwidth }%
	\usekomafont {titlehead}{\@titlehead\par }%
	\end{minipage}\par%
\fi \vskip 2em%
\begin {center}%
	\ifx%
		\@subject\@empty%
	\else {%
		\usekomafont {subject}%
		{\@subject \par }%
	}%
	\fi \vskip 1.5em%
	{\usekomafont {title}%
	{\huge \@title \par}}%
	\vskip .5em %
	{\ifx%
		\@subtitle \@empty%
	\else%
		\usekomafont {subtitle}%
		\@subtitle \par%
	\fi }%
	\vskip 1em%
	{\usekomafont {author}%
		{\lineskip .5em%
		\begin {tabular}[t]{c}%
		\@author%
		\end {tabular}\par}%
	}\vskip 1em%
	{\usekomafont {date}%
	\@date \par }%
	\vskip 1em%
	{\usekomafont {publishers}{\@publishers \par }}%
	\ifx%
		\%@dedication \@empty
	\else%
		\vskip 2em%
		{\usekomafont {dedication}{\@dedication \par }}%
	\fi%
\end {center}%
\par \vskip 2em%
}

%% Font Settings
\renewcommand*\familydefault{\sfdefault}    % Serifenlose Schrift als Standard
\addtokomafont{pagefoot}{\footnotesize\normalfont}     % Fußzeile in kleinerer Schrift
\addtokomafont{pagehead}{\footnotesize\normalfont}

%% Header and Footer
\lohead[hf-ict \\ \@hfsem]{hf-ict \\ \@hfsem}              % Linke Kopfzeile
\cohead[\textbf{\@hffach}]{\textbf{\@hffach \\ \@title}}   % Mittlere Kopfzeile
\rohead[Dozent:~\@dozent]{Dozent:~\@dozent}               % Rechte Kopfzeile
\lofoot{}                                                 % Linke Fußzeile
\cofoot[\textcopyright~\@author]{\textcopyright~\@author}
\rofoot[Seite \pagemark~von~\pageref{LastPage}]{Seite \pagemark~von~\pageref{LastPage}}                  % Rechte Fußzeile
\pagestyle{scrheadings}
\makeatother

%% Options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

