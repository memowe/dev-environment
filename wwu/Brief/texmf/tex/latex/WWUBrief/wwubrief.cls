% Dies ist
\def\filename{wwubrief}%   LaTeX-Class vom
\def\filedate{08/07/01}
\def\fileversion{1.1}
% "Anderungen:
% 15.08.2017 V 1   gu  neue Zaehlung fuer das geaenderte CD
%                      Anpassung an das neue CD der WWU:
%                      -- neues Logo
%                      -- Ausgabe des Datums in der Betreffzeile
%                      -- Aktenzeichen und VAT ausgeschaltet
%                      Ulrich Grabowsky, satz&sonders GmbH, grabowsky@satzundsonders.de
% 01.07.2008 V 1.1 Kr  Schriftgröße 10.5pt, 7.5pt gesetzt auf 10.95pt, 7pt
% 07.05.2008 V 1.0 Kr  Angepasst an WWU-CD und in wwubrief umbenannt
% 19.01.2004 V 5.1 Kr  Voreinstellung von \@absnode ist jetzt {uni-muenster.de}
% 25.04.2003 V 5.0 Kr  Output-Routine von LaTeX2e 2001/06/01 übernommen.
%                      \adressdatei kann wieder verwendet werden, da auf Grund
%                      der neuen Output-Routine Umlaute gesetzt werden.
% 11.12.2001 V 4.0 Kr  spezielle ZIV-Version
% 29.11.2001 V 3.7 Kr  Leerzeichen in "i. A." und "i. V."
% 29.11.2001 V 3.7 Kr  ngerman an Stelle von german
% 27.10.1999 V 3.6 Kr  Adressenfenster-vbox von 30 mm auf 35mm erhöht
% 11.03.1998 V 3.5 Kr  Institutslogo wurde nicht zentriert!
%                      \hspace*{\@tempskipa} im \ps@briefersteseite und
%                      Leerzeichen nach \hspace*{\@tempskipb} entfernt;
%                      \@tempskipb um 1mm auf 4mm erhöht.
% 13.02.1998 V 3.4 Kr  \raggedright im Adressenfenster
% V 3.3:  \vskip anstatt \vspace in \shipout-Routine. Dies war beim Umstieg
%         von LaTeX2e vom 1.6.95pl3 auf 1.12.96pl1 nötig. 14.04.1997 Kr
% V 3.2:  \unterschriftbuchstabe muß hier definiert werden, falls ein
%         Bearbeiter-Style diese Markierung aber nicht sbrief.sty benutzt.
%         10.01.97 Kr
% V 3.1:  \adressdatei kann unter LaTeX2e nicht mehr verwendet werden,
%         da Umlaute in dieser Datei nicht gesetzt werden. 15.12.95 Kr
% V 3.0:  \filename, \filedate, \fileversion erg"anzt. 18.11.94 Kr
%         Anpassung an LaTeX2e: 17.8.94 FP
%         - Deklaration der Optionen
%         - neue Outputroutine
%         - einige Kommandos: newcommand,footheigt,maxsep,dblmaxsep
% V 2.8a: - footenotemarks in \fnsymbol-Z"ahlung
%         - footnote und equation bei jedem \begin{brief}
%           neu initialisieren 12.2.93 FP
% V 2.8 : neue Markierung: \fax{} erzeugt \@absfax zur Verwendung
%         in \telextext (elektronische Dienste) Default: \@absfax{} 3.9.92 FP
% V 2.7 : - neue Markierung: \faltmarken{an|aus} : Aus- bzw. Einschalten
%           der Faltmarken.  22.7.92 FP
%         - \az{} mit leerem Argument erzeugt "uberhaupt keine
%           Ausgabe mehr (vorher: Az.:__)  22.7.92 FP
%         - \adressdatei{} mit leerem Argument versucht nicht mehr
%           Datei mit 'leerem' Dateinamen zu "offnen.  22.7.92 FP
% V 2.6b: Fehler korrigiert, der bei "Ubernahme aus neuer LaTeX-Version
%         in V 2.6 entstanden war
%         (zus"atzliches \global\@specialpagefalse) 11.6.92 FP
% V 2.6a: "Ubernahme der "Anderungen in V 2.4a nach V 2.6, 2.6.1992 FP
% V 2.6:  Anpassung der Original-LaTeX-Outputroutine an die neue
%         LATEX VERSION 2.09 <25 March 1992> (brief funktioniert
%         nat"urlich auch mit "alteren LaTeX-Versionen) 29.4.1992 FP
% V 2.4a: In \schreibe@brieffenster die Breite des Fensters verringert
%         (Sollte noch einmal "uberarbeitet werden) 15.05.92 Kr
% V 2.5:  Modifikation von \@liefereseitenhoehe; Einf"uhrung von
%         \@ersteseiteheadsep --> Variation der pagestyles 23.1.1992 FP
% V 2.4:  Umbenennung anundps nach brieffuss und kein Literal
%         "Nachrichtlich" mehr automatisch 28.2.1991 Ar
% V 2.3:  \nachrichtlich statt \mehrfachadressen 14.02.1991 Ar
% V 2.2:  keine Leerzeile nach Anlage. 14.08.1990 Kr
% Mit neuem Briefkopf
% Die vorliegende Datei entstand aus dem
% LETTER DOCUMENT STYLE -- Released 17 January 1986
%    for LaTeX version 2.09
% Copyright (C) 1985 by Leslie Lamport
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\filename}[\filedate\space\fileversion\space
                          ZIV-LaTeX document class]

\RequirePackage{graphicx}
\RequirePackage{meta}
\renewcommand{\encodingdefault}{T1}

\newcommand\@ptsize{}
\DeclareOption{10pt}{\renewcommand\@ptsize{1}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{1}}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\ExecuteOptions{11pt,oneside,final}  % 11pt Voreinstellung ab brief2008
\ProcessOptions

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}

%  ****************************************
%  *               FONTS                  *
%  ****************************************
%

\lineskip 1pt            % \lineskip is 1pt for all font sizes.
\normallineskip 1pt
\def\baselinestretch{1}

\ifcase \@ptsize\relax   % 10pt option

\renewcommand\normalsize{%
   \fontsize{10}{12}\selectfont
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \fontsize{9}{11}\selectfont%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
   \fontsize{8}{9.5}\selectfont%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\fontsize{7}{8}\selectfont}
\newcommand\tiny{\fontsize{5}{6}\selectfont}
\newcommand\large{\fontsize{12}{14}\selectfont}
\newcommand\Large{\fontsize{14.4}{18}\selectfont}
\newcommand\LARGE{\fontsize{17.28}{22}\selectfont}
\newcommand\huge{\fontsize{20.74}{25}\selectfont}
\newcommand\Huge{\fontsize{24.88}{30}\selectfont}

\or  % 11pt option

\renewcommand\normalsize{%
   %\fontsize{10.95}{12.6}\selectfont%
   \fontsize{10.5}{13}\selectfont% 15.08.2017 gu
   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \fontsize{10}{11.5}\selectfont
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep 3\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
   \fontsize{9}{11}\selectfont%
   \abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\fontsize{8}{9.5}\selectfont}
