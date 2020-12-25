% --------------------------------------------------------------------------
% the ACRO package
% 
%   Typeset Acronyms
% 
% --------------------------------------------------------------------------
% Clemens Niederberger
% Web:    https://github.com/cgnieder/acro/
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
\ProvidesClass{acro-manual}[2020/01/24]

\LoadClass[load-preamble,add-index]{cnltx-doc}
\RequirePackage{imakeidx}
\RequirePackage[utf8]{inputenc}

\RequirePackage{acro,accsupp}
\acsetup{
  use-id-as-short ,
  single = true ,
  index / use = true ,
  make-links = true ,
  list / template = manual ,
  list / heading = section ,
  list / display = all ,
  list / locale / display ,
  pages / display = all ,
  trailing / activate = dash
}

\setcnltx{
  package  = {acro} ,
  info     = {Typeset Acronyms and other Abbreviations} ,
  authors  = Clemens Niederberger ,
  email    = contact@mychemistry.eu ,
  url      = https://github.com/cgnieder/acro/ ,
  abstract = {%
    \acro\ allows you to define and manage acronyms and abbreviations. It can
    also be used for glossaries or nomenclatures.
  } ,
  add-cmds = {
    % basic commands:
    ac, Ac, aca, Aca, acf, Acf, acl, Acl, acs, Acs,
    iac, Iac, iaca, Iaca, iacf, Iacf, iacl, Iacl, iacs, Iacs,
    acp, Acp, acap, Acap, acfp, Acfp, aclp, Aclp, acsp, Acsp,
    acflike,
    % general commands:
    abbrdot, acdot, aciftrailing, acreset, acresetall, acspace, acsetup,
    acuse, acuseall, printacronyms,
    % used in templates and command definitions:
    acroindefinite, acroformat, acrofull, acrogroupcite, acroheading,
    acronymsmap, acronymsmapF, acronymsmapT, acroupper,
    acroneedpages, acronopagerange,
    acroifF, acroifT, acroifTF, acroifallF, acroifallT, acroifallTF,
    acroifanyF, acroifanyT, acroifanyTF, acroifchapterF, acroifchapterT,
    acroifchapterTF, acroiffirstF, acroiffirstT, acroiffirstTF,
    acropagefill, acropages, acroplural, acropreamble, acrotranslate,
    acrowrite,
    AcroAddRow, AcroNeedPackage, AcronymTable, AcroRerun, AcroStyle,
    NewAcroTemplate, RenewAcroTemplate, UseAcroTemplate,
    % declaring stuff:
    DeclareAcronym, DeclareAcroArticle, DeclareAcroEnding,
    DeclareAcroProperty,
    AddAcroTranslations, DeclareAcroTranslation,
    NewAcroCommand, RenewAcroCommand, DeclareAcroCommand, ProvideAcroCommand,
    % demonstration of the possessive ending:
    acg, acfg, aclg, acsg, iacsg, acropossessive,
    % demonstration if definite article:
    dacl, Dacl, dacs, Dacs, acrodefinite
  } ,
  add-silent-cmds = {
    babelhyphen, parencite,
    BeginAccSupp, EndAccSupp,
    if@filesw, acro@list,
    iupac, enquote,
    NewDocumentCommand,
    newabbreviation, printabbreviations,
    newspecies
  } ,
  index-setup = {
    level = \section , headers={\indexname}{\indexname} , noclearpage ,
    othercode = \footnotesize
  } ,
  makeindex-setup = { columns=3 , columnsep=1em } ,
  module-sep = {\texttt{/}}%
}

\DeclareTranslation{English}{cnltx-toc}{Table of contents}

