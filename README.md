# pass-fzf (ratfork)

An extension for [pass](https://www.passwordstore.org/) that allows fuzzy finding in the store.

Requires [fzf](https://github.com/junegunn/fzf) to be installed.

# Usage

```
$ pass fzf
$ pass fzf -c
$ pass fzf show
$ pass fzf edit
```

# Installation

Typically, you would install this by copying `fzf.bash` to the default extensions directory and making the file executable:

```
$ cp fzf.bash ~/.password-store/.extensions
$ chmod +x ~/.password-store/.extensions/fzf.bash
```

You will also need to enable extensions by setting the environment variable `PASSWORD_STORE_ENABLE_EXTENSIONS`.  Here is an excerpt from my own `.bashrc` demonstrating the extension variable and also creating some handy aliases:

```
# password-store (pass)
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
alias pwc='pass fzf -c'
alias pws='pass fzf show'
alias pwe='pass fzf edit'
```

# Note on the fork

Forked from the original pass-fzf by Saggi Mizrahi: 
https://github.com/ficoos/pass-fzf

The difference between this and the original is that the original would use any additional parameters as a search query for FZF:

```
$ pass fzf [search-query]
```

This (ratfork) version lets you tack on commands and options to `pass` followed by the entry matched by FZF as shown in the Usage examples above.
