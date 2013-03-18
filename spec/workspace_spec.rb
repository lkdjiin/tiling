# -*- encoding: utf-8 -*-

require './spec/helper'

describe Workspace do

  before :each do
    @work = Workspace.new
  end
  
  specify { @work.should respond_to :id }
  specify { @work.should respond_to :x }
  specify { @work.should respond_to :y }
  specify { @work.should respond_to :width }
  specify { @work.should respond_to :height }
end
