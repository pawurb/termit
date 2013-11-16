#encoding: UTF-8
require 'spec_helper'

describe Termit::OutputManager do
  METHOD_NAMES = [:display_error_info_and_quit, :display_help_and_quit, :display_version_and_quit, :display_player_error_and_quit]
  subject { Termit::OutputManager.new }

  describe "instance_methods" do
    it "does what it says" do
      METHOD_NAMES.each do |m|
        expect { subject.send(m) }.to raise_error SystemExit
      end
    end
  end
end
