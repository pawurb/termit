require 'spec_helper'

class DummyDelegate
  def hello
    'Hello there'
  end
end

class DummyDelegator
  extend ::Delegation
  @delegate = ::DummyDelegate.new

  delegate :hello, to: @delegate
end


describe "Delegation module" do
  describe "functionality" do
    subject do
      DummyDelegator.new
    end

    it "enables delegating to target objects" do
      expect(subject.hello).to eq 'Hello there'
    end
  end
end