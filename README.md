#Termit [![Build Status](https://travis-ci.org/pawurb/termit.png)](https://travis-ci.org/pawurb/termit) [![Gem Version](https://badge.fury.io/rb/termit.png)](http://badge.fury.io/rb/termit)


Termit is an easy way to use Google Translate in your terminal.

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
=> "嘿，牛仔是你的马在哪里？" #and a chinese voice says something about a horse
```

#### Synonyms

Specify a **-s** (synonyms) flag to get the list of synonyms if available:
``` ruby
termit es en muchacho -s
=> boy
=> Synonyms: boy, lad, youngster, laddie, cully
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

To use speech synthesis (yes it talks) you need to have mpg123 installed.

For Ubuntu:

    sudo apt-get install mpg123

For MacOSX:

    brew install mpg123




Any feedback will be appreciated. You can contact me on: p.urbanek89@gmail.com