\renewcommand*\arg[1]{\textcolor{argument}{\code{#1}}}

\newidxcmd\sym{\code{#1}}[ (symbol)]

\renewcommand*\cnltx@module@text[2]{%
  \begingroup
    \reversemarginpar
    \def\module@slash{\def\module@slash{\code{/}}}%
    \def\do##1{\module@slash\module#1{##1}}%
    \setlength\marginparsep{1em}%
    \marginnote{\hfill\llap{\docsvlist{#2}\cnltx@module@sep}}%
  \endgroup
}

\colorlet{property}{cnltxblue}
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

\newenvironment{properties}{%
  \renewrobustcmd*\cnltx@Default[1]{%
    \null\hfill
    \@ifnextchar\bgroup
      {\cnltx@Default@initial{##1}}
      {%
        \cnltx@ifbang
          {\cnltx@Default@required{##1}}
          {
            \cnltx@ifsym{=}%
              {\cnltx@Default@alias{##1}}
              {\cnltx@Default@empty{##1}}%
          }%
      }%
  }%
  \def\cnltx@Default@alias##1##2{%
    \llap{if unused then equal to \property{##2}}%
    \ifblank{##1}{\newline}{}%
  }% 
  \def\propert{\@cnltx@option@item\property}%
  \def\propval{\@cnltx@option@item\prop}%
  \def\proplit{\@cnltx@option@item\propis}%
  \def\propchoice{\@cnltx@option@item\choiceprop}%
  \def\propbool{\@cnltx@option@item\boolprop}%
  \cnltxlist
}
{\endcnltxlist}


\colorlet{template}{cnltxgreen}
\newidxcmd\template{\textit{\textcolor{template}{\code{#1}}}}[ (template)]
\cnltx@deflistitem{\cnltx@tmpl}{\template}

\newenvironment{templates}
  {%
    \let\tmpl\cnltx@tmpl
    \cnltxlist
  }
  {\endcnltxlist}

\DeclareTranslation{english}{cnltx-default}{Initial}

\protected\def\@versionstar{\raisebox{-.25em}{*}}
\newcommand\versionstar{\texorpdfstring{\@versionstar}{*}}

\newcommand*\TF{\textcolor{red}{\uline{\code{\textcolor{cs}{\textit{TF}}}}}}

\RequirePackage{fontawesome}
\RequirePackage{datetime2}
\DTMsetup{useregional=numeric,datesep=/}
\newrobustcmd*\acro@add@version[2]{%
  \csdef{ac@ver@#2}{%
    \DTMdate{#1}%
    \csgdef{ac@ver@#2used}{}%
    \csdef{ac@ver@#2}{\DTMdate{#1}}%
  }%
}

\newrobustcmd*\ac@date[1]{\ifcsdef{ac@ver@#1used}{}{ (\csuse{ac@ver@#1})}}
\newrobustcmd*\ac@ifnew[1]{\ifcsstring{c_acro_version_tl}{#1}}
\newrobustcmd*\ac@NEW{\faStarO\ New}

\renewrobustcmd*\sinceversion[1]{%
  \ac@ifnew{#1}%
    {\cnltx@version@note{\textcolor{red}{\ac@NEW}}}%
    {\cnltx@version@note{\GetTranslation{cnltx-introduced}~v#1\ac@date{#1}}}%
}
\renewrobustcmd*\changedversion[1]{%
  \cnltx@version@note{\GetTranslation{cnltx-changed}~v#1\ac@date{#1}}%
}

\newnote*\sincechanged[2]{%
  \GetTranslation{cnltx-introduced}~#1\ac@date{#1},
  changed with ~v#2\ac@date{#2}\ac@ifnew{#2}{ \ac@NEW}{}%
}

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
  colback  = red!2!white!98 ,
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
  \endgroup
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

\RequirePackage{hyperref}

% additional packages:
\RequirePackage{longtable,array,booktabs,enumitem,amssymb}

\def\translationtable{}
\newrobustcmd*\buildtranslationtable{%
  \csname__acro_for_all_translations_do:n\endcsname
    {%
      \ifstrequal{##2}{English}{%
        \g@addto@macro\translationtable{\texttt{##1} & ##3}%
      }{%
        \ifstrequal{##2}{German}{%
          \g@addto@macro\translationtable{ & ##3 \\}%
        }{%
          \ifstrequal{##2}{French}{%
            \g@addto@macro\translationtable{ & ##3}%
          }{}%
        }%
      }%
    }%
}

\buildtranslationtable

\DeclareAcroEnding{possessive}{'s}{'s}

\NewAcroCommand\acg{m}{\acropossessive\UseAcroTemplate{first}{#1}}
\NewAcroCommand\acfg{m}{%
  \acrofull
  \acropossessive
  \UseAcroTemplate{first}{#1}%
}

\DeclareAcroArticle{definite}{\nospace}

\NewAcroCommand\dacs{m}{\acrodefinite\UseAcroTemplate{short}{#1}}
\NewAcroCommand\dacl{m}{\acrodefinite\UseAcroTemplate{long}{#1}}

\NewAcroTemplate[list]{manual}{%
  \acroheading
  \acropreamble
  \begin{description}
    \acronymsmapF{%
      \item[\acrowrite{short}\acroifT{alt}{/\acrowrite{alt}}]%
        \acrowrite{long}%
        \acroifanyT{foreign,extra}{ (}%
        \acroifT{foreign}{%
          \acrowrite{foreign}%
          \acroifT{extra}{, }%
        }%
        \acroifT{extra}{\acrowrite{extra}}%
        \acroifanyT{foreign,extra}{)}%
        \acroifpagesT{ \dotfill\acropages{}{}}%
    }%
    { \item \AcroRerun{list} }%
  \end {description}
}

\NewAcroTemplate[list]{glossary}{%
  \begin{description}
    \acronymsmapF{%
      \item[\sffamily\acrowrite{short}] \acrowrite{long}%
    }%
    { \item \AcroRerun{list} }%
  \end {description}
}

% ----------------------------------------------------------------------------

\ExplSyntaxOn
\cs_set:Npn \__acro_get_issue_number:w   issue-   #1 \q_stop: {#1}
\cs_set:Npn \__acro_get_texsx_number:w   texsx-   #1 \q_stop: {#1}
\cs_set:Npn \__acro_get_texwelt_number:w texwelt- #1 \q_stop: {#1}
\cs_set:Npn \__acro_get_golatex_number:w golatex- #1 \q_stop: {#1}

\cs_new_protected:Npn \acro@example@links #1 {
  \href { \acro@example@texfile@path {#1} } { \color{white} [\TeX] } ~
  \href { \acro@example@pdffile@path.#1.pdf } { \color{white} [PDF] }
  \tl_if_in:nnT {#1} {issue}
    {
      \tl_set:Nx \l_tmpa_tl { \__acro_get_issue_number:w #1 \q_stop: }
      \space \href
        { https \c_colon_str //github.com/cgnieder/acro/issues/ \l_tmpa_tl / }
        { \color {white} [github] }
    }
  \tl_if_in:nnT {#1} {texsx}
    {
      \tl_set:Nx \l_tmpa_tl { \__acro_get_texsx_number:w #1 \q_stop: }
      \space \href
        { https \c_colon_str //tex.stackexchange.com/q/ \l_tmpa_tl / }
        { \color {white} [forum] }
    }
  \tl_if_in:nnT {#1} {texwelt}
    {
      \tl_set:Nx \l_tmpa_tl { \__acro_get_texwelt_number:w #1 \q_stop: }
      \space \href
        { http \c_colon_str //texwelt.de/wissen/fragen/ \l_tmpa_tl / }
        { \color {white} [forum] }
    }
  \tl_if_in:nnT {#1} {golatex}
    {
      \tl_set:Nx \l_tmpa_tl { \__acro_get_golatex_number:w #1 \q_stop: }
      \space \href
        { http \c_colon_str //golatex.de/viewtopic,p, \l_tmpa_tl .html }
        { \color {white} [forum] }
    }
}
\ExplSyntaxOff

\newcounter{examplefile}
\newcounter{examplefiles}
\newcommand*\acro@add@example[2]{%
  \listadd\acro@examplefiles{#1}%
  \csdef{acro@example@texfile@desc@#1}{#2}%
  \stepcounter{examplefiles}%
}
\newrobustcmd*\listexamplefiles{%
  \def\acro@example@texfile@path##1{./examples/acro.example.##1.tex}%
  \def\acro@example@pdffile@path{./examples/acro.example}%
  \def\acro@example@desc##1{\csuse{acro@example@texfile@desc@##1}}%
  \def\acro@example@title##1{%
    Example~\theexamplefile: \acro@example@desc{##1}%
    \\Links: \acro@example@links{##1}\hfill File: \code{acro.example.##1.tex}%
  }%
  \def\acro@example@bookmark##1{Example~\theexamplefile\ (\acro@example@desc{##1})}%
  \def\do##1{%
    \begin{cnltxcode}[
      step and label={examplefile}{example:##1} ,
      sidebyside align=top seam,sidebyside,
      righthand width=.3\linewidth,
      sidebyside gap=1em,
      lower separated=false,
      bottom=1mm,
      title=\acro@example@title{##1}%
    ]%
    \bookmark[level=2,dest=examplefile.\arabic{examplefile}]{\acro@example@bookmark{##1}}%
    \lstinputlisting[
      style=cnltx,firstline=8,lastline=15,firstnumber=7]{\acro@example@texfile@path{##1}}%
    \tcblower
    \fbox{%
      \href
        {\acro@example@pdffile@path.##1.pdf}%
        {%
          \includegraphics[
            type=pdf,
            ext=.##1.pdf,
            read=.##1.pdf,
            pagebox=cropbox,
            viewport=4.5cm 21.6cm 8.6cm 26cm,
            clip]{\acro@example@pdffile@path}%
        }%
    }%
    \end{cnltxcode}
  }%
  \dolistloop\acro@examplefiles
}

\newidxcmd\cmd{\code{\textbackslash\textcolor{white}{#1}}}

% ----------------------------------------------------------------------------
\newrobustcmd*\pdfdisable[2]{%
  \csdef{acro@@\cnltx@stripbs#1}##1{#2}%
  \def#1##1{%
    \csuse{acro_if_star_gobble:nTF}{##1}%
      {\csuse{acro@@\cnltx@stripbs#1}}%
      {\csuse{acro@@\cnltx@stripbs#1}{##1}}%
  }%
}

\pdfstringdefDisableCommands{%
  \pdfdisable\template{#1}%
  \pdfdisable\property{#1}
  \pdfdisable\cs{\string\\#1}%
  \pdfdisable\cmd{\string\\#1}%
  \pdfdisable\option{#1}%
  \def\oarg#1{[<#1>]}%
  \def\Oarg#1{[#1]}%
  \def\marg#1{\{<#1>\}}%
  \def\Marg#1{\{#1\}}%
  \def\acro{acro}%
  \def\LaTeX{LaTeX}%
  \def\TeX{TeX}%
}
% ----------------------------------------------------------------------------

\acro@add@example{basic}{Basic usage}
\acro@add@example{acflike}{Re-implement \cmd*{acflike}}
\acro@add@example{issue-109}{Invisible command for backref}
\acro@add@example{issue-111}{Defining a definite article}
\acro@add@example{issue-119}{Write the list of acronyms to an external file}
\acro@add@example{issue-154}{Insert word between acronym and citation}
\acro@add@example{possessive}{How to define a possessive ending}
\acro@add@example{texsx-505891}{Additional alternative form}
\acro@add@example{texsx-507726}{Foreign short form}% issue 136
\acro@add@example{texsx-513623}{Species}
\acro@add@example{texsx-515295}{Capitalization}
\acro@add@example{texsx-542461}{Articles and possessive forms}

% ----------------------------------------------------------------------------
% 2012: v0
\acro@add@version{2012-06-22}{0.1}
\acro@add@version{2012-06-23}{0.1a}
\acro@add@version{2012-06-24}{0.1b}
\acro@add@version{2012-06-24}{0.1c}
\acro@add@version{2012-06-24}{0.2}
\acro@add@version{2012-06-25}{0.2a}
\acro@add@version{2012-06-25}{0.3}
\acro@add@version{2012-06-27}{0.3a}
\acro@add@version{2012-06-29}{0.3b}
\acro@add@version{2012-07-16}{0.3c}
\acro@add@version{2012-07-23}{0.3d}
\acro@add@version{2012-07-24}{0.3e}
\acro@add@version{2012-09-28}{0.4}
\acro@add@version{2012-10-07}{0.4a}
\acro@add@version{2012-11-30}{0.5}
\acro@add@version{2012-12-14}{0.6}
\acro@add@version{2013-01-02}{0.6a}
% 2013: v1
\acro@add@version{2013-01-16}{1.0}
\acro@add@version{2013-01-26}{1.1}
\acro@add@version{2013-01-29}{1.1a}
\acro@add@version{2013-02-09}{1.2}
\acro@add@version{2013-04-04}{1.2a}
\acro@add@version{2013-05-06}{1.3}
\acro@add@version{2013-05-09}{1.3a}
\acro@add@version{2013-05-30}{1.3b}
\acro@add@version{2013-06-16}{1.3c}
\acro@add@version{2013-07-08}{1.3d}
\acro@add@version{2013-08-07}{1.3e}
\acro@add@version{2013-08-27}{1.4}
\acro@add@version{2013-09-02}{1.4a}
\acro@add@version{2013-09-24}{1.4b}
\acro@add@version{2013-11-04}{1.4c}
\acro@add@version{2013-11-22}{1.4d}
\acro@add@version{2013-12-18}{1.5}
\acro@add@version{2015-02-26}{1.6}
\acro@add@version{2015-04-08}{1.6a}
\acro@add@version{2015-05-10}{1.6b}
% 2015: v2
\acro@add@version{2015-08-16}{2.0}
\acro@add@version{2015-08-25}{2.0a}
\acro@add@version{2015-08-29}{2.0b}
\acro@add@version{2015-09-05}{2.1}
\acro@add@version{2015-10-03}{2.2}
\acro@add@version{2016-01-07}{2.2a}
\acro@add@version{2016-01-21}{2.2b}
\acro@add@version{2016-02-02}{2.2c}
\acro@add@version{2016-03-14}{2.3}
\acro@add@version{2016-03-25}{2.4}
\acro@add@version{2016-04-14}{2.4a}
\acro@add@version{2016-05-03}{2.4b}
\acro@add@version{2016-05-25}{2.5}
\acro@add@version{2016-05-26}{2.5a}
\acro@add@version{2016-05-30}{2.5b}
\acro@add@version{2016-07-20}{2.6}
\acro@add@version{2016-08-13}{2.6a}
\acro@add@version{2016-08-13}{2.6b}
\acro@add@version{2016-08-16}{2.6c}
\acro@add@version{2016-08-30}{2.6d}
\acro@add@version{2016-09-04}{2.6e}
\acro@add@version{2017-01-22}{2.7}
\acro@add@version{2017-02-09}{2.7a}
\acro@add@version{2017-06-21}{2.7b}
\acro@add@version{2017-08-28}{2.7c}
\acro@add@version{2018-01-30}{2.8}
\acro@add@version{2019-02-17}{2.9}
\acro@add@version{2019-09-23}{2.10}
\acro@add@version{2019-10-02}{2.10a}
\acro@add@version{2019-10-06}{2.10b}
\acro@add@version{2019-10-12}{2.10c}
\acro@add@version{2019-12-30}{2.10d}
\acro@add@version{2020-01-11}{2.11}
\acro@add@version{2020-01-16}{2.11a}
\acro@add@version{2020-01-24}{2.11b}
\acro@add@version{2020-02-03}{2.11c}
% 2020: v3
\acro@add@version{2020-04-29}{3.0}
\acro@add@version{2020-05-03}{3.1}
\acro@add@version{2020-05-10}{3.2}
\acro@add@version{2020-11-08}{3.2a}
\acro@add@version{2020-11-21}{3.3}
\acro@add@version{2020-12-25}{3.4}

\endinput
