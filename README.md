#Termislator [![Build Status](https://travis-ci.org/pawurb/termislator.png)](https://travis-ci.org/pawurb/termislator)



Termislator is an easy way to use Google Translate in your terminal or any ruby program. It does not use paid Google Translate API but instead it headlessly browses www.translate.google.com and parses the response.

## Requirements

Works with Ruby 2.0.0, 1.9.3 and 1.9.2.

To use speech synthesis (yes it talks) you need to have mpg123 installed.

For Ubuntu:
    
    sudo apt-get install mpg123

For MacOSX:
    
    brew install mpg123
    
## Usage

### As a terminal executable script
```ruby
gem install termislator

termislator en fr 'hey cowboy where is your horse?'
=> "hey cow-boy où est votre cheval?"

termislator en ru 'hey cowboy where is your horse?'
=> "Эй ковбой где твоя лошадь?"
```
Specify a -v (voice) flag to use speech synthesis:
``` ruby
termislator en zh 'hey cowboy where is your horse?' -v
=> "嘿，牛仔是你的马在哪里？" and a nice chinese girl voice says something about a horse
```
### In any Ruby program

You can use it as a gem in you application. Termislator::Main object expects the following example options hash as an initialization argument:
``` ruby
{
  source_lang: :en, #input text language
  target_lang: :pl, #language to be translated to
  text: 'hey cowboy where is your horse?', #text to be translated
  voice: true #speech synthesis
}
```

In your Gemfile:

    gem 'termislator'

In your application:
``` ruby
require 'termislator'

options =
{
  source_lang: :en,
  target_lang: :es,
  text: 'hey cowboy where is your horse?'
}

Termislator::Main.new(options).translate
=> "Hey vaquero dónde está tu caballo?"
```

## Language codes:
* slovakian - sk
* english -en
* polish - pl
* french - fr
* spanish - es
* chinese - zh
* russian - ru

To find all available languages codes visit www.translate.google.com. Choose langauges and their codes will appear in the url.

## Status

Project is in 'but it works on my machine...' development state. Any feedback will be appreciated.










