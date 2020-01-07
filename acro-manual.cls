% --------------------------------------------------------------------------
% the ACRO package
% 
%   Typeset Acronyms
% 
% --------------------------------------------------------------------------
% Clemens Niederberger
% Web:    https://bitbucket.org/cgnieder/acro/
% E-Mail: contact@mychemistry.eu
% --------------------------------------------------------------------------
% Copyright 2011--2020 Clemens Niederberger
% 
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
% 
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Clemens Niederberger.
% --------------------------------------------------------------------------
% The acro package consists of the files
% - acro.sty, acro.definitions.tex, acro.cfg
% - acro-manual.tex, acro-manual.pdf, acro-manual.cls
% - acro.history, README
% --------------------------------------------------------------------------
% If you have any ideas, questions, suggestions or bugs to report, please
% feel free to contact me.
% --------------------------------------------------------------------------
\ProvidesClass{acro-manual}[2020/01/05]

\LoadClass[load-preamble,add-index]{cnltx-doc}
\RequirePackage{imakeidx}
\RequirePackage[utf8]{inputenc}

\usepackage{acro}
\acsetup{
  single       = true ,
  macros       = true ,
  accsupp      = true ,
  index        = true ,
  use-barriers = true ,
  hyperref     = true ,
  log          = true
}

\setcnltx{
  package  = {acro} ,
  info     = {Typeset Acronyms and other Abbreviations} ,
  authors  = Clemens Niederberger ,
  email    = contact@mychemistry.eu ,
  url      = https://bitbucket.org/cgnieder/acro/ ,
  abstract = {%
    \acro\ allows you to define and use abbreviations in a simple way.
    Abbreviations can be divided into different classes of abbreviations.
    Lists of abbreviations can be created (also of separate classes of
    abbreviations) and printed wherever you want the lists to appear.\par
    \acro\ provides an option \option{single} which ignores abbreviations that
    are used only once in the whole document.\par
    As an experimental feature \acro\ also offers the option \option{sort} which
    automatically sorts the list created by \cs{printacronyms}.\par
    \acro\ also has the feature of creating \emph{local} lists
  } ,
  add-cmds = {
    ac, Ac, aca, Aca, acap, Acap, acbarrier, acdot, acf, Acf, acflike, acg,
      acfp, Acfp, acfplike, aciftrailing, acl, Acl, aclp, Aclp, acp, Acp,
      acpsingle, Acpsingle, AcroRegisterTrailing, acs, Acs, acsingle,
      Acsingle, acsp, Acsp, acspace, acreset, acresetall, acsetup,
    DeclareAcroCommand, DeclareAcronym, DeclareAcroExtraStyle,
      DeclareAcroFirstStyle, DeclareAcroListHeading, 
      DeclareAcroListStyle, DeclareAcroPageStyle, DeclarePseudoAcroCommand,
    iac, Iac, iaca, Iaca, iacs, Iacs, iacl, Iacl, iacf, Iacf, iacflike,
      Iacflike,
    NewAcroCommand, NewPseudoAcroCommand,
    printacronyms,
    ProvideAcroCommand, ProvideAcroEnding, ProvidePseudoAcroCommand,
    RenewAcroCommand, RenewPseudoAcroCommand
  } ,
  add-silent-cmds = {
    addcolon, DeclareInstance, babelhyphen, ExplSyntaxOff, ExplSyntaxOn, nato,
    NewDocumentCommand, newlist, ny, setlist
  } ,
  index-setup = { level = \section , headers={\indexname}{\indexname} }
}

