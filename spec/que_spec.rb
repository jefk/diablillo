require 'spec_helper'

class Que
  def que_va?
    true
  end

  def fiesta!
    'party time'
  end
end

describe Que do
  let(:instance) { Que.new }

  it 'leaves normal method calling alone' do
    expect{ instance.que_va? }.not_to raise_error Exception
    expect{ instance.fiesta! }.not_to raise_error Exception
    expect{ instance.nada }.to raise_error NoMethodError
    expect{ instance.¿interobang! }.to raise_error NoMethodError
  end

  it 'responds to methods especialles' do
    instance.¿que_va?.should eq instance.que_va?
    instance.¡fiesta!.should eq instance.fiesta!
  end
end
