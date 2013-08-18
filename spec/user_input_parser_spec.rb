require 'spec_helper'

describe Termislator::UserInputParser do
  describe "initialization" do
    it "raises error if argument is not a ARGV options array" do
      expect { Termislator::UserInputParser.new :wrong_data }.to raise_error ArgumentError
    end
  end

  describe "call method" do
    context "when user has not given any arguments" do
      it "raises error" do
        parser = Termislator::UserInputParser.new []
        expect{ parser.call }.to raise_error ArgumentError
      end
    end

    context "when user has specified the options" do
      it "without the -v flag" do
        parser = Termislator::UserInputParser.new ['en', 'fr', 'your mother']
        expect(parser.call).to eq({ source_lang: :en, target_lang: :fr, text: 'your mother', voice: false })
      end

      it "with the -v flag" do
        parser = Termislator::UserInputParser.new ['en', 'fr', 'your mother', '-v']
        expect(parser.call).to eq({ source_lang: :en, target_lang: :fr, text: 'your mother', voice: true })
      end

      it "with text as seperate ARGV array elements" do
        parser = Termislator::UserInputParser.new ['en', 'fr', 'your', 'mother', 'here?', '-v']
        expect(parser.call).to eq({ source_lang: :en, target_lang: :fr, text: 'your mother here?', voice: true })
      end

      it "with incorrect language options format raiser error" do
        parser = Termislator::UserInputParser.new ['anglicki', 'po polski', 'your mother', '-v']
        expect{ parser.call }.to raise_error ArgumentError
      end
    end

  end

end