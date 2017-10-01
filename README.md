Useful Scripts
===
Maybe useful.

## ./line_count.sh
Now, its very specific, but can be adapted to any purpose or file type.

**Purpose:** It count lines of code in a project.

**Usage:** Put above the directory e.g:

Supose `/User/Projects/aewsome-project`

Put here `/User/Projects/line_count.sh`

Now just run it, it should return something like this:
>
    JavaScript 5022 total de linhas
    Vue.js 913 total de linhas
    Stylus 336 total de linhas
    Shell 524 total de linhas
    YML 62 total de linhas

'_Total de linhas_' in portuguese means 'total lines'.

## ./clean_optimize.sh

**Purpose:** This tool will set up weekly system update/optimizing/cleaning using crontab. It works with arch linux and arch linux based distros. More explanations inside the script.

**Usage:** Just run it once.

## ./dist_hash.sh
**Purpose:** It checks the project structure integrity to see if there are any modifications, useful to avoid rebuilding the whole thing unnecessarily.

**Example:** 

![](https://i.imgur.com/wLE9MHt.png)
_Makefile_

![](https://i.imgur.com/OmMdqfI.png)
_dist_hash.sh_

![](https://i.imgur.com/W8lTEsJ.png)
_Makefile_

This is a makefile of webpack project, I use it instead of gulp/grunt and similars.

If the hash was changed (project was modified), return an argument that _make_ will use to decide if it is electron or not, and rebuild the project before running electron. If not, just run electron.

Thats it I will be adding more with time.
