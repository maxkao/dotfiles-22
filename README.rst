
===========
Dotfiles
===========

| Source: https://github.com/westurner/dotfiles
| Download: https://github.com/westurner/dotfiles/releases
| Build: https://travis-ci.org/westurner/dotfiles
| Docs: https://westurner.org/dotfiles/
| Docs: https://westurner.github.io/dotfiles/
| Docs: https://wrdfiles.readthedocs.org/en/latest/

.. image:: https://img.shields.io/github/release/westurner/dotfiles.svg
   :target: https://github.com/westurner/dotfiles/releases

.. image:: https://img.shields.io/github/tag/westurner/dotfiles.svg
   :target: https://github.com/westurner/dotfiles/tags

.. image:: https://travis-ci.org/westurner/dotfiles.svg?branch=master
   :target: https://travis-ci.org/westurner/dotfiles

.. _GitHub: https://github.com/westurner/dotfiles
.. _Documentation: https://westurner.org/dotfiles/   
.. _ReadTheDocs: https://wrdfiles.readthedocs.org/en/latest/


Goals
=======
* Streamline frequent workflows
* Configure Bash, ZSH, and Vim
* Configure Python, pip, virtualenv, virtualenvwrapper
* Configure IPython
* Configure Gnome
* Configure i3wm
* Support Debian Linux, Ubuntu Linux, OSX
* Document commands and keyboard shortcuts
* Create a productive working environment


.. _installation:

Installation
==============

Requirements
---------------
Project requirements are installed by 
`bootstrap_dotfiles.sh`_ and/or, optionally, also a `Makefile`_.

* `Bash`, `Git`, `Python`, `pip`

.. _bootstrap_dotfiles.sh:
   https://github.com/westurner/dotfiles/blob/master/scripts/bootstrap_dotfiles.sh
.. _Makefile:
   https://github.com/westurner/dotfiles/blob/master/Makefile


.. _install the dotfiles:

Install the dotfiles
---------------------
| Source: https://github.com/westurner/dotfiles
| Documentation: https://westurner.org/dotfiles/


The `bootstrap_dotfiles.sh`_ shell script:

* clones the ``dotfiles`` and ``dotvim`` repositories
* creates symlinks from ``HOME`` to ``__DOTFILES``,
* installs the ``dotfiles`` Python package,
* installs additional requirements with `pip`

.. code:: bash

   wget bootstrap_dotfiles.sh
   bash ./scripts/bootstrap_dotfiles.sh -I -R


Create a `virtualenv` with `virtualenvwrapper`
named "``dotfiles``":

.. code:: bash

    # Install virtualenvwrapper
    pip install virtualenvwrapper   # apt-get install python-virtualenvwrapper
    source $(which 'virtualenvwrapper.sh')    # 07-bashrc.virtualenvwrapper.sh

    export WORKON_HOME="~/-wrk/-ve27"                    # __WRK/-ve python2.7      
    mkdir -p $WORKON_HOME
  
    # Create a virtualenvwrapper virtualenv
    mkvirtualenv dotfiles  # workon dotfiles
    mkdir $VIRTUAL_ENV/src
    cd $VIRTUAL_ENV/src

    # Clone the dotfiles git repository
    branch="master"     # stable
    # branch="develop"  # development
    git clone ssh://git@github.com/westurner/dotfiles -b ${branch}
    cd dotfiles

    # Install dotfiles pkg, symlinks, and extra pip requirements
    scripts/bootstrap_dotfiles.sh -I -R         # -I calls -S

With Python builds that haven't set a prefix which is writeable
by the current user, you can also install into ``~/.local`` with
``pip --user``:

.. code:: bash

    # (Optional) Also install pkg and reqs into ~/.local/bin (pip --user)
    # scripts/bootstrap_dotfiles.sh -I -R -u


.. _dotfiles git repository: https://github.com/westurner/dotfiles

.. note:: See `Quickstart`_, which uses venv-style paths.


Source the dotfiles
---------------------
* Bash (and ZSH) configuation sets are sequentially numbered 00-99.

  `00-bashrc.before.sh`_ sources a documented, numerically sequential
  sequence of bash scripts.

* ZSH loads much of the standard Bash configuration and oh-my-zsh.

  `00-zshrc.before.sh`_

* `bootstrap_dotfiles.sh`_ ``-S``
  installs dotfiles ``${__DOTFILES}`` symlinks.

  .. code:: bash

      ln -s ~/-dotfiles/etc/.bashrc ~/.bashrc
      ln -s ~/-dotfiles/etc/.zshrc ~/.zshrc

.. code:: bash

   # Source the dotfiles
   source ~/.bashrc                                         # source ~/.zshrc

   # source ${__DOTFILES}/etc/.bashrc
   ## source ${__DOTFILES}/etc/bash/00-bashrc.before.sh     # dotfiles_reload
   ### dotfiles configuration sequence                # (\d\d)-bashrc.(.*).sh
   #### source ${__DOTFILES}/etc/bash/99-bashrc.after.sh
   ##### source ${__PROJECTSRC}                     # ${__WRK}/.projectsrc.sh

   # print venv configuration
   dotfiles_status
   ds

