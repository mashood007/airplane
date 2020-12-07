class PlanesController < ApplicationController
  before_action :set_plane, only: [:show, :edit, :update, :destroy, :fill_seats]

  def index
    @planes = Plane.all
  end

  def show
    @total_groups = @plane.seat_groups.size - 1
  end

  def new
    @plane = Plane.new
    @plane.seat_groups.build
  end

  def edit
  end

  def create
    @plane = Plane.new(plane_params)

    respond_to do |format|
      if @plane.save
        format.html { redirect_to @plane, notice: 'Plane was successfully created.' }
        format.json { render :show, status: :created, location: @plane }
      else
        format.html { render :new }
        format.json { render json: @plane.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @plane.update(plane_params)
        format.html { redirect_to @plane, notice: 'Plane was successfully updated.' }
        format.json { render :show, status: :ok, location: @plane }
      else
        format.html { render :edit }
        format.json { render json: @plane.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @plane.destroy
    respond_to do |format|
      format.html { redirect_to planes_url, notice: 'Plane was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def fill_seats
    @plane.seats.fill(params[:total].to_i)
    queue = @plane.queue + params[:total].to_i rescue params[:total].to_i
    @plane.update(queue: queue)
    redirect_to @plane
  end

  private

    def set_plane
      @plane = Plane.find(params[:id])
    end

    def plane_params
      params.require(:plane).permit(:name, seat_groups_attributes: [:id, :total_columns, :total_rows, :_destroy])
    end
end
