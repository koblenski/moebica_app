require 'evalso'

class PracticeController < ApplicationController

  respond_to :html, :js

  def new
    @practice = Practice.new
    @code_output = "JSON output will appear here"
  end

  def create
    @practice = Practice.new
    eval_reply = Evalso.run(language: :ruby, code: practice_params[:code])
    @practice.code = eval_reply.code
    @code_output = eval_reply.stdout
    respond_with @practice do |format|
      format.html { render 'new' }
    end
  end

  private
   
    def practice_params
      params.require(:practice).permit(:code)
    end

end
