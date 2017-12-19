class UsersController < ProtectedController
  # GET /users
  def index
    @users = policy_scope(User)
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    authorize @user
    
    @user.destroy
    
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end  
end  