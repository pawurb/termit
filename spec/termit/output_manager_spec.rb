require 'spec_helper'

describe Termit::OutputManager do
  subject { Termit::OutputManager.new }
  describe "instance_methods" do
    describe "display_error_info_and_quit" do
      it "does what is says" do
        expect(STDOUT).to receive(:puts).with("TERMIT: Wrong data. Example: 'termit en es the cowboy ' => 'el vaquero")
        expect { subject.display_error_info_and_quit }.to raise_error SystemExit
      end
    end

    describe "display_help_and_quit" do
      it "does what is says" do
        expect { subject.display_help_and_quit }.to raise_error SystemExit
      end
    end

    describe "display_version_and_quit" do
      it "does what is says" do
        expect(STDOUT).to receive(:puts).with("Termit #{Termit::VERSION}")
        expect { subject.display_version_and_quit }.to raise_error SystemExit
      end
    end

    describe "display_wrong_data_and_quit" do

    end
  end
end