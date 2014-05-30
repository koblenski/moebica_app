require 'spec_helper'

describe PracticeController do
  describe "executing code with Ajax" do
    it "should respond with correct output" do
      # expect do
        xhr :post, :create, practice: { code: "puts 'Hello, World!'" }
      # end.to change(Practice, :code_output).from("").to("Hello, World!")
      expect(assigns(:code_output)).to eq("Hello, World!\n")
      expect(response).to be_success
    end
  end
end
