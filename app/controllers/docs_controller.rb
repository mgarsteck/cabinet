class DocsController < ApplicationController

  # - DRY, finds the doc necessary for these actions so that we do not repeat ourselves
  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = Doc.all.order("created_at DESC")
  end

  def show
  end

  def new
    @doc = Doc.new
  end

  def create
    @doc = Doc.new(doc_params)

    if @doc.save
      redirect_to @doc
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    # - Doc Params and Find Doc so we are in compliance with DRY

    def find_doc
      @doc = Doc.find(params[:id])
    end

    def doc_params
      params.require(:doc).permit(:title, :content)
    end

end