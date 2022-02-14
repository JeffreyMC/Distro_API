class DistrosController < ApplicationController
  before_action :set_distro, only: %i[ show ]

  # GET /distros
  def index
    @distros = Distro.all

    render json: @distros.to_json(only: [:id, :nombre, :url])
  end

  # GET /distros/1
  def show
    render json: @distro.to_json(only: [:id, :nombre, :url])
  end

  # POST /distros
  def create
    @distro = Distro.new(distro_params)
    @mensaje = "Ups, no se pueden crear distros"

    render json: @mensaje, status: :unprocessable_entity
    =begin
    if @distro.save
      render json: @distro, status: :created, location: @distro
    else
      render json: @distro.errors, status: :unprocessable_entity
    end
    =end
  end

  # PATCH/PUT /distros/1
  def update
    if @distro.update(distro_params)
      render json: @distro
    else
      render json: @distro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /distros/1
  def destroy
    @distro.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distro
      @distro = Distro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def distro_params
      params.require(:distro).permit(:nombre, :url)
    end
end
