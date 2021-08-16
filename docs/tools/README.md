# tools

## Templating/Boilerplates

- go-replace - best tool to replace variables in files with environment files (like envsubt, but with go-template)
  - https://github.com/webdevops/go-replace
- boilr - generate files and directories based on templating tool
  - can generate single files(unlike cookiecutter) 
  - https://github.com/rgeyer/boilr (original repo is unmaintained)

## website frameworks/generators

### wikis

- Gitbook(note: unsupported now): https://github.com/GitbookIO/gitbook
    - see example: https://github.com/6uhrmittag/website-slashlog.org-gitbook-selfhosted
- wiki.js https://wiki.js.org/
    - looks amazing, but is super slow and heavy. Isn't like docsify.js.org
- Outlike - https://www.getoutline.com/
    - looks promising. No free version
    - technically possible to selfhost via Docker: https://github.com/chsasank/outline-wiki-docker-compose

### Static blog/cms generators

- https://getpublii.com/

### Static documentation generators

- https://docsify.js.org
- https://heinventions.github.io/docnado-site/
- https://github.com/myles/awesome-static-generators

## Diagrams

- https://www.infoq.com/articles/crafting-architectural-diagrams
- https://c4model.com/
- https://news.ycombinator.com/item?id=18508284

### diagram tools

#### general diagrams

- https://sketchboard.me :+1:
    - free plan includes private diagrams
- https://mermaidjs.github.io/gantt.html **untested yet**
- https://www.archimatetool.com/ **untested yet**
- https://vecta.io/app/edit/demo **untested yet**
- https://whimsical.com/ :+1:
    - free plan includes 4 diagrams
- https://www.diagram.codes/ **untested yet**
- https://diagrams.mingrammer.com/ Duagran as Code(Python) **untested yet**
- https://github.com/gaphor/gaphor easy to use UML **untested yet**

#### infrastructure diagrams

- https://arcentry.com/ - Create Interactive Cloud Diagrams **untested yet**
- https://cloudcraft.co/ - Create smart AWS diagrams **untested yet**
- http://go.drawthe.net/ - network diagrams dynamically from a text file **untested yet**
- https://gongxufan.github.io/web-topology/topologyEditor.html **untested yet**
- https://www.stackdraft.io/ **untested yet**
- https://clouddraw.app/ **untested yet**
- https://isoflow.io/ **untested yet**
- https://diagrams.mingrammer.com/ **untested yet**

#### programming diagrams

- https://www.heise.de/download/product/papdesigner-51889 - super simple Flowcharts, Programmablaufpläne, PAP
- http://www.nomnoml.com/
- https://github.com/gaphor/gaphor **untested yet**

#### BPMN - Business Process Model and Notation

- https://camunda.com/de/download/modeler/ **untested yet**
- https://demo.bpmn.io/new **untested yet**

#### JS charting libraries

- https://laue.js.org/examples/#advanced-examples **untested yet**
- https://frappe.io/datatable **untested yet**

#### c4

- https://github.com/RicardoNiepel/C4-PlantUML **untested yet**

#### Mindmapping

- Mindmap + Notes: https://brainio.com/#/ :+1:

#### handwriting

- https://pbs.twimg.com/media/D2SwK46XcAAZ5hG.jpg

#### other

- Create standard network protocol headers diagrams: http://www.luismg.com/protocol/ **untested yet**
- Sankey diagram: https://bl.ocks.org/wvengen/cab9b01816490edb7083 **untested yet**
- Railroad-diagram Generator: https://github.com/tabatkins/railroad-diagrams  **untested yet**
- ilograph - interactive diagrams of code: https://www.ilograph.com/  **untested yet**
- https://excalidraw.com/  **untested yet**

#### infographics

- https://infogram.com/ **untested yet**
- https://www.moovly.com/ **untested yet**
- https://venngage.com/ **untested yet**

#### stencils, icons

- https://stenciltown.omnigroup.com/stencils/microservice-architecture/

#### mockups

- imagineUI - mockups-as-code too: http://imagineui.io/en/ **untested yet**

## webserver

- SSL Configuration Generator by Mozilla :+1:
    - https://ssl-config.mozilla.org/

### nginx

- nginx config generator :+1:
    - https://www.digitalocean.com/community/tools/nginx#?
- Nginx config testing
    - https://github.com/yandex/gixy

## system tools

### security

- https://projectdiscovery.io/#/

### debug

- DNS diagnostigs&monitoring tool: https://dnsdiag.org **untested yet**

### system monitoring

- all-in-one dashboard: https://nicolargo.github.io/glances/ **untested yet**

## Windows Subsystem

- https://github.com/laurent22/wslpath
- https://www.opsview.com/resources/application/blog/opsview-wsltools-beta-go
    - monitoring and management interface for (WSL)
- https://github.com/sirredbeard/Awesome-WSL#wsl-tools

## Windows Admin Tools

- O&O RegEditor: https://www.oo-software.com/de/ooregeditor
    - free
    - legit developer, no scam/risk etc.
- https://docs.microsoft.com/en-us/sysinternals/
    - in terminal, without download: `live.sysinternals.com/<toolname>`

## Windows Misc. Tools (to install for daily use)

- Windows Explorer Media-File preview(by pressing spacebar): https://github.com/QL-Win/QuickLook

## media

## Media Libraries

- https://en.eagle.cool :+1:
    - win&mac
    - no free version
    - best tool available
- https://www.are.na **untested yet**
    - limited free version
- https://www.dropmark.com **untested yet**
    - limited free version
- https://raindrop.io **untested yet**
    - limited free version
- https://hypershoot.com **untested yet**
    - limited free version
- https://web.ggather.com **untested yet**
    - limited free version
- https://references.design **untested yet**
    - win&mac
    - no free version
    - only 10€

### knowledge management

- https://www.deepdyve.com

### macro tools

- https://www.macrocreator.com/
- http://hidmacros.eu/scripting.php#wsh
- https://www.perfectautomation.com/
- https://thetinytask.com/


### other
### machinery-project

inventory tool can clone suse systems, also works on ubuntu
http://machinery-project.org

````bash
sudo apt-get install ruby ruby-dev gcc make zlib1g-dev xdg-utils golang
sudo gem install rake
sudo gem install machinery-tool
````

#### usage

````bash
sudo machinery inspect localhost --ignore-scope changed-config-files,changed-managed-files,unmanaged-files
sudo machinery show localhost
sudo machinery export-html --html-dir test localhost
````

## tools to check out

- https://github.com/agarrharr/awesome-cli-apps
- log viewer:
    - https://github.com/tmoreno/open-log-viewer
- interactive charts diagrams
    - https://activechart.futureglobe.de/
- Intercept & view all your HTTP(S) Mock endpoints or entire servers Rewrite, redirect, or inject errors
    - https://httptoolkit.tech/
- brök - CLI tool to find broken links
    - https://github.com/smallhadroncollider/brok
- dynamic wallpapers
    - https://github.com/rocksdanister/lively
    - https://github.com/t1m0thyj/WinDynamicDesktop
- https://github.com/Awesome-Windows/Awesome
- https://github.com/sirredbeard/Awesome-WSL
- https://github.com/gjthompson1/glue-public
- https://usedevbook.com/
- https://github.com/tkainrad/keycombiner
- https://github.com/ajeetdsouza/zoxide
