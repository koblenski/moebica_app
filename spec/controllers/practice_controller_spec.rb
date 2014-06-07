require 'spec_helper'

describe PracticeController do
  describe "executing code with Ajax" do
    it "should respond with correct output" do
      xhr :post, :create, practice: { code: "puts 'Hello, World!'" }
      expect(assigns(:code_output)).to eq("Hello, World!\n")
      expect(response).to be_success
    end
  end
end
