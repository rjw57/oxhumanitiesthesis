%
% ociamthesis v2.0
% By Keith A. Gillow <gillow@maths.ox.ac.uk>
% Version 1.0 released 26/11/1997
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ociamthesis}[2006/08/18 v2.0 OCIAM thesis class]
%-------------------------- initial code -----------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
%\LoadClass[a4paper]{report}
% As an alternative to the above could use next line for twosided output
\LoadClass[a4paper,twoside,openright]{report}




\raggedbottom

\newcommand{\submittedtext}{{A thesis submitted for the degree of}}

%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your Oxford college (e.g. Christ Church, Pembroke)
\def\college#1{\gdef\@college{#1}}


%
% CRESTS
%

% Traditional Oxford crest

%Using latex metafont (Mathematical Institute system)
%\font\crestfont=oxcrest40 scaled\magstep3
%\def\crest{{\crestfont \char1}}
%For comlab system replace 1st line above with
%\font\crestfont=crest scaled\magstep3

%To use an EPS image instead obtain suitable crest.eps file and
%uncomment next line
\def\crest{{\includegraphics{crest}}}

% New Oxford Belt crest

%Using latex metafont (Mathematical Institute system)
%\font\beltcrestfont=oxbeltcrest
%\def\beltcrest{{\beltcrestfont \char0}}
%For comlab system replace 1st line above with
%\font\beltcrestfont=newcrest

%To use an EPS image instead obtain suitable beltcrest.eps file and
%uncomment next line
\def\beltcrest{{\includegraphics{beltcrest.pdf}}}


%
% Define text area of page and margin offsets
%
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.25in} % this is the inside margin of odd-numbered pages.  The actual width is this value + 1in.  University regulations state the inside margin should be ~1.25in.
\setlength{\evensidemargin}{0.5in} % This is the outside margin of even-numbered pages.  The actual width is this value + 1in
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{5.55in} % this indirectly sets the opposite margin.  Overall width of page is ~8.25in

%
% Define the page style to print the chapter heading and page at
% top of each except the front matter and the first page of each chapter
%
% \pagestyle{headings} % This is the original command
% Sam's insert
\usepackage{fancyhdr}
\fancyhf{} % clear the header and footers
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}} 
\renewcommand{\headrulewidth}{0pt}
\fancyhead[LO]{\emph{\rightmark}} 
\fancyhead[RE]{\emph{\leftmark}} 
\fancyhead[RO,LE]{\emph{\thepage}}




%
% Environments
%

% This macro define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}




%define title page layout
\renewcommand{\maketitle}{%
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
  \null\vfill
  \begin{center}
    { \Huge {\bfseries {\@title}} \par}
{\large \vspace*{40mm} {\crest \par} \vspace*{25mm}}
    {{\Large \@author} \par}
{\large \vspace*{1ex}
    {{\@college} \par}
\vspace*{1ex}
    {University of Oxford \par}
\vspace*{25mm}
    {{\submittedtext} \par}
\vspace*{1ex}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}
  \null\vfill
\end{alwayssingle}}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{verse}\begin{center}}
{\end{center}\end{verse}\end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\begin{alwayssingle} \thispagestyle{empty}
	\begin{center}
	\vspace*{1.5cm}
	{\Large \bfseries Acknowledgements}
	\end{center}
	\vspace{0.5cm}
	\begin{singlespace}
}
{
	\end{singlespace}
	\end{alwayssingle}
}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

% STATEMENT OF ORIGINALITY (AS SUGGESTED BY GSW)
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

\newenvironment{originality}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The originalitylong environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself does not appears in a quote environment so you can 
% get more in.

\newenvironment{originalitylong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}


%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{singlespace}}
{\end{singlespace}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractlong} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \thispagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@college} \par}
    {University of Oxford \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate} \par}
\vspace*{4ex}    
  {\Large \bfseries  Abstract}
  \end{center}
\vspace{0.5cm}
   \begin{singlespace}}
{\end{singlespace}\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}








%
%SAM'S EDITS
%

%FRONTPAGES
%
% The frontpages environment surpresses numbering for the front matter

\newenvironment{frontpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\Alph{page}}\pagestyle{empty}}
{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}




%for quick prints
\newcommand{\makequicktitle}{
\begin{center}
{{\@title} \par}
{{\@date}}
\end{center}
}


%Caption for Figures
%
% The text on the figures is too big.  This makes it smaller.

% Different font in captions
\newcommand{\captionfonts}{\small}

\makeatletter  % Allow the use of @ in command names
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\captionfonts #1: #2}}%
  \ifdim \wd\@tempboxa >\hsize
    {\captionfonts #1: #2\par}
  \else
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\makeatother   % Cancel the effect of \makeatletter


%Figure placement on page
%
%This is to help prevent too many figures on their own pages.  I got it from:
% http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/LatexTips.html#captfont

\renewcommand{\topfraction}{0.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.75}



% VERSE, QUOTATION, and QUOTE must be single-spaced.
% These rename the internal commands for the \begin{...} and
% \end{...} environment commands.
\let\oldquote=\quote
\let\oldendquote=\endquote
\renewenvironment{quote}
   {\oldquote\begin{singlespace}}
   {\end{singlespace}\oldendquote}