.. code:: bash

    Last login: Tue Dec  2 15:01:56 on ttys000
    #
    # dotfiles_reload()
    #ntid  _TERM_ID="#SElGeTf5VcA"  #_USRLOG="/Users/W/-usrlog.log"
    # dotfiles_status()
    HOSTNAME='nb-mb1'
    USER='W'
    __WRK='/Users/W/-wrk'
    PROJECT_HOME='/Users/W/-wrk'
    WORKON_HOME='/Users/W/-wrk/-ve'
    VIRTUAL_ENV_NAME=''
    VIRTUAL_ENV=''
    _SRC=''
    _APP=''
    _WRD=''
    _USRLOG='/Users/W/-usrlog.log'
    _TERM_ID='#SElGeTf5VcA'
    PATH='/Users/W/.local/bin:/Users/W/-dotfiles/scripts:/usr/sbin:/sbin:/bin:/usr/local/bin:/usr/bin:/opt/X11/bin:/usr/local/git/bin'
    __DOTFILES='/Users/W/-dotfiles'
    #
    # cd /
    #SElGeTf5VcA W@nb-mb1:/
    $
    $ stid 'dotfiles'
    #stid  _TERM_ID="dotfiles"  #_TERM_ID__="dotfiles install"  #_USRLOG="/Users/W/-usrlog.log"
    # stid 'dotfiles'
    dotfiles W@nb-mb1:/
    $ 
    

.. _00-bashrc.before.sh:
    https://github.com/westurner/dotfiles/blob/master/etc/bash/00-bashrc.before.sh

.. _00-zshrc.before.sh:
    https://github.com/westurner/dotfiles/blob/master/etc/zsh/00-zshrc.before.sh

.. _bootstrap_dotfiles.sh:
    https://github.com/westurner/dotfiles/blob/master/scripts/bootstrap_dotfiles.sh


Upgrade the dotfiles
----------------------

.. code:: bash

   # check for any changes to symlinked dotfiles
   cdd                                                   # cddotfiles
   git status && git diff                                # gsi ; gitw diff

   # pull and upgrade dotfiles and dotvim
   scripts/bootstrap_dotfiles.sh -U



Quickstart
============

This is a verbose example of installing and working with a
``VIRTUAL_ENV`` in ``WORKON_HOME`` named "``dotfiles``".

See `Install the dotfiles`_ for more terse installation instructions.

.. code:: bash


    # clone and install dotfiles and dotvim
    # with venv-style paths (_SRC, _APP, _WRD)

    # __WRK             -- base path for workspace               [venv]
    __WRK="$HOME/-wrk"
    cd $__WRK                     # cdwrk                        [venv]

    # WORKON_HOME       -- path to virtualenv dirs  [virtualenvwrapper]
    WORKON_HOME="${__WRK}/-ve27"  # ~/-wrk/-ve27
    test -d ${WORKON_HOME} || mkdir -p ${WORKON_HOME}
    cd $WORKON_HOME               # cdworkonhome cdwh cdve       [venv]

    # VIRTUAL_ENV_NAME  -- basename for VIRTUAL_ENV              [venv]
    VIRTUAL_ENV_NAME="dotfiles"

    # VIRTUAL_ENV       -- current virtualenv path         [virtualenv]
    VIRTUAL_ENV="${WORKON_HOME}/${VIRTUAL_ENV_NAME}"
    cd $VIRTUAL_ENV               # cdv cdvirtualenv [venv, virtualenvwrapper]

    # _SRC              -- basepath of source repositories (e.g. for pip) 
    _SRC="${VIRTUAL_ENV}/src"
    cd $_SRC                      # cdsrc cds                    [venv]

    # _APP              -- basename of current working directory [venv]
    _APP="dotfiles"

    # _WRD              -- working directory path                [venv]
    _WRD="${_SRC}/${_APP}"        # cdwrd cdw                    [venv]

    git clone https://github.com/westurner/dotfiles $_WRD
    git clone https://github.com/westurner/dotvim ${_WRD}/etc/vim
    cd $_WRD                      # cdwrd cdw                    [venv]

    # __DOTFILES        -- symlink root for current dotfiles     [venv]
    __DOTFILES="${HOME}/-dotfiles"
    ln -s $_WRD $__DOTFILES
    ls ~/-dotfiles
    cd $__DOTFILES                # cddotfiles cdd               [venv]
  
    ## Install the dotfiles
    $_WRD/scripts/bootstrap_dotfiles.sh -h      # help
    $_WRD/scripts/bootstrap_dotfiles.sh -I      # or: make install
    $_WRD/scripts/bootstrap_dotfiles.sh -S      # or: make install_symlinks


For further documentation, see:

* https://westurner.org/dotfiles/usage
* https://westurner.org/dotfiles/venv



Further Dotfiles Resources
===========================
* https://dotfiles.github.io/
* https://github.com/webpro/awesome-dotfiles

.

* https://westurner.org/dotfiles/

  * https://westurner.org/dotfiles/usage
  * https://westurner.org/dotfiles/usage#bash
  * https://westurner.org/dotfiles/usage#vim
  * https://westurner.org/wiki/workflow