\newcommand\tiny{\fontsize{6}{7}\selectfont}
%\newcommand\large{\fontsize{12}{14}\selectfont}
\newcommand\large{\fontsize{13}{14}\selectfont} % 15.08.2017 gu
\newcommand\Large{\fontsize{14.4}{18}\selectfont}
\newcommand\LARGE{\fontsize{17.28}{22}\selectfont}
\newcommand\huge{\fontsize{20.74}{25}\selectfont}
\newcommand\Huge{\fontsize{24.88}{30}\selectfont}

\or  % 12pt option

\renewcommand\normalsize{%
   \fontsize{12}{14.5}\selectfont%
   \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \fontsize{10.95}{13.6}\selectfont%
   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 9\p@ \@plus3\p@ \@minus5\p@
               \parsep 4.5\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
   \fontsize{10}{12}\selectfont
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep 3\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\fontsize{8}{9.5}\selectfont}
\newcommand\tiny{\fontsize{6}{7}\selectfont}
\newcommand\large{\fontsize{14.4}{18}\selectfont}
\newcommand\Large{\fontsize{17.28}{22}\selectfont}
\newcommand\LARGE{\fontsize{20.74}{25}\selectfont}
\newcommand\huge{\fontsize{24.88}{30}\selectfont}

\fi


\def\SG@Orga{\fontsize{7}{8.5}\selectfont}
\def\SG@absimfenster{\fontsize{6}{7}\selectfont}

\normalsize  % Choose the normalsize font.

%  ****************************************
%  *            PAGE LAYOUT               *
%  ****************************************
%
% Alle Massangaben beziehen sich die obere linke Ecke
% des DIN-A4-Blattes.
% Dies wird erreicht durch:
\hoffset=-1in
\voffset=-1in
\newdimen\dinAvier@hoehe
\newdimen\dinAvier@breite
\dinAvier@hoehe=294mm  % Die H"ohe eines DIN-A4 Blattes betr"agt 297 mm.
                    % Der Wert wurde verkleinert, weil der HP-Laserjet
                    % nicht die ganze Seite bedrucken kann.
\dinAvier@breite=210mm
\newif\ifadressen@aus@datei
\newif\ifsetze@faltmarken  % 22.7.92 FP

% SIDE MARGINS:
\oddsidemargin = 22mm      % Left margin on odd-numbered pages.
\evensidemargin= 22mm      % Left margin on even-numbered pages.
\marginparwidth= 72pt      % Width of marginal notes.
\marginparsep  = 11pt      % Horizontal space between outer margin and
                           % marginal note
\marginparpush =  5pt      % Minimum vertical space between marginal notes.

% VERTICAL SPACING:

\newdimen\@ersteseitetopmargin
\newdimen\@ersteseiteheadheight
\newdimen\@ersteseiteheadsep           % 23.1.92 FP
\newdimen\@seitenhoehe

                         % Top of page: (ab 2. Seite) insgesamt 31,5mm
\topmargin=20mm          %    Nominal distance from top of page to top of
                         %    box containing running head.
\headheight=10mm         %    Height of box containing running head.
\headsep=1.5mm           %    Space between running head and text.

\@ersteseitetopmargin=13mm  %  ge"anderte Ma"se f"ur den Briefkopf
\@ersteseiteheadheight=20mm %  ge"anderte Ma"se f"ur den Briefkopf
\@ersteseiteheadsep=13mm     %  ge"anderte Ma"se f"ur den Briefkopf % 23.1.92 FP

                         % Bottom of page:
%\footheight=10mm         %    Height of box containing running foot.%17.8.94 FP
\footskip=26mm           %    Distance from baseline of box containing foot
                         %    to baseline of last line of text.

% DIMENSION OF TEXT:

