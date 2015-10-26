class LockersController < ApplicationController
  before_action :set_locker, only: [:show, :edit, :update, :destroy]

  def index
    @lockers = Locker.all
  end

  def show
  end

  def new
    @locker = Locker.new
  end

  def edit
  end

  def create
    @locker = Locker.new(locker_params)
    if @locker.save
      redirect_to @locker, flash: { success: t('flashes.created') }
    else
      flash[:alert] = "Error(s): " + @locker.errors.full_messages.join(' • ')
      render :new
    end
  end

  def update
    if @locker.update(locker_params)
      redirect_to @locker, notice: t('flashes.updated')
    else
      flash[:alert] = "Error(s): " + @locker.errors.full_messages.join(' • ')
      render :edit
    end
  end

  def destroy
    @locker.destroy
    redirect_to lockers_url, alert: t('flashes.terminated')
  end

  private

  def set_locker
    @locker = Locker.find(params[:id])
  end

  # whitelist parameters.
  def locker_params
    params.require(:locker).permit(:locker_no, :reserved, :size_code )
  end
end
