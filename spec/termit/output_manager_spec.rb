#encoding: UTF-8
require 'spec_helper'

describe Termit::OutputManager do
  subject { Termit::OutputManager.new }
  describe "instance_methods" do
    describe "display_error_info_and_quit" do
      it "does what is says" do
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
        expect { subject.display_version_and_quit }.to raise_error SystemExit
      end
    end

    describe "display_player_error_and_quit" do
      it "does what is says" do
        expect { subject.display_player_error_and_quit }.to raise_error SystemExit
      end
    end
  end
end