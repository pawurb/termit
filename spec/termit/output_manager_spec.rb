#encoding: UTF-8
require 'spec_helper'

describe Termit::OutputManager do
  subject { Termit::OutputManager.new }
  describe "instance_methods" do
    describe "display_error_info_and_quit" do
      it "does what is says" do
        expect(STDOUT).to receive(:puts).with("TERMIT: Wrong data. Example: 'termit en es the cowboy ' => 'el vaquero'")
        subject.display_error_info
      end
    end

    describe "display_help_and_quit" do
      it "does what is says" do
        expect(STDOUT).to receive(:puts)
        subject.display_help
      end
    end

    describe "display_version_and_quit" do
      it "does what is says" do
        expect(STDOUT).to receive(:puts).with("Termit #{Termit::VERSION}")
        subject.display_version
      end
    end
  end
end