class VoteSetsController < ApplicationController
  before_action :set_noodle
  before_action :set_vote_set, only: [:edit, :update, :destroy]

  def edit
    respond_to do |format|
      format.any(:js, :json) do
        render json: { status: :ok, html: render_to_string(partial: 'vote_sets/form', locals: { noodle: @noodle, vote_set: @vote_set }, formats: [:html])}
      end
    end
  end

  # POST /vote_sets
  def create
    @vote_set = @noodle.vote_sets.new(vote_set_params)

    respond_to do |format|
      format.html do
        if @vote_set.save
          redirect_to @noodle, notice: 'Vote set was successfully created.'
        else
          render :new
        end
      end
      format.any(:js, :json) do
        @vote_set.save!
        render json: { status: :ok, html: render_to_string(@noodle, formats: [:html]) }
      end
    end
  end

  # PATCH/PUT /vote_sets/1
  def update
    respond_to do |format|
      format.html do
        if @vote_set.update(vote_set_params)
          redirect_to @noodle, notice: 'Vote set was successfully updated.'
        else
          render :edit
        end
      end
      format.any(:js, :json) do
        @vote_set.update!(vote_set_params)
        render json: { status: :ok, html: render_to_string(@noodle, formats: [:html]) }
      end
    end
  end

  # DELETE /vote_sets/1
  def destroy
    @vote_set.destroy
    respond_to do |format|
      format.html do
        redirect_to @noodle, notice: 'Vote set was successfully destroyed.'
      end
      format.any(:js, :json) { render json: { status: :ok, html: render_to_string(@noodle, formats: [:html]) } }
    end
  end

  private
    def set_noodle
      @noodle = Noodle.find_by(uuid: params[:noodle_id])
    end

    def set_vote_set
      @vote_set = @noodle.vote_sets.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vote_set_params
      params.require(:vote_set).permit(:name, votes_attributes: [ :id, :option_id, :value ])
    end
end
