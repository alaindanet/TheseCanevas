%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Thesis style for the University of Montpellier  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Contributeurs originaux:
%
% Style pour la redaction de these et de memoires.
% UQAR, 29 mai 2009.
%
% Inspire du travail de Mohammed Bahoura (UQAR) et de Gisele Legault
% (UQAM), avec leur assentimment (consenti a Pierre Saint-Laurent,
% Avril 2009).
%
% Modifié par Frédéric Cyr dans le but de rendre conforme aux exigences du guide de r�daction de janvier 2012 de l'UQAR.
% Aout 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modifié par Kévin Cazelles (Date)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modifié par Alain Danet pour le rendre conforme au style de l'Université de
% Montpellier (Julliet 2017) 
% Membres du jury: (source: http://tlsflyleaf.onada.fr/down.php)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Preambule

  \NeedsTeXFormat{LaTeX2e}
  % The date below is really important:
  % https://tex.stackexchange.com/questions/166558/custom-class-creating-compilation-problems
  \ProvidesClass{stylethese}[2017/07/05 Style pour theses UM]
  % Voir les marges
  \RequirePackage[noframe]{showframe}
  %Font
  \RequirePackage[default, osfigures]{opensans}
  \RequirePackage{setspace,remreset,graphicx,makeidx,ifthen, tikz}
  \RequirePackage[english,frenchb]{babel} % frenchb default
  %https://tex.stackexchange.com/questions/9908/difference-between-loadclass-and-loadclasswithoptions 
  \LoadClassWithOptions{book}
  \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
  \ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General.

  \setlength{\parindent}{1cm} % indentation des paragraphes
  \parskip 11pt plus 1pt minus 1pt % espace suplementaire entre les paragraphes (2 interligne)
  %https://en.wikibooks.org/wiki/LaTeX/Counters
  \newcounter{annexe}
  \setcounter{annexe}{0}
  %% Bold environment:
  %https://tex.stackexchange.com/questions/149404/bold-text-in-newenvironment
  \newenvironment{boldenv}
    {\bfseries}% \begin{boldenv}
      {}% \end{boldenv}
  \newenvironment{sboldenv}
    {\fontseries{sb}\selectfont}% \begin{sboldenv}
      {}% \end{sboldenv}

	  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Margin.

%https://www.sharelatex.com/learn/Lengths_in_LaTeX

  \setlength{\belowcaptionskip}{0.5cm}

  \if@twoside
    \setlength\headheight     {  12pt}
    \setlength\topmargin      {-1.0cm}
    \setlength\headsep        { 1.3cm}
    \setlength\oddsidemargin  { 1.0cm} % left margin for p.1,3,5...
    \setlength\evensidemargin { 0.0cm} % left margin for p.2,4,6...
    \setlength\textwidth      {15.6cm}
    \setlength\textheight     {21.6cm}
  \else
    \setlength\headheight     {  12pt}
    \setlength\topmargin      {-1.0cm}
    \setlength\headsep        { 1.3cm}
%   \setlength\oddsidemargin  { 1.0cm}
    \setlength\oddsidemargin  { 0.5cm} % same margin on both side of sheet.
    \setlength\textwidth      {15.6cm}
    \setlength\textheight     {21.6cm}
  \fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title page

  \RequirePackage{etoolbox}

  \def\unilogo#1{\def\@unilogo{#1}}
  \def\lablogo#1{\def\@lablogo{#1}}
  \def\university#1{\def\@university{#1}}
  \def\docschool#1{\def\@docschool{#1}}
  \def\lab#1{\def\@lab{#1}}
  \def\field#1{\def\@field{#1}}
  \def\titleEng#1{\def\@titleEng{#1}}
  \def\defensedate#1{\def\@defensedate{#1}}
  \def\serienumber#1{\def\@serienumber{#1}}
  % number of jury members:
  \def\njurymembers#1{\def\@njurymembers{#1}}

  \newcommand{\addjurymember}[6]{%
      \expandafter\gdef\csname @juryTitle#1\endcsname{#2}
      \expandafter\gdef\csname @juryName#1\endcsname{#3}
      \expandafter\gdef\csname @juryGrade#1\endcsname{#4}
      \expandafter\gdef\csname @juryInstitute#1\endcsname{#5}
      \expandafter\gdef\csname @juryFunction#1\endcsname{#6}
  }

  % number of jury members:
  \def\nsupervisors#1{\def\@nsupervisors{#1}}

  \newcommand{\addsupervisor}[2]{%
      \expandafter\gdef\csname @supervisorName#1\endcsname{#2}
  }

  \newtoks\@tabtoks
  \newcommand\addtabtoks[1]{\global\@tabtoks\expandafter{\the\@tabtoks#1}}
  \newcommand\eaddtabtoks[1]{\edef\mytmp{#1}\expandafter\addtabtoks\expandafter{\mytmp}}
  \newcommand*\resettabtoks{\global\@tabtoks{}}
  \newcommand*\printtabtoks{\the\@tabtoks}

  %https://tex.stackexchange.com/questions/588/how-can-i-change-the-margins-for-only-part-of-the-text
  \def\margepagetitre#1#2{\list{}{\leftmargin#1\rightmargin#2}\item[]}
  \let\endquote=\endlist
  %um color
  \definecolor{umred}{RGB}{255,86,96}
  \definecolor{umblue}{RGB}{75,194,188}
  \definecolor{concrete}{RGB}{149,165,166}
  \definecolor{titlecolor}{RGB}{114,146,162}

  \newcommand\Pagetitre{ %\AddToShipoutPicture*{\ShowFramePicture}
      \thispagestyle{empty}% Suppress numbering for title page 
      \begin{margepagetitre}{-1cm}{1cm}

	  \begin{sboldenv}
	    
      %En-tête
	      \begin{tikzpicture}[remember picture,overlay]
		  % Image arrière plan
		  \node[opacity=1.0, inner sep=0pt] at (current
		  page.center){\includegraphics[width=\paperwidth,height=\paperheight]{img/fond_UM.pdf}}; 

		  \node[opacity=1.0, inner sep=0pt, yshift = 3cm] at (current
		  page.south){\includegraphics[width=0.5\textwidth]{img/logo_um_texte.pdf}};
	      \end{tikzpicture}

	      \begin{center}

		  \vspace*{-2cm}
		  \textcolor{umred}{\Large TH\`ESE
		      POUR OBTENIR LE GRADE DE DOCTEUR\\ 
		  \vskip0.2cm{DE L'UNIVERSIT\'E DE MONTPELLIER}}


		  \vskip0.4cm{\fontseries{sb}\selectfont En 
		  \ifdef{\@field}{\@field}{[intitul\'e du dipl\^ome]}} \\

		  \vskip0.3cm{\'Ecole doctorale
		  \ifdef{\@docschool}{ \MakeUppercase{\@docschool} }{~}} \\

		  \vskip0.3cm{Unit\'e de recherche
		  %\vskip0.1cm{Unit\'es de recherche 
		  \ifdef{\@lab}{\@lab}{~}}

		  \vskip1.5cm
		  \textcolor{titlecolor}{
			  \ifdef{\@title}{\Large{\@title}}{\Large{Titre
			  de la th\`ese}}}

		  \vskip3cm{\fontseries{sb}\large Pr\'esent\'ee par 
		  \ifdef{\@author}{\@author}{[Pr\'enom NOM]}} \\

		  \vskip0.1cm{\large Le 
		  \ifdef{\@defensedate}{\@defensedate}{~[XX mois ann\'ee]}} \\

		  \vskip1cm{Sous la direction de
	      \ifnum \@nsupervisors=0
	      Pr\'enom NOM

		  ~
		  \else
	      \foreach \n in {1,...,\@nsupervisors} {%
		  {\csname @supervisorName\n \endcsname}
	      }
		  \fi
	      }

		  \vskip1cm{Devant le jury compos\'e de }
		  \vskip0.0cm

	      \end{center}

      \resettabtoks

	      \foreach \n in {1,...,\@njurymembers} {%
		  \-\hspace{0.7cm}% 
		  \eaddtabtoks{ {\csname @juryTitle\n \endcsname} } %
		  \eaddtabtoks{ {\csname @juryName\n \endcsname}, }%
		  \eaddtabtoks{ {\csname @juryGrade\n \endcsname}, }%
		  \eaddtabtoks{ {\csname @juryInstitute\n \endcsname} }%
		  \addtabtoks{ & \hfill }%
		  \eaddtabtoks{({\csname @juryFunction\n \endcsname}) }%
	      \addtabtoks{ \\ } }%

	      %% http://tlsflyleaf.onada.fr/down.php
	      \ifnum \@njurymembers=0
	     Membres du jury 
	      \else
	     \begin{table}[h!]
		  \footnotesize
		\advance\leftskip\leftmargin	
		\begin{tabular}{p{0.7\textwidth}p{0.3\textwidth}}  %instead of 5cm
		    \printtabtoks
		\end{tabular}
	      \end{table}
	      \fi

	  \end{sboldenv}
      \end{margepagetitre}
      \vskip.01cm\newpage
      \newpage\mbox{} % PSL, force a pagebreak in fake twopage.
  }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nouveaux environnements.

  %\newenvironment{appendices}
  %  {
  %    \begin{singlespace}
  %    \addcontentsline{toc}{chapter}{\MakeUppercase{appendices}}
  % }
  %  {\end{singlespace}\addvspace{3cm}}


  \newenvironment{chapintro}{\begin{singlespace}}{\end{singlespace}\addvspace{3cm}}
      % pour introduction des chapitres

  \newenvironment{liste} % pour la liste des abreviations et des symboles
                 {\list{}{\labelwidth\z@ \itemindent-\leftmargin
			  \let\makelabel\listelabel}} {\endlist}

  \newcommand*\listelabel[1]{\hspace\labelsep \normalfont\bfseries #1}

  \newenvironment{listeglossaire} % pour le glossaire
                 {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                          \let\makelabel\listeglossairelabel}}
                 {\endlist}
  \newcommand*\listeglossairelabel[1]{\hspace\labelsep
                                  \normalfont\bfseries #1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Environnements modifies.

  \renewenvironment{theindex}
     {\ifthenelse{\boolean{@twocolumn}}{\setboolean{@restonecol}{false}}%
                                       {\setboolean{@restonecol}{true}}%
      \addcontentsline{toc}{chapter}{\MakeUppercase{\indexname}}
      \twocolumn{\chapter*{\indexname}}%
      \markboth{\MakeUppercase\indexname}{\MakeUppercase\indexname}%
      \setlength\parindent{0pt}\setlength\parskip{0pt plus 0.3pt}%
      \setlength\columnseprule{0pt}\setlength\columnsep{35pt}%
      \thispagestyle{plain}\let\item\@idxitem }
     {\ifthenelse{\boolean{@restonecol}}{\onecolumn}{\clearpage}}

  \renewenvironment{quotation} % merci � Michael Totschnig (totschnig.michael@uqam.ca)
                 {\list{}{\listparindent 1.5em%
                          \itemindent    \listparindent
                          \rightmargin   \leftmargin
                          \parsep        \z@ \@plus\p@}%
                       \item\relax\begin{singlespace}}
                 {\end{singlespace}\endlist}

  \long\def\@makecaption#1#2{\begin{singlespace}% % Met le texte sous les figures a simple interligne
    \vskip\abovecaptionskip
    \sbox\@tempboxa{#1: #2}%
    \ifdim \wd\@tempboxa >\hsize
      #1: #2\par
    \else
      \global \@minipagefalse
      \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
    \fi
    \vskip\belowcaptionskip\end{singlespace}}% fin du simple interligne

% Type de document : these/memoire traditionnelle ou par articles.

  \newcommand\Chapitres{\newcommand\@typedoc{chapitre}}
  \newcommand\Articles{\newcommand\@typedoc{article}}

% Par defaut, le compteur des tableaux et des figures et remis a zero
%   a chaque debut de chapitre. Le guide est contre...

  \renewcommand{\thetable}{\arabic{table}}
  \@removefromreset{table}{chapter}
  \renewcommand{\thefigure}{\arabic{figure}}
  \@removefromreset{figure}{chapter}

% Definition des termes francais.

  \newcommand\@remerciements{Remerciements}
  \newcommand\@avantpropos{Avant-propos}
  \newcommand\@tabledesmatieres{Table des mati\`eres}
  \newcommand\@listedesfigures{Liste des figures}
  \newcommand\@listedestableaux{Liste des tableaux}
  \newcommand\@listeabrev{liste des abr\'{e}viations}
  \newcommand\@listesymboles{Liste des symboles}
  \newcommand\@resume{R\'esum\'e}
  \newcommand\@abstract{Abstract}
  \newcommand\@introduction{Introduction g\'en\'erale}
  \newcommand\@conclusion{Conclusion g\'en\'erale}
  \newcommand\@glossaire{glossaire}
% \newcommand\@references{Bibliographie}
  \newcommand\@references{R\'ef\'erences}
  \renewcommand\partname{Partie}
  \addto\captionsfrenchb{\renewcommand\chaptername{\@typedoc}}
  \addto\captionsfrenchb{\renewcommand\tablename{Tableau}}
  \addto\captionsenglish{\renewcommand\chaptername{\@typedoc}}
  \addto\captionsfrenchb{\renewcommand\figurename{Figure}}
  \addto\captionsenglish{\renewcommand\bibname{R\'ef\'erences}}
  \addto\captionsfrenchb{\renewcommand\bibname{R\'ef\'erences}}
% \renewcommand\appendixname{Annexe} % When babel is not in use...
% \renewcommand\indexname{Index}
% \renewcommand\figurename{Figure}
% \renewcommand\tablename{Tableau}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autres sections.

  \newcommand\remerciements{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@remerciements}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@remerciements}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\avantpropos{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@avantpropos}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@avantpropos}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\tabledesmatieres{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@tabledesmatieres}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@tabledesmatieres}}
    \@starttoc{toc}\if@restonecol\twocolumn\fi}

  \newcommand\listedestableaux{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@listedestableaux}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@listedestableaux}}
    \begin{singlespace}
    \@starttoc{lot}
    \end{singlespace}
    \if@restonecol
    \twocolumn\fi}

   \newcommand\listedesfigures{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@listedesfigures}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@listedesfigures}}
    \begin{singlespace}
    \@starttoc{lof}
    \end{singlespace}
    \if@restonecol
    \twocolumn\fi}

  \newcommand\listeabrev{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@listeabrev}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@listeabrev}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\listesymboles{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@listesymboles}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@listesymboles}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\resume{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@resume}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@resume}}
    \if@restonecol
     \twocolumn\fi}

   \newcommand\abstract{
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
     \fi\chapter*{
	 \ifdef{\@titleEng}{\MakeUppercase{\@titleEng}}{\MakeUppercase{Title
	 in English}}
	 \vskip1cm
     \textit{\@abstract} }
     \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@abstract}}
     \if@restonecol
     \twocolumn\fi}

  \newcommand\debutcorps{\clearpage %
       \pagenumbering{arabic}}

  \newcommand\introduction{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\@introduction}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@introduction}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\conclusion{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
%    \fi\chapter*{\textit{\@conclusion}}
    \fi\chapter*{\@conclusion}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@conclusion}}
    \if@restonecol
     \twocolumn\fi}

  \newcommand\glossaire{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \fi\chapter*{\textit{\@glossaire}}
    \phantomsection\addcontentsline{toc}{chapter}{\MakeUppercase{\@glossaire}}
    \if@restonecol
     \twocolumn\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table des matieres et liste.

  \setcounter{secnumdepth}{4}

  \def\l@chapter#1#2{\addpenalty{-\@highpenalty}
     \parskip 0pt % remise a zero de l'espacement des paragraphes
  %  \vskip 1.0em plus 1pt  % space above chapter line
     \vskip 0.0em plus 1pt  % PSL
     \@tempdima 8.0em       % width of box holding chapter number
     %\@dottedtocline{0}{0.0em}{1.5em}
     \begingroup
     \begin{singlespace} % titre des chapitre a simple interligne
       \parindent \z@ \rightskip \@pnumwidth
       \parfillskip -\@pnumwidth
  %    \bf                  % Boldface.
       \leavevmode          % TeX command to enter horizontal mode.
       % \advance\leftskip\@tempdima  %% added 5 Feb 88 to conform to
       % \hskip -\leftskip            %% 25 Jan 88 change to \numberline
       #1\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep
         mu$}\hfill
      \nobreak\hbox to\@pnumwidth{\hss #2}\par
       \penalty\@highpenalty %% added 24 May 89 as suggested by J. Leichter
      \end{singlespace} % fin de simple interligne
     \endgroup}

  \renewcommand\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
  \renewcommand\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
  \renewcommand\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
  \renewcommand\l@paragraph{\@dottedtocline{4}{10em}{5em}}
  \renewcommand\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
  \let\l@table\l@figure
  \renewcommand\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chapitres.

  \renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
  		    \thispagestyle{empty}%
  		    \global\@topnum\z@
                      \@afterindentfalse
                      \secdef\@newchapter\@snewchapter} % @newchapter = \chapter - @snewchapter =\chapter*

  \def\@newchapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \if@mainmatter
                           \refstepcounter{chapter}%
                           \typeout{\@chapapp\space\arabic{chapter}.}%
                           \addcontentsline{toc}{chapter}%
   {\protect\numberline{\MakeUppercase{\@chapapp}\space\MakeUppercase{\arabic{chapter}}}
   \texorpdfstring{\\ \MakeUppercase{#1}}{}}
   %https://tex.stackexchange.com/questions/10555/hyperref-warning-token-not-allowed-in-a-pdf-string 
                         \else
                           \typeout{#1}%
                           \addcontentsline{toc}{chapter}\MakeUppercase{#1}
                         \fi
                      \else
                        \typeout{#1}%
                        \addcontentsline{toc}{chapter}\MakeUppercase{#1}
                      \fi
                      \chaptermark{#1}%
%                     \addtocontents{lof}{\protect\addvspace{10\p@}}
                      \addtocontents{lof}{\protect\addvspace{0\p@}}
                      \addtocontents{lot}{\protect\addvspace{0\p@}}
                      \if@twocolumn
                        \@topnewpage[\@makenewchapterhead{#2}]
                      \else
                        \@makenewchapterhead{#2}\@afterheading
                      \fi}
  \def\@makenewchapterhead#1{%
    {\begin{center} \normalfont
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
          \vspace*{0.1cm}% moitier de la valeur souhaite mais fonctionne
          \normalsize\bfseries \MakeUppercase{\@chapapp}\space \MakeUppercase{\arabic{chapter}}
          \par\nobreak
  %       \vskip 1cm % moitier de la valeur souhaite mais fonctionne % PSL
        \fi
      \fi
      \interlinepenalty\@M
      \normalsize\bfseries \MakeUppercase{#1}\par\nobreak
  %   \vskip 1.5cm % moitier de la valeur souhaite mais fonctionne % PSL
      \end{center}
    }}
  \def\@snewchapter#1{\if@twocolumn
                     \@topnewpage[\@makesnewchapterhead{#1}]%
                   \else
                     \@makesnewchapterhead{#1}%
                     \@afterheading
                   \fi}
  \def\@makesnewchapterhead#1{%
    {\begin{center} \normalfont
      \interlinepenalty\@M
      \normalsize \bfseries  \MakeUppercase{#1}\par\nobreak
      \vskip 20\p@
      \end{center}
    }}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Appendices.

  \newcommand\appendice{\if@openright\cleardoublepage\else\clearpage\fi
  		    \thispagestyle{empty}%
  		    \global\@topnum\z@
                      \@afterindentfalse
                      \secdef\@anewchapter\@sanewchapter} % @newchapter = \chapter - @snewchapter =\chapter*

  \def\@anewchapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \if@mainmatter
                           \refstepcounter{annexe}%
                           \typeout{\MakeUppercase{Annexe}\space\Roman{annexe}}%
                           \addcontentsline{toc}{chapter}%
   {\protect\numberline{\MakeUppercase{Annexe}\space \Roman{annexe}} \texorpdfstring{\\ \MakeUppercase{#1}}{}}%
                         \else
                           \typeout{#1}%
                           \addcontentsline{toc}{chapter}\MakeUppercase{#1}%
                         \fi
                      \else
                        \typeout{#1}%
                        \addcontentsline{toc}{chapter}\MakeUppercase{#1}%
                      \fi
                      \chaptermark{#1}%
                      \addtocontents{lof}{\protect\addvspace{10\p@}}%
                      \addtocontents{lot}{\protect\addvspace{10\p@}}%
                      \if@twocolumn
                        \@topnewpage[\@makeanewchapterhead{#2}]%
                      \else
                        \@makeanewchapterhead{#2}\@afterheading
                      \fi}
  \def\@makeanewchapterhead#1{%
    {\begin{center} \normalfont
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
          \vspace*{0.5cm}% moitier de la valeur souhaite mais fonctionne
          \normalsize\bfseries \MakeUppercase{Annexe}\space \Roman{annexe}
          \par\nobreak
          \vskip 1cm % moitier de la valeur souhaite mais fonctionne
        \fi
      \fi
      \interlinepenalty\@M
      \normalsize\bfseries \MakeUppercase{#1}\par\nobreak
      \vskip 1.5cm % moitier de la valeur souhaite mais fonctionne
      \end{center}
    }}
  \def\@sanewchapter#1{\if@twocolumn
                     \@topnewpage[\@makesanewchapterhead{#1}]%
                   \else
                     \@makesanewchapterhead{#1}%
                     \@afterheading
                   \fi}
  \def\@makesanewchapterhead#1{%
    {\begin{center} \normalfont
      \interlinepenalty\@M
      \normalsize \bfseries  \MakeUppercase{#1}\par\nobreak
      \vskip 20\p@
      \end{center}
    }}

  \renewcommand\section{\@startsection
  {section} % nom de section
  {1} % niveau (-1 part, 0 chap, 1 sect, etc)
  {\z@} % indent
  {3.5ex plus 1ex minus .2ex} % espace avant
  {2.3ex plus .2ex} % espace apres
  {\normalsize\bfseries}} % style

  \renewcommand\subsection{\@startsection
  {subsection} % nom de section
  {2} % niveau (-1 part, 0 chap, 1 sect, etc)
  {\z@} % indent
  {3.25ex plus 1ex minus .2ex} % espace avant
  {1.5ex plus .2ex} % espace apres
  {\normalsize\bfseries}}


  \renewcommand\subsubsection{\@startsection
  {subsubsection} % nom de section
  {3} % niveau (-1 part, 0 chap, 1 sect, etc)
  {\z@} % indent
  {3.25ex plus 1ex minus .2ex} % espace avant
  {1.5ex plus .2ex} % espace apres
  {\normalsize\bfseries}} % style


% From Kévin preamble:

\setlength{\emergencystretch}{3em}  % prevent overfull lines
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\setcounter{secnumdepth}{0}
% Redefines (sub)paragraphs to behave more like sections
\ifx\paragraph\undefined\else
\let\oldparagraph\paragraph
\renewcommand{\paragraph}[1]{\oldparagraph{#1}\mbox{}}
\fi
\ifx\subparagraph\undefined\else
\let\oldsubparagraph\subparagraph
\renewcommand{\subparagraph}[1]{\oldsubparagraph{#1}\mbox{}}
\fi

%\captionsetup{singlelinecheck=false}
% \captionsetup{singlelinecheck=false}

% Taille des légendes des 'Long Tables'
%\setlength{\LTcapwidth}{\linewidth}
% \setlength{\LTcapwidth}{1.5\linewidth} 
\setlength{\footnotesep}{1cm}

%Régler le problème des Et/And entre deux auteurs (voir le fichier "tutoriel bst")
\newcommand*{\andname}{and}
      \addto \captionsenglish {\renewcommand*{\andname}{and}}
      \addto \captionsfrench  {\renewcommand*{\andname}{et}}
%Intitulé des figures en français
\addto\captionsfrench{\renewcommand{\figurename}{Figure}}
%Intitulé des tableaux en français
\addto\captionsfrench{\renewcommand{\tablename}{Tableau}}


%% Headings style numbering:
\pagestyle{myheadings}{
  \pagenumbering{roman}
  \if@twoside
  \else
  \fi
  \endinput
  }
