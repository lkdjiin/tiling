# -*- encoding: utf-8 -*-

require './spec/helper'

# I will only test the API of the wmctrl gem,
# just to be sure it will not change in a future
# release.
describe WMCtrl do

  before :each do
    @wm = WMCtrl.instance
  end

  specify { @wm.should respond_to :desktops }
  specify { @wm.should respond_to :windows }
  specify { @wm.should respond_to :action_window }

  describe "#desktop" do
    before :each do
      @desktops = @wm.desktops
    end

    it "should contain some Desktop objects" do
      @desktops.each { |d| d.class.should == WMCtrl::Desktop }
    end

    describe "Desktop" do
      it "should have an id key" do
        @desktops.first.key?(:id).should be_true
      end

      it "should have an current key" do
        @desktops.first.key?(:current).should be_true
      end

      it "should have an workarea key" do
        @desktops.first.key?(:workarea).should be_true
      end

      specify ":workarea should be of length 4" do
        @desktops.first[:workarea].count.should == 4
      end
    end
  end

  describe "#windows" do
    before :each do
      @windows = @wm.windows
    end

    it "should contain some Window objects" do
      @windows.each { |w| w.class.should == WMCtrl::Window }
    end

    describe "Window" do
      it "should have an id key" do
        @windows.first.key?(:id).should be_true
      end

      it "should have an active key" do
        @windows.first.key?(:active).should be_true
      end

      it "should have an desktop key" do
        @windows.first.key?(:desktop).should be_true
      end

      it "should have an geometry key" do
        @windows.first.key?(:geometry).should be_true
      end

      it "should have an frame_extents key" do
        @windows.first.key?(:frame_extents).should be_true
      end









    end

  end
end
