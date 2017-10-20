class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  def index
      @admin = Admin.all
  end
  
  def new
      @admin = Admin.new
      authorize @admin
  end
  
  def create
      @admin = Admin.new(params_admin)
      if @admin.save
          redirect_to backoffice_admins_path, notice: "O Administrador (#{@admin.email}) foi cadastrado com sucesso"
      else   
          render :new
      end
  end
  
  def edit
  end
  
  def update
    if password_blank?
        params[:admin].delete(:password)
        params[:admin].delete(:password_confirmation)
    end
        
      if @admin.update(params_admin)
        AdminMailer.update_email(current_admin, @admin).deliver_now
        redirect_to backoffice_admins_path, notice: "O Administrador (#{@admin.email}) foi atualizado com sucesso"
      else   
          render :edit
      end
  end

  def password_blank?
    params[:admin][:password].blank? &&
    params[:admin][:password_confirmation].blank?
  end

  def destroy
        if @admin.destroy
            redirect_to backoffice_admins_path, notice: "O Administrador #{@admin.email} foi excluido com sucesso!!!"
        else
            render :index
        end
    end
end

private

def set_admin
    @admin = Admin.find(params[:id])
end

def params_admin
    if @admin.blank?
        params.require(:admin).permit(:name, :email, :role, :password, :password_confirmation)
    else
        params.require(:admin).permit(policy(@admin).permitted_attributes)        
    end
end
