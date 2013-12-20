# encoding: utf-8

require 'spec_helper'

describe Lupo do
  subject { klass.new(entries) }

  let(:entries) { [42] }

  let(:klass) do
    Class.new do
      include Lupo.new(:entries)
      def initialize(entries)
        @entries = entries
      end
    end
  end

  it 'provides an #each method' do
    expect { |block| subject.each(&block) }.to yield_successive_args(*entries)
  end

  it 'includes Enumerable' do
    expect(subject).to be_kind_of(Enumerable)
  end

  it 'works without a block' do
    expect(subject.each).to be_instance_of(Enumerator)
  end

  it 'returns self from #each' do
    expect(subject.each {}).to be(subject)
  end
end
