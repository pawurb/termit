#Termit [![Build Status](https://travis-ci.org/pawurb/termit.png)](https://travis-ci.org/pawurb/termit) [![Gem Version](https://badge.fury.io/rb/termit.png)](http://badge.fury.io/rb/termit) [![Coverage Status](https://coveralls.io/repos/pawurb/termit/badge.png)](https://coveralls.io/r/pawurb/termit)


Termit is an easy way to use Google Translate in your terminal. Check out its node npm version [normit](https://github.com/pawurb/normit) !


## Installation
```ruby
gem install termit
```

## Usage
```ruby
termit 'source_language' 'target_language' 'text'
```

Example:

```ruby

termit en es "hey cowboy where is your horse?"
=> "Hey vaquero dónde está tu caballo?"

termit fr en "qui est votre papa?"
=> "Who's Your Daddy?"
```

Parenthesis are not necessary for text data input:
```ruby
termit fr ru qui est votre papa?
=> "Кто твой папочка?"
```
#### Speech synthesis

Specify a **-t** (talk) flag to use speech synthesis (requires mpg123):
``` ruby
termit en zh "hey cowboy where is your horse?" -t
=> "嘿，牛仔是你的马在哪里？" # and a chinese voice says something about a horse
```

You can use termit as a speech synthesizer of any supported language without having to translate anything:
``` ruby
termit en en "hold your horses cowboy !" -t
=> "hold your horses cowboy !" # and an english voice asks you to hold on
```

#### Synonyms

Specify a **-s** (synonyms) flag to get the list of synonyms if available:
``` ruby
termit es en muchacho -s
=> boy
=> Synonyms: boy, lad, youngster, laddie, cully
```

#### Learning language when committing to git (zsh only)
Idea by [Nedomas](https://news.ycombinator.com/item?id=7545747) . See and hear your messages translated to target lang every time you commit:

In **~/.zshrc**
```bash
export LANG=es
git(){[[ "$@" = commit\ -m* ]]&&termit en $LANG ${${@:$#}//./} -t;command git $@}
```


## Language codes:
* english - en
* polish - pl
* french - fr
* spanish - es
* slovakian - sk
* chinese - zh
* russian - ru
* automatic source language detection - auto

To find all available language codes visit www.translate.google.com. Choose langauges and their codes will appear in the url.

## Requirements

Works with Ruby 1.9.2 and higher.

To use speech synthesis you need to have mpg123 installed.

For Ubuntu:

    sudo apt-get install mpg123

For MacOSX:

    brew install mpg123





