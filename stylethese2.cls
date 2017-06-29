%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Thesis style for the University of Montpellier  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% - Principal inspiration :

% UQAR cls


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Preambule

  \NeedsTeXFormat{LaTeX2e}
  \ProvidesClass{stylethese2}[2017 Style pour theses UM]
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

%https://tex.stackexchange.com/questions/588/how-can-i-change-the-margins-for-only-part-of-the-text
