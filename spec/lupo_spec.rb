# encoding: utf-8

require 'spec_helper'

shared_context 'lupo' do
  subject { klass.new(entries) }

  let(:entries) { [42] }

  it 'provides an #each method' do
    expect { |b| subject.each(&b) }.to yield_successive_args(*entries)
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

describe Lupo do
  context '.enumerable' do
    include_context 'lupo'

    let(:klass) do
      Class.new do
        include Lupo.enumerable(:entries)
        def initialize(entries)
          @entries = entries
        end
      end
    end
  end

  context '.collection' do
    include_context 'lupo'

    let(:klass) do
      Class.new do
        include Lupo.collection(:entries)
      end
    end

    it 'should include a concord instance' do
      expect(klass.ancestors).to include(Concord.new(:entries))
    end
  end
end
