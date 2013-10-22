require 'spec_helper'

describe Termit::UserInputParser do
  describe "initialization" do
    it "raises error if argument is not a ARGV options array" do
      expect { Termit::UserInputParser.new :wrong_data }.to raise_error ArgumentError
    end
  end

  describe "options method" do
    context "when user has not given any arguments" do
      it "raises error" do
        parser = Termit::UserInputParser.new []
        expect{ parser.options }.to raise_error SystemExit
      end
    end

    context "when user has specified the options" do
      it "without the -v flag" do
        parser = Termit::UserInputParser.new ['en', 'fr', 'your mother']
        expect(parser.options).to eq({ source_lang: :en, target_lang: :fr, text: 'your mother', talk: false, synonyms: false })
      end

      it "with the -v (version) flag it exit the program and displays version number" do
        expect { Termit::UserInputParser.new ['-v'] }.to raise_error SystemExit
      end

      it "with the -h (help) flag it exit the program and displays help" do
        expect { Termit::UserInputParser.new ['-h'] }.to raise_error SystemExit
      end


      it "with -s (synonims) flag" do
        parser = Termit::UserInputParser.new ['en', 'fr', 'hey cowboy!', '-s']
        expect(parser.options).to eq({ source_lang: :en, target_lang: :fr, text: 'hey cowboy!', talk: false, synonyms: true })
      end

      it "with -t (talk) flag" do
        parser = Termit::UserInputParser.new ['en', 'fr', 'hey cowboy!', '-t']
        expect(parser.options).to eq({ source_lang: :en, target_lang: :fr, text: 'hey cowboy!', talk: true, synonyms: false })
      end

      it "with text as seperate ARGV array elements" do
        parser = Termit::UserInputParser.new ['en', 'fr', 'is', 'cowboy', 'here ?', '-t']
        expect(parser.options).to eq({ source_lang: :en, target_lang: :fr, text: 'is cowboy here ?', talk: true, synonyms: false })
      end

      it "with incorrect language options format raiser error" do
        parser = Termit::UserInputParser.new ['ang', 'po polski', 'hey cowboy!', '-t']
        expect{ parser.options }.to raise_error SystemExit
      end

    end

  end

end