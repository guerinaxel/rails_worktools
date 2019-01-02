class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all()
  end

  def show
    @shift = Shift.find(params[:id])
  end

  def new
    @shift = Shift.new
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def create
    # render plain: params[:shift_time_end].inspect
    @shift = Shift.new(shift_params)

    if @shift.save
      redirect_to @shift
    else
      render 'new'
    end
  end

  def update
    @shift = Shift.find(params[:id])

    if @shift.update(shift_params)
      rediret_to @shift
    else
      render 'edit'
    end
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy

    redirect_to shifts_path
  end

  # require(:shift) pour le type d'objet, permit(...) pour les champs attendu et autorisé
  private
    def shift_params
        params.require(:shift).permit(:shift_date, :shift_time_start, :shift_time_end, :shift_type)
    end
end