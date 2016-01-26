class NoodlesController < ApplicationController
  before_action :set_noodle, only: [:show, :edit, :update, :destroy]

  # GET /noodles
  def index
    @noodles = Noodle.all
  end

  # GET /noodles/1
  def show
  end

  # GET /noodles/new
  def new
    @noodle = Noodle.new
  end

  # GET /noodles/1/edit
  def edit
  end

  # POST /noodles
  def create
    @noodle = Noodle.new(noodle_params)

    if @noodle.save
      redirect_to @noodle, notice: 'Noodle was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /noodles/1
  def update
    if @noodle.update(noodle_params)
      redirect_to @noodle, notice: 'Noodle was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /noodles/1
  def destroy
    @noodle.destroy
    redirect_to noodles_url, notice: 'Noodle was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noodle
      @noodle = Noodle.find_by(uuid: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def noodle_params
      params.require(:noodle).permit(:name, :description, :email)
    end
end
