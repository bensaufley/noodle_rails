class OptionsController < ApplicationController
  before_action :set_noodle
  before_action :set_option, only: [:update, :destroy]

  # POST /options
  def create
    @option = @noodle.options.new(option_params)

    respond_to do |format|
      format.html do
        if @option.save
          redirect_to @noodle, notice: 'Option was successfully created.'
        else
          render :new
        end
      end
      format.any(:js, :json) do
        @option.save!
        render json: { status: :ok, html: render_to_string(@noodle, formats: [:html]) }
      end
    end
  end

  # PATCH/PUT /options/1
  def update
    if @option.update(option_params)
      redirect_to @option, notice: 'Option was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /options/1
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to @noodle, notice: 'Option was successfully destroyed.' }
      format.any(:js, :json) { render json: { status: :ok, html: render_to_string(@noodle.reload, formats: [:html] )}}
    end
  end

  private
    def set_noodle
      @noodle = Noodle.find_by(uuid: params[:noodle_id])
    end

    def set_option
      @option = @noodle.options.find(params[:id])
    end

    def option_params
      params.require(:option).permit(:text)
    end
end
