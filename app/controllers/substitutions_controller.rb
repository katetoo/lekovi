class SubstitutionsController < ApplicationController
    before_action :require_admin, only: [:edit, :update]
    
    def index
        @substitutions = Substitution.all.paginate(page: params[:page], per_page: 6)
    end
    
    def show
        @substitution = Substitution.find(params[:id])
        @generics= @substitution.generic_names.all
    end
    
    def new
        @substitution = Substitution.new
        @subgroups= Subgroup.all
    end
    
    def create
        @substitution = Substitution.new(substitution_params)
        if @substitution.save
            flash[:success] = "Поделбата е успешно креирана"
            redirect_to substitutions_path
        else
            render :new
        end
    end
    
    def edit
        @substitution=Substitution.find(params[:id])
    end
    
    def update
        @substitution=Substitution.find(params[:id])
        if @substitution.update(substitution_params)
            flash[:success] = "Поделбата е успешно изменета."
            redirect_to substitution_path(@substitution)
        else
            render :edit
        end
    end
    
    def destroy
        @substitution=Substitution.find(params[:id])
        @substitution.destroy
        flash[:success] = "Поделбата е избришана."
         redirect_to substitutions_path
    end
    
    private
    
    def substitution_params
        params.require(:substitution).permit(:ime_podelba, :subgroup_id)
    end
    
    def require_admin
      if current_user.admin != true
        flash[:danger] = "Промена може да направи само администратор"
        redirect_to substitutions_path
      end
    end
end