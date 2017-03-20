# Termit [![Build Status](https://travis-ci.org/pawurb/termit.svg)](https://travis-ci.org/pawurb/termit) [![Gem Version](https://badge.fury.io/rb/termit.svg)](http://badge.fury.io/rb/termit) [![Coverage Status](https://coveralls.io/repos/pawurb/termit/badge.svg)](https://coveralls.io/r/pawurb/termit)

Termit is an easy way to translate stuff in your terminal. You can check out its node.js npm version [normit](https://github.com/pawurb/normit).

## Installation
```bash
gem install termit
```

Under RVM, your termit command may only be available under the ruby you install termit into. To prevent this, and to prevent gem conflicts, install termit into a dedicated gemset and create wrapper scripts:

```ruby
rvm default@termit --create do gem install termit
rvm wrapper default@termit --no-prefix termit
```

## Usage
```bash
termit 'source_language' 'target_language' 'text'
```

Example:

```bash
termit en es "hey cowboy where is your horse?"
=> "Hey vaquero dónde está tu caballo?"

termit fr en "qui est votre papa?"
=> "Who's Your Daddy?"
```

Quotation marks are not necessary for text data input:
```bash
termit fr ru qui est votre papa
=> "Кто твой папочка?"
```

### Speech synthesis

Specify a **-t** (talk) flag to use speech synthesis (requires mpg123):
```bash
termit en fr "hey cowboy where is your horse?" -t
=> "Hey cowboy où est votre cheval ?" # and a french voice says something about a horse
```

You can use termit as a speech synthesizer of any supported language without having to translate anything:
```bash
termit en en "hold your horses cowboy !" -t
=> "hold your horses cowboy !" # and an english voice asks you to hold on
```

### Learning language when committing to git

Idea by [Nedomas](https://news.ycombinator.com/item?id=7545747). See and hear your messages translated to target lang every time you commit. You can do this two ways: overriding the `git` command, and using a post-commit hook in git.

#### Override the `git` command (zsh only)

In **~/.zshrc**

```bash
export LANG=es
git(){[[ "$@" = commit\ -m* ]]&&termit en $LANG ${${@:$#}//./} -t;command git $@}
```

I am no shell ninja so if you know how to make it work in bash then please submit a PR.

#### Using a post-commit hook

Add a file named `post-commit` to your project's `.git/hooks` directory, with this in it:

```bash
termit en es "`git log -1 --pretty=format:'%s'`" -t
```

Remember to switch the languages according to your preference.

If you want this to be in every one of your git repositories, see [this Stack Overflow answer](http://stackoverflow.com/a/8842663/249801).

## Language codes:

To find all available language codes visit https://msdn.microsoft.com/en-us/library/hh456380.aspx

## Requirements

Works with Ruby 1.9.2 and higher.

To use speech synthesis you need to have mpg123 installed.

For Ubuntu:
```bash
sudo apt-get install mpg123
```

For MacOSX:
```bash
brew install mpg123
```

## Status

It was rewritten to work with [Bing Translator](https://www.bing.com/translator) . Thanks to [Ragnarson](https://ragnarson.com) for supporting it !

## Disclaimer

Termit works by scraping the private APIs and is therefore not recommended for use in production or on a large scale.