\colorlet{property}{blue}
\newidxcmd\property{\code{\textcolor{property}{#1}}}[ (property)]
\newrobustcmd*\prop{\@ifstar{\cnltx@prop@star}{\cnltx@prop@nostar}}

\newrobustcmd*\cnltx@prop@star{%
  \cnltx@ifdash
    {\cnltx@prop@aux*\meta}
    {\cnltx@prop@aux*\marg}%
}
\newrobustcmd*\cnltx@prop@nostar{%
  \cnltx@ifdash
    {\cnltx@prop@aux{}\meta}
    {\cnltx@prop@aux{}\marg}%
}
\newcommand*\cnltx@prop@aux[4]{%
  \code{\property#1{#3}\cnltx@isvalue#2{#4}}%
}

\newrobustcmd*\propis{%
  \@ifstar
    {\cnltx@propis*}
    {\cnltx@propis{}}%
}
\newrobustcmd*\cnltx@propis[1]{%
  \cnltx@ifdash
    {\cnltx@prop@aux{#1}\@firstofone}
    {\cnltx@prop@aux{#1}\Marg}%
}
\newrobustcmd*\choiceprop{%
  \@ifstar
    {\cnltx@choiceprop@star}
    {\cnltx@choiceprop@nostar}%
}
\def\cnltx@choiceprop@star#1#2{%
  \code{\property*{#1}\cnltx@isvalue\choices{#2}}}
\def\cnltx@choiceprop@nostar#1#2{%
  \code{\property{#1}\cnltx@isvalue\choices{#2}}}
\newcommand*\boolprop{%
  \@ifstar
    {\cnltx@boolprop@star}
    {\cnltx@boolprop@nostar}%
}
\def\cnltx@boolprop@star#1{\choiceprop*{#1}{\default{true},false}}
\def\cnltx@boolprop@nostar#1{\choiceprop{#1}{\default{true},false}}

\newenvironment{properties}
  {%
    \def\propert{\@cnltx@option@item\property}%
    \def\propval{\@cnltx@option@item\prop}%
    \def\proplit{\@cnltx@option@item\propis}%
    \def\propchoice{\@cnltx@option@item\choiceprop}%
    \def\propbool{\@cnltx@option@item\boolprop}%
    \cnltxlist
  }
  {\endcnltxlist}

\protected\def\@versionstar{\raisebox{-.25em}{*}}
\newcommand\versionstar{\texorpdfstring{\@versionstar}{*}}

\newcommand*\latin{\textit}

\newcommand*\TF{\textcolor{red}{\uline{\code{\textcolor{cs}{\textit{TF}}}}}}

\RenewDocumentEnvironment{commands}{}
  {%
    \cnltx@set@catcode_{12}%
    \let\command\cnltx@command
    \cnltxlist
  }
  {\endcnltxlist}
  
\RequirePackage{tcolorbox,xsimverb}
\tcbuselibrary{skins,breakable}
\tcbset{enhanced,enhanced jigsaw}

\newtcolorbox{bewareofthedog}{
  colback  = white ,
  colframe = red ,
  underlay={%
    \path[draw=none]
      (interior.south west)
      rectangle node[red]{\Huge\bfseries !}
      ([xshift=-4mm]interior.north west);
    }%
}

\newtcolorbox{cnltxcode}[1][]{
  boxrule = 1pt ,
  colback = cnltxbg ,
  colframe = cnltx ,
  arc = 5pt ,
  beforeafter skip = .5\baselineskip ,%
  #1%
}

\newcommand*\acroman@readoptions[1]{%
  \catcode`\^^M=13
  \acroman@read@options{#1}%
}

\begingroup
\catcode`\^^M=13
\gdef\acroman@read@options#1#2^^M{%
  \ifblank{#2}{}{\acroman@read@options@#2}%
  #1%
  \XSIMfilewritestart*{\jobname.tmp}%
}%
\endgroup
\def\acroman@read@options@[#1]{\pgfqkeys{/cnltx}{#1}}

\RenewDocumentEnvironment{sourcecode}{}
  {%
    \begingroup
    \acroman@readoptions{%
      \endgroup
      \setlength\cnltx@sidebysidewidth
        {\dimexpr .45\columnwidth -\lst@xleftmargin -\lst@xrightmargin\relax}%
      \expanded{%
        \noexpand\lstset{
          style=cnltx,
          \ifboolexpe{ bool {cnltx@sidebyside} and not bool {cnltx@codeonly} }
            {linewidth=\cnltx@sidebysidewidth,}{}%
          \expandonce\cnltx@local@listings@options
        }%
      }%
      \XSIMgobblechars{2}%
    }%
  }
  {%
    \XSIMfilewritestop
    \cnltxcode[breakable]%
    \lstinputlisting[style=cnltx]{\jobname.tmp}%
    \endcnltxcode
  }

\RenewDocumentEnvironment{example}{}
  {%
    \begingroup
    \acroman@readoptions{%
      \endgroup
      \setlength\cnltx@sidebysidewidth
        {\dimexpr .45\columnwidth -\lst@xleftmargin -\lst@xrightmargin\relax}%
      \expanded{%
        \noexpand\lstset{
          style=cnltx,
          \ifboolexpe{ bool {cnltx@sidebyside} and not bool {cnltx@codeonly} }
            {linewidth=\cnltx@sidebysidewidth,}{}%
          \expandonce\cnltx@local@listings@options
        }%
      }%
      \XSIMgobblechars{2}%
    }%
  }
  {%
    \XSIMfilewritestop
    \ifbool{cnltx@sidebyside}
      {%
        \cnltxcode
        \noindent
        \minipage[c]{\cnltx@sidebysidewidth}%
          \cnltx@pre@source@hook
          \lstinputlisting[style=cnltx] {\jobname.tmp}%
          \cnltx@after@source@hook
        \endminipage\hfill
        \minipage[c]{\cnltx@sidebysidewidth}%
          \cnltx@pre@example@hook
          \input {\jobname.tmp}%
          \cnltx@after@example@hook
        \endminipage
      }
      {%
        \cnltxcode[breakable]%
        \cnltx@pre@source@hook
        \lstinputlisting{\jobname.tmp}%
        \cnltx@after@source@hook
        \tcblower
        \cnltx@pre@example@hook
        \input {\jobname.tmp}%
        \cnltx@after@example@hook
      }%
    \endcnltxcode
  }

\RequirePackage[
  backend=biber,
  style=cnltx,
  sortlocale=en_US,
  indexing=cite]{biblatex}
\RequirePackage{csquotes,varioref}
\defbibheading{bibliography}{\section{References}}

\RequirePackage[biblatex]{embrac}[2012/06/29]
\ChangeEmph{[}[,.02em]{]}[.055em,-.08em]
\ChangeEmph{(}[-.01em,.04em]{)}[.04em,-.05em]

% additional packages:
\RequirePackage{longtable,array,booktabs,enumitem,amssymb}

\newcommand*\h[1]{\textcolor{cnltx}{\textbf{#1}}}
\newcommand*\mailto[1]{\texttt{\href{mailto:#1}{#1}}}

\ProvideAcroEnding {possessive} {'s} {'s}

\endinput
