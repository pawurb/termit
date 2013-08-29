#Termislator [![Build Status](https://travis-ci.org/pawurb/termislator.png)](https://travis-ci.org/pawurb/termislator)


Termislator is an easy way to use Google Translate in your terminal or any ruby program. It does not use paid Google Translate API but instead it headlessly browses www.translate.google.com and parses the response.

## Requirements

Works with Ruby 1.9.2 and up.

To use speech synthesis (yes it talks) you need to have mpg123 installed.

For Ubuntu:

    sudo apt-get install mpg123

For MacOSX:

    brew install mpg123

## Usage

### As a terminal executable
```ruby
gem install termislator
```
#### 'termis' command

```ruby
termis en fr 'hey cowboy where is your horse?'
=> "hey cow-boy où est votre cheval?"

termis en ru 'hey cowboy where is your horse?'
=> "Эй ковбой где твоя лошадь?"
```
Specify a **-v** (voice) flag to use speech synthesis:
``` ruby
termis en zh 'hey cowboy where is your horse?' -v
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
* automatic input detection - auto

To find all available languages codes visit www.translate.google.com. Choose langauges and their codes will appear in the url.

## Status

Project is in 'but it works on my machine...' development phase. Any feedback will be appreciated.










