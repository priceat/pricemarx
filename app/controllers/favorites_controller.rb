class FavoritesController < TagController

  def create
    @pricemark = Pricemark.find(params[:pricemark_id])
    favorite = current_user.favorites.build(pricemark: @pricemark)
    
    respond_to do |format|
      if favorite.save
        format.html { redirect_to :back, notice: 'You picked a fav.' }
        format.json { render :edit, status: :created, location: favorite }
      else
        format.html { render :back }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pricemark = Pricemark.find(params[:pricemark_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Unfavorited. Sad..."
      redirect_to :back
    else
      flash[:error] = "Unable to remove favorite. Please try again."
      redirect_to 
    end
  end

  private

  def set_pricemark
    pricemark_ids = @tag.pricemarks.pluck(:id) 
  end

end