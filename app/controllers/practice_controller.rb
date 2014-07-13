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
    if eval_reply.wall_time > 5000
      @code_output = "Your code is taking too long to evaluate.\nMaybe you have an infinite loop in there somewhere."
    else
      while eval_reply.stderr.sub! /eval-\d+.rb:(\d+): /, "Error on line \\1:\n"
      end
      @code_output = eval_reply.stderr + eval_reply.stdout
    end
    respond_with @practice do |format|
      format.html { render 'new' }
    end
  end

  private
   
    def practice_params
      params.require(:practice).permit(:code)
    end

end
