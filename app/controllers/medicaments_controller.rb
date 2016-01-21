class MedicamentsController < ApplicationController
    before_action :require_admin, only: [:edit, :update]
    
    def index
        @medicaments = Medicament.all.paginate(page: params[:page], per_page: 6)
    end
    
    def show
        @medicament = Medicament.find(params[:id])
        @commentt = Reviewmed.new
        @kommeds = Medicament.find(params[:id]).reviewmeds
    end
    
    def new
        @medicament = Medicament.new
    end
    
    def create
        @medicament = Medicament.new(medicament_params)
        if @medicament.save
            flash[:success] = "Лекот е успешно креиран."
            redirect_to medicaments_path
        else
            render :new
        end
    end
    
    def edit
        @medicament=Medicament.find(params[:id])
    end
    
    def update
        @medicament=Medicament.find(params[:id])
        if @medicament.update(medicament_params)
            flash[:success] = "Лекот е успешно изменет."
            redirect_to medicament_path(@medicament)
        else
            render :edit
        end
    end
    
    def destroy
        @medicament=Medicament.find(params[:id])
        @medicament.destroy
        flash[:success] = "Лекот е избришан."
         redirect_to medicaments_path
    end
    
    private
    
    def medicament_params
        params.require(:medicament).permit(:ime_lek, :komentar, :producer_id, :generic_name_id)
    end
    
    def require_admin
      if current_user.admin != true
        flash[:danger] = "Промена може да направи само администратор"
        redirect_to medicaments_path
      end
    end
end