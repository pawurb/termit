#Termislator [![Build Status](https://travis-ci.org/pawurb/termislator.png)](https://travis-ci.org/pawurb/termislator)


Termislator is an easy way to use Google Translate in your terminal. It does not use paid Google Translate API but instead it headlessly browses www.translate.google.com and parses the response.

## Requirements

Works with Ruby 1.9.2 and higher.

To use speech synthesis (yes it talks) you need to have mpg123 installed.

For Ubuntu:

    sudo apt-get install mpg123

For MacOSX:

    brew install mpg123

## Usage
```ruby
termis 'source_language' 'target_language' 'text'
```

Example:

```ruby
gem install termislator

termis en es "hey cowboy where is your horse?"
=> "Hey vaquero dónde está tu caballo?"

termis fr en "qui est votre papa?"
=> "Who's Your Daddy?"
```

Parenthesis are not necessary for text data input:
```ruby
termis fr ru qui est votre papa?
=> "Кто твой папочка?"
```
#### Speech synthesis

Specify a **-v** (voice) flag to use speech synthesis:
``` ruby
termis en zh "hey cowboy where is your horse?" -v
=> "嘿，牛仔是你的马在哪里？" #and a nice chinese girl voice says something about a horse
```

## Language codes:
* slovakian - sk
* english -en
* polish - pl
* french - fr
* spanish - es
* chinese - zh
* russian - ru
* automatic source language detection - auto

To find all available language codes visit www.translate.google.com. Choose langauges and their codes will appear in the url.

## Status

Project is in 'but it works on my machine...' development phase. Any feedback will be appreciated. You can contact me on: p.urbanek89@gmail.com










