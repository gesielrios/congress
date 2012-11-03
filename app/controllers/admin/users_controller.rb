class Admin::UsersController < Admin::AdminController

  def index
    @users = User.paginate(:page => params[:page]).order('id')
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'Usuario criado com sucesso.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end


end