%\textheight=000mm       % Height of text (including footnotes and figures,
%                        % excluding running head and foot).
% Die H"ohe der Seite wird in Abh"angigkeit der Kommandos \randoben und
% \randunten berechnet und \@seitenhoehe zugewiesen.
\def\@liefereseitenhoehe%
     #1%     enth"alt \headheight
     #2%             \headsep          % 23.1.92 FP
     #3%             \topmargin        % 23.1.92 FP
     {\setlength{\@tempskipa}{\dinAvier@hoehe}
      \addtolength{\@tempskipa}{-#1}
      \addtolength{\@tempskipa}{-#2}
      \addtolength{\@tempskipa}{-#3}          % 23.1.92 FP
      \addtolength{\@tempskipa}{-\footskip}
      \addtolength{\@tempskipa}{-\@randunten mm}
      \setlength{\@seitenhoehe}{\@tempskipa}
     }


\textwidth=142.5mm       % Width of text line.
\newlength{\@BreiteOrgaAbText}
\setlength{\@BreiteOrgaAbText}{40mm}
\newlength{\@textwidthPlusBreiteOrgaAbText}
\setlength{\@textwidthPlusBreiteOrgaAbText}{\textwidth}
\addtolength{\@textwidthPlusBreiteOrgaAbText}{\@BreiteOrgaAbText}
\addtolength{\@textwidthPlusBreiteOrgaAbText}{1mm}

                         % For two-column mode:
\columnsep=10pt          %    Space between columns
\columnseprule=0pt       %    Width of rule between columns.

\raggedbottom             % 'ragged bottom' (all pages set to natural
                          % height, with no stretch or shrinkage)

% FOOTNOTES:

\footnotesep=12pt    % Height of strut placed at the beginning of every
                     % footnote.
\skip\footins=10pt plus 2pt minus 4pt  % Space between last line of text and
                                       % top of first footnote.


% FLOATS:
%   The following items must be defined, even though there are no
%   floats in this style.
\floatsep 12pt plus 2pt minus 2pt
\textfloatsep  20pt plus 2pt minus 4pt
\intextsep 12pt plus 2pt minus 2pt
\dblfloatsep 12pt plus 2pt minus 2pt
\dbltextfloatsep 20pt plus 2pt minus 4pt
%\@maxsep 20pt%17.8.94 FP
%\@dblmaxsep 20pt%17.8.94 FP
\@fptop 0pt plus 1fil
\@fpsep 8pt plus 2fil
\@fpbot 0pt plus 1fil
\@dblfptop 0pt plus 1fil
\@dblfpsep 8pt plus 2fil
\@dblfpbot 0pt plus 1fil



%    ****************************************
%    *            DAS BRIEFFORMAT           *
%    ****************************************
%

% Makros, die mit \schreibe@.. anfangen deren Definition aber nicht
% explizit vorgenommen wird, werden mit Hilfe von \blockdef definiert!!!

\def\text                % Jetzt beginnt der Brieftext. Alle Einstellungen
     {\@ifnextchar [     % m"ussen gemacht sein, da jetzt der Briefkopf
            {\@text}     % bis zur Anrede gesetzt wird.
            {\@text[\skip{1}]}
     }
\def\@text
     [#1]%
     {%
         {\def\skip                 % lokale Definition von
               ##1%                 % \skip, da \skip Parameter
               {\gdef\text@skip     % von \text ist.
                      {##1}%        %
               }%                   % \text@skip wird in \schreibe@anrede
          \gdef\text@skip{}%        % ben"otigt.
          #1%                       % Parameter wird ausgewertet.
         }%                         %
      \setze@seitenstilersteseite   % Das Institutslogo wird in
                                    % die Kopfzeile der ersten Seite
                                    % gesetzt. Das Aussehen der Kopfzeile
                                    % wird aber im Seitenstil (pagestyle)
                                    % festgelegt. Das Institutslogo wird
                                    % also hier gesetzt.
                                    %
      \setze@seitenstilfolgeseiten  % Durch die Markierung \num wird der
                                    % Seitenstil beeinflu"st. Daher wird
                                    % \setze@seitenstilfolgeseiten in
                                    % \num auf einen Wert gesetzt
      \schreibe@vorspann            % erzeugt Adressfeld und rechten
                                    % Teil des Briefkopfes. Diese werden
                                    % nicht in der Kopfzeile der ersten
                                    % ersten Seite gesetzt, sondern
                                    % stehen oben auf der Seite als
                                    % normaler Text.
      \schreibe@bezug@betreff
      \schreibe@anrede              % In dieser Markierung wird
                                    % \text@skip f"ur den Abstand der
                                    % Anrede zum Text des Briefes ben"otigt
     }


\def\setze@seitenstilersteseite
     {\thispagestyle{briefersteseite}
      % da durch \thispagestyle "Anderungen der Seitenma"se erst in
      % der Outputroutine wirksam werden, \textheight aber schon
      % f"ur die laufende Seite ben"otigt wird, mu"s schon an dieser
      % Stelle mit Hilfe von \@liefereseitenhoehe die f"ur die erste Seite
      % zul"assige H"ohe des Textes berechnet werden. Durch setzen von
      % \@colht, \@colroom und \vsize wird die berechnete Texth"ohe
      % unmittelbar wirksam.
      {\@liefereseitenhoehe
                      {\@ersteseiteheadheight}
                      {\@ersteseiteheadsep}        % 23.1.92 FP
                      {\@ersteseitetopmargin}
       \global\@colht=\@seitenhoehe
       \global\@colroom=\@seitenhoehe
       \global\vsize=\@seitenhoehe
      }%
     }

\def\schreibe@vorspann
     {\hbox to \@textwidthPlusBreiteOrgaAbText
         {\schreibe@brieffenster%
          \hfill%
          \erzeuge@mindestabstand@vom@brieffenster%
          \schreibe@absender%
        }%
     }

\def\schreibe@brieffenster
     {\vtop
         {\hsize 70mm    % ab 15.05.92 70mm; vorher 85mm (Kr)
            % Berechne Abstand des Absenders im Brieffenster vom Rand
          \setlength{\@tempskipa}{22mm}             % Sollabstand 22mm
          \addtolength{\@tempskipa}{-\oddsidemargin}
          \hbox
             {\hspace*{\@tempskipa}%
              \vbox to 5mm
                 {\par\noindent
                  \hsize 85mm    % neu ab 15.05.92 wegen obiger "Anderung
                  \SG@absimfenster
                  \schreibe@absimfenster
                  \vss
                 }%
              \raisebox{3mm}[0mm][0mm]
                 {\makebox[0mm][l]
                     {\hspace{57mm}%
                      \parbox[b]{40mm}{%
                          \SG@Orga
                          \schreibe@organisationseinheit}%
                     }%
                 }%
             }
          \hbox
             {\schreibe@fensteradresse
             }
          \hbox
             {\schreibe@nachrichtlich
             }
          \vfill
         }%
     }

\def\schreibe@fensteradresse
     {\vbox to 35mm   % von 30mm auf 35mm erhöht; 27.10.1999 Kr
         {\vfill
          {\raggedright
          \let\backalt=\\
           \def\\{\rule{0mm}{0mm}\backalt}
           \@adresse
           \par
          }
          \vfill
         }
     }


\def\schreibe@nachrichtlich
          {\ifx\@empty\@nachrichtlich%
            \else
             \vbox
              {\vspace{10mm}
               \let\@speich\adresse
               \def\adresse
                    ##1%
                    {\rule{0mm}{0mm}##1\\[5ex]
                    }
               \noindent
               \@nachrichtlich
               \rule{0mm}{0mm}
               \let\adresse\@speich
              }
           \fi
          }

\def\erzeuge@mindestabstand@vom@brieffenster
     {\setlength{\@tempskipa}{51mm}%       H"ohe des Brieffensters  bisher 40 bzw. 45 bis 25.04.2008
            % dazu wird der durch den Stilparameter \kopfsep angegebene
            % Abstand addiert, der angibt, wie weit tiefer der Brief
            % mindestens beginnen soll.
      \addtolength{\@tempskipa}{\@kopfsep mm}%
      \vtop
         {\hbox{\rule{0mm}{0mm}}%         Bezugsbox zur Zeilenausrichtung
          \hbox{\rule{0mm}{\@tempskipa}}%
         }
     }

\def\schreibe@absender
     {\vtop
         {\hsize \@BreiteOrgaAbText
          \hbox{\rule{0mm}{0mm}}
          \vspace{2mm}
          \hbox
             {\vbox
                 {\SG@Orga
                  \schreibe@absanschrift
                  \schreibe@absname
                 }%
             }%
          \hbox
             {\vbox
                 {\SG@Orga
                  %\schreibe@datum
                  \schreibe@az
                  \schreibe@VAT
                 }%
             }%
         }
     }

\def\schreibe@bezug@betreff
     {{\large
      \vspace{5mm}%
      \par\noindent%
      \ifx\@empty\@bezugszeichen
      \else
         \@bezugszeichen%        % Druckt Bezugszeichen "Ihr Zeichen" o."a.
         \par%
         \vspace{\@betrskip\normalskip}%
         \noindent%
      \fi%
      % Die Ausgabe des Datums erfolgt nunmehr in der Betreffzeile.
      \strut\makebox[0mm][l]{%          15.08.2017 gu
        \SG@Orga
        \hskip\textwidth\schreibe@datum
      }%
      \strut\ignorespaces\@betrtext%                           % Druckt den Betreff
      \ifx\@empty\@bezugtext%
      \else%
         \par%
         \ifx\@empty\@betrtext%
         \else%
            \vspace{\@bezugskip\normalskip}%
         \fi%
         \noindent%
         \ignorespaces                  % 15.08.2017 gu
         \@bezugtext%                   % Druckt den Bezug
      \fi%
     }}

\def\schreibe@anrede
     {\ifx\@empty\@anredetext%
      \else%
         \par%
         \vspace{\@anredeskip\normalskip}%
         \noindent%
         \@anredetext%
      \fi%
      \rule{0mm}{0mm}\\[\text@skip\normalskip]%
     }




\def\gruss
     {\@ifnextchar [
            {\@gruss}
            {\@gruss[]}%
     }
\long\def\@gruss
     [#1]%
     #2%
     {%
        {\def\skip                       % Es werden lokal f"ur die
              ##1%                       % m"oglichen Parameter von
              {\gdef\@grussskip          % \gruss Makros definiert, die
                    {##1}%               % dann global eine Setzung
              }%                         % vornehmen, wenn sie
         \gdef\@auftrtext{}              % durch einen tats"achlich
         \gdef\@grussskip{}              % vorhandenen Parameter auf-
         \def\ia                         % gerufen werden.
              {\gdef\@auftrtext{i.~A.}   %
              }%                         %
         \def\iv                         %
              {\gdef\@auftrtext{i.~V.}   %
              }%                         %
         #1%                             % Hier werden die tats"achlichen
        }%                               % Parameter ausgef"uhrt.
      \schreibe@gruss{#2}
     }

\long\def\schreibe@gruss
     #1%           Name im Gruss
     {\ifx\@empty\@grussskip
         \def\@grussskip{2}
      \fi%
      \par%
      \nobreak%
      \vspace{\@grussskip\normalskip}%
      \stopbreaks%
      \noindent%
      \parbox{\textwidth}
           {\raggedright%
            \ignorespaces%
            \@grussformel%
            \rule{0mm}{0mm}\\[.5\normalskip]%
            \ifx\@empty\@auftrtext%
            \else%
               {\small \@auftrtext}%
            \fi%
            \rule{0mm}{0mm}%
            \\[2.5\normalskip]%
            {\def\@tempmaca{#1}%
             \small%
             \ifx\@empty\@tempmaca%
                \@absname%
             \else%
                #1%
             \fi%
            }%
            \strut%
           }%
      \par%
     }


\def\schluss{\stopbreaks}

\def\anlage
     {\@ifnextchar [
            {\@brieffuss{\@anlagedefault}}
            {\@brieffuss{\@anlagedefault}[]}
     }
\def\@anlagedefault        % Default-Werte der Parameter f"ur \anlage
     {\wort{Anlage:}
      \skip{2}
      \textrechts
     }

\def\ps
     {\@ifnextchar [
            {\@brieffuss{\@psdefault}}
            {\@brieffuss{\@psdefault}[]}
     }
\def\@psdefault           % Default-Werte der Parameter f"ur \ps
     {\wort{PS:}
      \skip{2}
      \textrechts
      \startbreaks % eigentlich keine Option, soll aber ausgef"uhrt
     }             % werden Seitenumbruch im Postscriptum zuzulassen

\newif\if@textrechts
\newskip\@wortlaenge

\long\def\@brieffuss
     #1%            Defaultsetzungen der optionalen Stilparameter
     [#2]%          Optionale Stilparameter
     #3%            Anlage- oder PS-Text
     {%
        {\def\skip
              ##1%
              {\gdef\@brieffussskip{##1}
              }
         \def\wort
              ##1%
              {\gdef\@brieffusswort{##1}
              }
         \def\textrechts{\global\@textrechtstrue}
         \def\textunten{\global\@textrechtsfalse}
         #1
         #2
        }%
      \schreibe@brieffuss{#3}
     }

\def\schreibe@brieffuss
     #1%          Anlage- oder PS-Text
     {{\vspace{\@brieffussskip\normalskip}
      \if@textrechts
         \settowidth{\@wortlaenge}{\rm \@brieffusswort\ }
         \@setpar{\@@par
                  \@tempdima=\textwidth%
                  \advance\@tempdima-\@wortlaenge%
                  \parshape \@ne \@wortlaenge \@tempdima
                 }
         \par\noindent
         \hbox to \z@
            {\hss%
             \rm \@brieffusswort\ %
            }%
      \else
         \par\noindent
         {\rm\@brieffusswort}%
         \\
      \fi%
      \ignorespaces
      #1
      \strut%
      \par%
     }}


%    ****************************************
%    *       ALLGEMEINE MARKIERUNGEN        *
%    ****************************************
%

\newcommand{\unterschriftbuchstabe}[1]{} % wird erst von sbrief.sty endgültig
                                         % definiert.
\def\brief
     {\@ifnextchar [
            {\@briefa}
            {\@briefa[]}
           }
\def\@briefa
     [#1]%        Name der Bearbeiterdatei
     #2%          Name der Briefkopfdatei
     {\@ifnextchar [
            {\@brief{#1}{#2}}
            {\@brief{#1}{#2}[]}
     }
\def\@brief
     #1%          Name der Bearbeiterdatei
     #2%          Name der Briefkopfdatei
     [#3]%        Stilparameter
     {\makeatletter            % da in den Dateien eventuell '@'-Zeichen
      \@briefdefaults          % Voreinstellungen         % vorkommen.
      \input{#2.sty}
      \def\@tempmaca{#1}
      \ifx\@empty\@tempmaca
      \else
         \input{#1.sty}
      \fi
      \makeatother
      #3           % Auswerten der Stilparameter
      \newpage
      \c@page\@ne
      \c@footnote\z@% 12.2.93 FP
      \c@mpfootnote\z@% 12.2.93 FP
      \c@equation\z@% 12.2.93 FP
      \interlinepenalty=200  % smaller than the TeXbook value
     }
\def\@briefdefaults{%
       \def\@absnametext{}
       \absname{an}
       \def\@absimfenstertext{}
       \absimfenster{an}
       \def\@organisationseinheittext{}
       \organisationseinheit{an}
       \def\@VAT{}
       \VAT{aus}
       \def\@randunten{24}
       \def\@datumtext{%
         \makebox[0mm][l]{\today}%
         \hspace{-5mm}%
         \makebox[0mm][r]{Datum}}
       \dat{an}
       \kopfsep{0}
       \def\@absanschrifttext{}
       \absanschrift{an}
       \num{an}
       \def\@teltext{}
       \tel{an}
       \def\@telextext{}
       \telex{an}
       \def\@randoben{20}
       \def\@absname{}
       \def\@abstel{}
       \def\@absuserid{}
       \def\@absnode{@uni-muenster.de}
       \def\@absdatexp{}
       \def\@absfax{}         % 3.9.1992 FP
       \def\schreibe@az{}
       \def\schreibeaz{}
       \adresse{}             % Default-Einstellung
       \def\@nachrichtlich{}
       \betr{}
       \def\@bezugszeichen{}
       \bezug{}
       \anrede{}
       \def\@grussformel{Mit freundlichen Gr\"{u}\ss{}en}
       \adressen@aus@dateifalse
       \kopien@voreinstellung{0}[\ablagevermerk1{1. Kopie}
                                \ablagevermerk2{2. Kopie}
                                \ablagevermerk3{3. Kopie}]
       \setze@faltmarkentrue    % 22.7.92 FP
}


\def\endbrief
     {\@@par
      \pagebreak
      \@@par
     }

\def\stopbreaks
     {\interlinepenalty \@M
      \def\par{\@@par\nobreak}
      \let\\=\@nobreakcr
      \let\vspace\@nobreakvspace
     }

\def\@nobreakvspace
     {\@ifstar
           {\@nobreakvspacex}
           {\@nobreakvspacex}
     }

\def\@nobreakvspacex
     #1%
     {\ifvmode\nobreak
         \vskip #1\relax
      \else
         \@bsphack
         \vadjust{\nobreak\vskip #1}
         \@esphack
      \fi
     }

\def\@nobreakcr
     {\vadjust{\penalty\@M}
      \@ifstar
           {\@xnewline}
           {\@xnewline}
     }

\def\startbreaks
     {\let\\=\@normalcr
      \interlinepenalty 200
       \def\par
            {\@@par
             \penalty 200
            }
     }


\def\@institutslogotext{}           % Initialisierung der Markierungen
\def\schreibe@institutslogo{\@institutslogotext}
                                    % f"ur den oberen Teil des Briefkopfes

% Mit \@blockdef werden Bl"ocke im Briefkopf ein oder ausgeschaltet
% und ihr vertikaler Abstand vom vorherigen Block bestimmt.
% Dabei wird abh"angend von den Parametern ein Makro definiert,
% dessen erster Namensteil \schreibe@ und dessen zweiter Namensteil
% wie in #2 angegeben lautet.
\def\@blockdef
     #1%  "Ubergabe der m"ogl. Parameter: an, aus oder eine ganze Zahl
     #2%  Name des Blockes
     #3%  default-Wert des vertikalen Abstandes vom vorherigen Block
     {{\def\@aus
            ##1%
            {\expandafter
             \gdef\csname schreibe@#2\endcsname
                   {\relax}
            }
       \def\@an
            ##1%
            {\expandafter
             \gdef\csname schreibe@#2\endcsname
                   {\vspace*{##1mm}
                    \parskip 0mm
                    \par%
                    \csname @#2text\endcsname
                   }
            }
       \setbox\@tempboxa=\hbox
                            {\ifcat 3#1  % pr"uft ob #1 eine Zahl enth"alt
                                \@an{#1} %  dann \@an mit dieser Zahl
                             \else       %  aufrufen, sonst direkt #1
                                \csname @#1\endcsname{#3} % aufrufen
                             \fi         % (enth"alt dann 'an' oder 'aus')
                            }
             % Beim "uberpr"ufen ob #1 eine Zahl enth"alt kann durch eine
             % mehrstellige Zahl nicht gewollter output entstehen, da
             % durch \ifcat nur der catcode der ersten Ziffer verglichen
             % wird. Um zu vermeiden, da"s die restlichen Ziffern aufs
             % Papier kommen, wird alles tempor"ar in eine Box gesetzt,
             % die dann weggeworfen wird.
     }}

\def\@blockdefb   % Wie \@blockdef aber ohne einstellbarem Abstand
     #1%
     #2%
     {{\def\@aus
            {\expandafter
             \gdef\csname schreibe@#2\endcsname
                   {\relax}
            }
       \def\@an
            {\expandafter
             \gdef\csname schreibe@#2\endcsname
                   {\csname @#2text\endcsname
                   }
            }
       \csname @#1\endcsname
     }}


%    ****************************************
%    *   STILPARAMETER VON \begin{brief}    *
%    ****************************************
%

\def\absname
     #1%
     {\@blockdef{#1}{absname}{2}
     }

\def\absimfenster
     #1%
     {\@blockdefb{#1}{absimfenster}
     }

\def\organisationseinheit
     #1%
     {\@blockdefb{#1}{organisationseinheit}
     }

\def\VAT
     #1%
     {\@blockdefb{#1}{VAT}
     }

\def\randunten
     #1%
     {\def\@randunten{#1}
     }

\def\dat
     #1%
     {\@blockdef{#1}{datum}{2}
     }

\def\kopfsep
     #1%
     {\def\@kopfsep{#1}
     }

\def\absanschrift
     #1%
     {\@blockdef{#1}{absanschrift}{1}
     }

\def\num             % bestimmt ob Seitennummern gesetzt werden sollen
     #1%             % oder nicht. Dies geschieht durch setzen von
     {{\def\@aus     % \setze@seitenstilfolgeseiten auf verschiedene
            ##1%     % Pagestyles
            {\gdef\setze@seitenstilfolgeseiten{\pagestyle{leer}}
            }
       \def\@an
            ##1%
            {\gdef\setze@seitenstilfolgeseiten{\pagestyle{std}}%
             \setcounter{page}{##1}
            }
       \setbox\@tempboxa=\hbox
                            {\ifcat 3#1
                                \@an{#1}
                             \else
                                \csname @#1\endcsname{1}
                             \fi
                            }
     }}

\def\tel
     #1%
     {\@blockdef{#1}{tel}{1}
     }

\def\telex
     #1%
     {\@blockdef{#1}{telex}{2}
     }

\def\randoben
     #1%
     {\def\@randoben{#1}
     }

\def\faltmarken                                 %
     #1%                                        %
     {{\def\@aus                                %
            {\global\setze@faltmarkenfalse}     %
       \def\@an                                 %
            {\global\setze@faltmarkentrue}      %
       \csname @#1\endcsname                    %
     }}                                         % ^ 22.7.92 FP


%    ****************************************
%    *      DIE MARKIERUNGEN IM BRIEF       *
%    ****************************************
%

\newcommand{\@bearbeitertext}{Bearbeiter}
\newcommand{\bearbeitertext}[1]{\renewcommand{\@bearbeitertext}{#1}}

\def\bearb
     #1%
     {\def\@absname{#1}
     }

\def\name
     #1%
     {\def\@absname{#1}
     }

\def\absendername
     #1%
     {\def\@absname{#1}
     }

\def\telefon
     #1%
     {\def\@abstel{#1}
     }

\def\userid
     {\@ifnextchar [
            {\@userid}
            {\@userid[\relax]}
     }
\def\@userid
     [#1]%
     #2%
     {\def\@absuserid{#2}
      #1
     }

\def\node
     #1%
     {\def\@absnode{#1}
     }

\def\datexp
     #1%
     {\def\@absdatexp{#1}
     }

\def\fax                        %
     #1%                        %
     {\def\@absfax{#1}          %
     }                          % ^ 3.9.1992 FP

\def\datum
     #1%
     {%\def\@datumtext{%
      %   \makebox[0mm][l]{Datum:}\par
      %   \makebox[0mm][l]{#1}%
      %   }%
    \def\@datumtext{\vbox{\hbox{Datum:}\hbox{#1}}}%
     }

\def\az
     #1%
     {\def\schreibeaz{#1}           % Als Parameter f"ur den Copy-Befehl
      \ifx\empty\schreibeaz%                            % 22.7.92 FP
          \def\schreibe@az{}%                           % 22.7.92 FP
      \else%                                            % 22.7.92 FP
        \PackageWarning{wwubrief}{Ein Aktenzeichen ist im CD 2017 nicht mehr vorgesehen}{}% 15.08.2017 gu
      \fi%                                              % 22.7.92 FP
     }

\long\def\adresse
     #1%
     {\def\@adresse{#1}
      \adressen@aus@dateifalse
     }

\long\def\nachrichtlich
     #1%
     {\def\@nachrichtlich{#1}
      \adressen@aus@dateifalse
     }

\def\betr
     {\@ifnextchar [
            {\@betr}
            {\@betr[]}
     }
\def\@betr
     [#1]%
     #2%
     {{\def\skip
            ##1%
            {\gdef\@betrskip{##1}
            }
       \gdef\@betrskip{}
       #1
       \ifx\@empty\@betrskip
          \gdef\@betrskip{2}
       \fi
       \gdef\@betrtext{#2}
      }
     }

\def\bezugszeichen
     #1%
     {\def\@bezugszeichen{#1}
     }

\def\bezug
     {\@ifnextchar [
            {\@bezug}
            {\@bezug[]}
     }
\def\@bezug
     [#1]%
     #2%
     {{\def\skip
            ##1%
            {\gdef\@bezugskip{##1}
            }
       \gdef\@bezugskip{}
       #1
       \ifx\@empty\@bezugskip
          \gdef\@bezugskip{2}
       \fi
       \gdef\@bezugtext{#2}
      }
     }

\def\anrede
     {\@ifnextchar [
            {\@anrede}
            {\@anrede[]}
     }
\def\@anrede
     [#1]%
     #2%
    {{\def\skip
           ##1%
           {\gdef\@anredeskip{##1}
           }
      \gdef\@anredeskip{}#1
      \ifx\@empty\@anredeskip
         \gdef\@anredeskip{2}
      \fi
      \gdef\@anredetext{#2}
    }}

\def\grussformel
     #1%
     {\def\@grussformel{#1}
     }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%             Definitionen fur Kopien und Serienbriefe          %%%%
%%%%  F"ur diese Befehle wurde die LaTeX-Output-Routine ge"andert!   %%%%

\newcount\kopien@zaehler
\newcount\kopien@anzahl

\def\adressdatei
      #1%
      {\def\@adressdatei{#1}
       \ifx\@empty\@adressdatei%        % 22.7.92 FP
       \else%                           % 22.7.92 FP
           \adressen@aus@dateitrue
           \def\@adresse{}      % Um leere Adresse im normalen Durchlauf
                                % zu bekommen
       \fi%                             % 22.7.92 FP
      }

\def\kopien
      #1%
      {\@ifnextchar [
             {\@kopien{#1}}
             {\@kopien{#1}[]}
      }
\def\@kopien
      #1%
      [#2]%
      {\kopien@anzahl=#1
       \kopien@zaehler=1
       \advance\kopien@anzahl by 1
       \loop                                      % Schleife zum
       \ifnum\kopien@zaehler<\kopien@anzahl       % initialisieren
          \expandafter\@namedef{ablagevermerk@\the\kopien@zaehler}{}
          \advance\kopien@zaehler by 1
       \repeat
       \def\ablagevermerk##1##2%
          {\expandafter\@namedef{ablagevermerk@\string ##1}{##2}}
       \ablagevermerke@voreinstellung
       #2
       }

\def\kopien@voreinstellung
      #1%
      {\@ifnextchar [
             {\@kopienvoreinstellungb{#1}}
             {\@kopienvoreinstellungb{#1}[]}
      }
\def\@kopienvoreinstellungb
      #1%
     [#2]%
     {\def\ablagevermerke@voreinstellung{#2}
      \kopien{#1}
     }
%\kopienvoreinstellung{0}[\ablagevermerk1{\schreibeaz}\ablagevermerk2{3}]

\def\schreibe@kopie
     #1%      enth"alt den Ablagevermerk der zu druckenden Seite
     #2%      enth"alt Adresse
     {
% ori anfang %%%%%%%%%%%%%%%%
\begingroup           % the \endgroup is put in by \aftergroup
  \let \protect \noexpand
  \@resetactivechars
  \global\let\@@if@newlist\if@newlist
  \global\@newlistfalse
  \@parboxrestore
  \shipout \vbox{%
    \set@typeset@protect
    \aftergroup \endgroup
    \aftergroup \set@typeset@protect
                                % correct? or just restore by ending
                                % the group?
% ori ende %%%%%%%%%%%%%%%%%%
         \hbox
             {\vbox to 0pt
                 {\hbox to 0pt
                     {\vrule height 0pt width 0pt
                      \hspace{\oddsidemargin}  % Positionieren auf
                      \vbox to 85mm             %       das
                         {\hsize 85mm           %  Brieffenster
                          \vskip 55mm           %
                          \vfill
                          {\let\backalt=\\
                           \def\\{\rule{0mm}{0mm}\backalt}
                           #2
                           \par
                          }
                          \vfill
                         }
                      \hss
                     }
                  \vss
                 }
              \vbox to 0pt
                 {\hbox to 0pt
                     {\vbox
                         {\hrule height 0pt width 0pt
                          \hsize .9\dinAvier@breite  % Positionieren
                          \vskip 1cm\raggedleft      % nach rechts oben
                          \hbox
                             {\vbox
                                 {\noindent%
                                  {#1}
                                 }
                             }
                         }
                      \hss
                     }
                  \vss
                 }%
\vtop{\hbox{}
% ori anfang %%%%%%%%%%%%%%%%
  \if@specialpage
% ori ende %%%%%%%%%%%%%%%%%%
%   \global\@specialpagefalse\@nameuse{ps@\@specialstyle}%
                             \@nameuse{ps@\@specialstyle}%
% ori anfang %%%%%%%%%%%%%%%%
  \fi
  \if@twoside
    \ifodd\count\z@ \let\@thehead\@oddhead \let\@thefoot\@oddfoot
         \let\@themargin\oddsidemargin
    \else \let\@thehead\@evenhead
       \let\@thefoot\@evenfoot \let\@themargin\evensidemargin
    \fi
  \fi
  \reset@font
  \normalsize
  \normalsfcodes
  \let\label\@gobble
  \let\index\@gobble
  \let\glossary\@gobble
  \baselineskip\z@skip \lineskip\z@skip \lineskiplimit\z@
    \@begindvi
    \vskip \topmargin
    \moveright\@themargin \vbox {%
      \setbox\@tempboxa \vbox to\headheight{%
        \vfil
        \color@hbox
          \normalcolor
          \hb@xt@\textwidth{\@thehead}%
        \color@endbox
        }%                        %% 22 Feb 87
      \dp\@tempboxa \z@
      \box\@tempboxa
% ori ende %%%%%%%%%%%%%%%%%%
      \if@specialpage
        \vskip \@ersteseiteheadsep
      \else
          \vskip \headsep
      \fi
%     \box\@outputbox
      \copy\@outputbox
% ori anfang %%%%%%%%%%%%%%%%
      \baselineskip \footskip
      \color@hbox
        \normalcolor
        \hb@xt@\textwidth{\@thefoot}%
      \color@endbox
      }%
% ori ende %%%%%%%%%%%%%%%%%%
}
             }
         }
     }

\def\schreibe@briefseite
    #1%
    {\schreibe@kopie{}{#1}
     \kopien@zaehler=1%
     \loop%
     \ifnum\kopien@zaehler<\kopien@anzahl%
        \if@specialpage
             \schreibe@kopie{\let\protect\relax\sf\Large% 17.8.94 FP
                \expandafter\@nameuse{ablagevermerk@\the\kopien@zaehler}}
                {#1}%
           \else
             \schreibe@kopie{}{}
        \fi
        \advance\kopien@zaehler by 1%
     \repeat%
    }


% ori anfang %%%%%%%%%%%%%%%%
\def\@outputpage{%
% ori ende %%%%%%%%%%%%%%%%%%
\if@specialpage
    \ifadressen@aus@datei
       {\def\adresse##1{\schreibe@briefseite{##1}}
        \input{\@adressdatei}
       }
      \else
       \schreibe@briefseite{}
    \fi
  \else
    \schreibe@briefseite{}
\fi
\global\@specialpagefalse% 18.11.94 FP
% ori anfang %%%%%%%%%%%%%%%%
  \global\let\if@newlist\@@if@newlist
  \global \@colht \textheight
  \stepcounter{page}%
  \let\firstmark\botmark
}
% ori ende %%%%%%%%%%%%%%%%%%



% Brief - Erweiterung: Ende

%    ****************************************
%    *            PAGE STYLES               *
%    ****************************************
%



\def\ps@briefersteseite
     {\headheight\@ersteseiteheadheight
      \headsep\@ersteseiteheadsep               % 23.1.92 FP
      \topmargin\@ersteseitetopmargin
      \@liefereseitenhoehe
                     {\@ersteseiteheadheight}
                     {\@ersteseiteheadsep}      % 23.1.92 FP
                     {\@ersteseitetopmargin}
      \textheight=\@seitenhoehe   % in \@seitenhoehe steht resultat von
                                  % \@liefereseitenhoehe
      \setlength{\@tempskipb}{-\oddsidemargin}  % Damit Faltmarken nicht
      \addtolength{\@tempskipb}{4.0mm}          % direkt auf dem Rand
                                                % liegen. Treiberprobleme.
      \def\@oddhead
           {\raisebox{0mm}[0mm][0mm]%
             {\parbox[t]{\textwidth}%
                {\ifsetze@faltmarken%                  % 22.7.92 FP
                     \makebox[0mm][l]%         % Setzen der Faltmarken
                         {\hspace*{\@tempskipb}%
                          \raisebox{-72mm}[0mm][0mm]%
                              {\rule{4mm}{.1mm}}
                         }%
                     \makebox[0mm][l]%         % Setzen der Faltmarken
                         {\hspace*{\@tempskipb}%
                          \raisebox{-115mm}[0mm][0mm]%
                              {\rule{4mm}{.1mm}}
                         }%
                 \else\fi%                             % 22.7.92 FP
                 \makebox[0mm][l]%               Setzen des Institutslogos
                     {\parbox[b]{\textwidth}%    oben im Briefkopf
                          {\schreibe@institutslogo}
                     }%
                 \hss%
                }%
             }%
           }
      \def\@oddfoot{}
      \def\@evenhead{}
      \def\@evenfoot{}
     }


\def\ps@std                % Standard (mit Seitennumerierung
     {\topmargin\@randoben mm
      \@liefereseitenhoehe{\headheight}{\headsep}{\topmargin} % 23.1.92 FP
      \textheight=\@seitenhoehe
      \def\@oddhead{}
      \def\@oddfoot
           {\rm
            \hfil
            \thepage
            \hfil
           }
      \def\@evenhead{}
      \let\@evenfoot\@oddfoot
     }

\def\ps@leer              % Keine Seitennummern
     {\topmargin\@randoben mm
      \@liefereseitenhoehe{\headheight}{\headsep}{\topmargin} % 23.1.92 FP
      \textheight=\@seitenhoehe
      \def\@oddhead{}
      \def\@oddfoot{}
      \def\@evenhead{}
      \def\@evenfoot{}
     }

%  ****************************************
%  *           PARAGRAPHING               *
%  ****************************************
%
\newdimen\normalskip
\normalskip .7em                   % Standardleerzeilenh"ohe
\parskip .7em                      % Extra vertical space between paragraphs.
\parindent  0pt                    % Width of paragraph indentation.
\topsep .4em                       % Extra vertical space, in addition to
                                   % \parskip, added above and below list and
                                   % paragraphing environments.
\partopsep 0pt                     % Extra vertical space, in addition to
                                   % \parskip and \topsep, added when user
                                   % leaves blank line before environment.
\itemsep .4em                      % Extra vertical space, in addition to
                                   % \parskip, added between list items.

% The following page-breaking penalties are defined

\@lowpenalty   51      % Produced by \nopagebreak[1] or \nolinebreak[1]
\@medpenalty  151      % Produced by \nopagebreak[2] or \nolinebreak[2]
\@highpenalty 301      % Produced by \nopagebreak[3] or \nolinebreak[3]

\@beginparpenalty -\@lowpenalty    % Before a list or paragraph environment.
\@endparpenalty   -\@lowpenalty    % After a list or paragraph environment.
\@itempenalty     -\@lowpenalty    % Between list items.

% \clubpenalty         % 'Club line'  at bottom of page.
% \widowpenalty        % 'Widow line' at top of page.
% \displaywidowpenalty % Math display widow line.
% \predisplaypenalty   % Breaking before a math display.
% \postdisplaypenalty  % Breaking after a math display.
% \interlinepenalty    % SET BY THE LETTER COMMANDS
% \brokenpenalty       % Breaking after a hyphenated line.



%    ****************************************
%    *                LISTS                 *
%    ****************************************
%

% The following commands are used to set the default values for the list
% environment's parameters. See the LaTeX manual for an explanation of
% the meanings of the parameters.  Defaults for the list environment are
% set as follows.  First, \rightmargin, \listparindent and \itemindent
% are set to 0pt.  Then, for a Kth level list, the command \@listK is
% called, where 'K' denotes 'i', 'ii', ... , 'vi'.  (I.e., \@listiii is
% called for a third-level list.)  By convention, \@listK should set
% \leftmargin to \leftmarginK.
%
% For efficiency, level-one list's values are defined at top level, and
% \@listi is defined to be a no-op.

\leftmargini   2.5em
\leftmarginii  2.2em    % > \labelsep + width of '(m)'
\leftmarginiii 1.87em   % > \labelsep + width of 'vii.'
\leftmarginiv  1.7em    % > \labelsep + width of 'M.'
\leftmarginv   1em
\leftmarginvi  1em

\leftmargin\leftmargini
\labelwidth\leftmargini\advance\labelwidth-\labelsep
\labelsep 5pt
\parsep 0pt
\let\@listi\relax

\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii\advance\labelwidth-\labelsep}

\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
    \topsep .2em
    \itemsep \topsep}

\def\@listiv{\leftmargin\leftmarginiv
     \labelwidth\leftmarginiv\advance\labelwidth-\labelsep}

\def\@listv{\leftmargin\leftmarginv
     \labelwidth\leftmarginv\advance\labelwidth-\labelsep}

\def\@listvi{\leftmargin\leftmarginvi
     \labelwidth\leftmarginvi\advance\labelwidth-\labelsep}

% ENUMERATE
%  Enumeration is done with four counters: enumi, enumii, enumiii
%  and enumiv, where enumN controls the numbering of the Nth level
%  enumeration.  The label is generated by the commands \labelenumi
%  ... \labelenumiv.  The expansion of \p@enumN\theenumN defines the
%  output of a \ref command.

\def\labelenumi{\arabic{enumi}.}
\def\theenumi{\arabic{enumi}}

\def\labelenumii{(\alph{enumii})}
\def\theenumii{\alph{enumii}}
\def\p@enumii{\theenumi}

\def\labelenumiii{\roman{enumiii}.}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi(\theenumii)}

\def\labelenumiv{\Alph{enumiv}.}
\def\theenumiv{\Alph{enumiv}}
\def\p@enumiv{\p@enumiii\theenumiii}

% ITEMIZE
% Itemization is controlled by four commands: \labelitemi, \labelitemii,
% \labelitemiii, and \labelitemiv, which define the labels of the various
% itemization levels.

\def\labelitemi{$\bullet$}
\def\labelitemii{\bf --}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}

% VERSE
%   The verse environment is defined by making clever use of the
%   list environment's parameters.  The user types \\ to end a line.
%   This is implemented by \let'in \\ equal \@centercr.
%
\def\verse{\let\\=\@centercr
  \list{}{\itemsep\z@ \itemindent -15pt\listparindent \itemindent
          \rightmargin\leftmargin\advance\leftmargin 15pt}\item[]}
\let\endverse\endlist

% QUOTATION
%   Fills lines
%   Indents paragraph
%
\def\quotation{\list{}{\listparindent 1.5em
    \itemindent\listparindent
    \rightmargin\leftmargin}\item[]}
\let\endquotation=\endlist

% QUOTE -- same as quotation except no paragraph indentation,
%
\def\quote{\list{}{\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist

% DESCRIPTION
%
%  To change the formatting of the label, you must redefine
%  \descriptionlabel.

\def\descriptionlabel#1{\hspace\labelsep \bf #1}
\def\description{\list{}{\labelwidth\z@ \itemindent-\leftmargin
       \let\makelabel\descriptionlabel}}

\let\enddescription\endlist



%    ****************************************
%    *         OTHER ENVIRONMENTS           *
%    ****************************************
%
%
% THEOREM
% \@begintheorem ... \@endtheorem are the commands executed at the
% beginning and end of a (user-defined) theorem-like environment.
% Except \@opargbegintheorem is executed when an optional argument is
% given.  Cf. LATEX.TEX.
%
% \def\@begintheorem#1#2{\it \trivlist \item[\hskip \labelsep{\bf #1\ #2}]}
% \def\@opargbegintheorem#1#2#3{\it \trivlist
%       \item[\hskip \labelsep{\bf #1\ #2\ (#3)}]}
% \def\@endtheorem{\endtrivlist}


% EQUATION and EQNARRAY
%
% \newcounter{equation}
%  Default is for left-hand side of equations to be flushleft.
%  To make them flushright, do:
%  \let\@eqnsel = \hfil
%

\def\theequation{\arabic{equation}}

% \jot = 3pt      % Extra space added between lines of an eqnarray environment

\arraycolsep 5pt     % Half the space between columns in an array environment.
\tabcolsep 6pt       % Half the space between columns in a tabular environment.
\arrayrulewidth .4pt % Width of rules in array and tabular environment.
\doublerulesep 2pt   % Space between adjacent rules in array or tabular env.

% TABBING
%
\tabbingsep \labelsep   % Space used by the \' command.  (See LaTeX manual.)

% MINIPAGE
%  \@minipagerestore is called upon entry to a minipage environment to
%  set up things that are to be handled differently inside a minipage
%  environment. In the current styles, it does nothing.
%
% \skip\@mpfootins : plays same role for footnotes in a minipage as
%                    \skip\footins does for ordinary footnotes

\skip\@mpfootins = \skip\footins

% FRAMEBOX
%
\fboxsep = 3pt    % Space left between box and text by \fbox and \framebox.
\fboxrule = .4pt  % Width of rules in box made by \fbox and \framebox.


%    ****************************************
%    *             FOOTNOTES                *
%    ****************************************
%
% \footnoterule is a macro to draw the rule separating the footnotes from
% the text.  It should take zero vertical space, so it needs a negative
% skip to compensate for any positive space taken by the rule.  (See
% PLAIN.TEX.)

\def\footnoterule{\kern-1\p@
  \hrule width .4\columnwidth
  \kern .6\p@}                 % The \hrule has default height of .4pt .

% \newcounter{footnote}

% The numbering style (arabic, alph, etc.) for ordinary footnotes
% is defined by the macro \thefootnote.
%
%   \@makefntext{NOTE} :
%        Must produce the actual footnote, using \@thefnmark as the mark
%        of the footnote and NOTE as the text.  It is called when effectively
%        inside a \parbox, with \hsize = \columnwidth.
%

\long\def\@makefntext#1{\noindent % Macro to make the text of a footnote
    \hangindent 5pt\hbox
    to 5pt{\hss $^{\@thefnmark}$}#1}

% \@makefnmark : A macro to generate the footnote marker that goes
%                in the text.  Default definition used.

\def\thefootnote{\fnsymbol{footnote}}% 12.2.93 FP

\def\thempfootnote{\fnsymbol{mpfootnote}}% 12.2.93 FP


%    ****************************************
%    *         FIGURES AND TABLES           *
%    ****************************************
%
% Float placement parameters set by some commands.  Easier to define
% them than change the commands.

\c@topnumber=2
\def\topfraction{.7}
\c@bottomnumber=1
\def\bottomfraction{.3}
\c@totalnumber=3
\def\textfraction{.2}
\def\floatpagefraction{.5}
\c@dbltopnumber= 2
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}


%    ****************************************
%    *            MISCELLANEOUS             *
%    ****************************************
%
% DATE
%
\def\today{\number\day.~\ifcase\month\or
  Januar\or Februar\or M"arz\or April\or Mai\or Juni\or
  Juli\or August\or September\or Oktober\or November\or Dezember\fi
  \space\number\year}



%    ****************************************
%    *           INITIALIZATION             *
%    ****************************************
%
% Default initializations

\smallskipamount=.5\normalskip  % These values are used by the letter macros.
\medskipamount=\normalskip
\bigskipamount=2\normalskip

\newif\ifErsterAufruf@Briefkopf  % Um das mehrfache Laden von Fonts im
\ErsterAufruf@Briefkopftrue      % Briefkopf zu vermeiden
\@briefdefaults
\ps@std                      % entspricht 'plain' page style
\pagenumbering{arabic}       % Arabic page numbers
\onecolumn                   % Single-column
\@fileswfalse                % Inhibits writing of .AUX file.

\endinput  % wwubrief.cls
