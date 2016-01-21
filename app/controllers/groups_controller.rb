class GenericNamesController < ApplicationController
    before_action :require_admin, only: [:edit, :update]
    
    def index
        @generic_names = GenericName.all.paginate(page: params[:page], per_page: 6)
    end
    
    def show
        @generic_name = GenericName.find(params[:id])
        @medicaments= @generic_name.medicaments
        @comment = Reviewgeneric.new
        @komgens = GenericName.find(params[:id]).reviewgenerics
    end
    
    def new
        @generic_name = GenericName.new
        @substitution = @generic_name.substitution
    end
    
    def create
        @generic_name = GenericName.new(generic_params)
        if @generic_name.save
            flash[:success] = "Генеричкиот лек е креиран."
            redirect_to generic_names_path
        else
            render :new
        end
    end
    
    def edit
        @generic_name=GenericName.find(params[:id])
    end
    
    def update
        @generic_name=GenericName.find(params[:id])
        if @generic_name.update(generic_params)
            flash[:success] = "Генеричкиот лек е успешно изменет."
            redirect_to generic_name_path(@generic_name)
        else
            render :edit
        end
    end
    
    def destroy
        @generic_name=GenericName.find(params[:id])
        @generic_name.destroy
        flash[:success] = "Генеричкиот лек е избришан."
         redirect_to generic_names_path
    end
    
    private
    
    def generic_params
        params.require(:generic_name).permit(:genericko_ime, :detalna_podelba, :sostav, :indikacii, :interakcii, :dejstvo, :merki_na_pretpazlivost, :doziranje, :nesakani_dejstva, :kontraindikacii, :substitution_id)
    end
    
    def require_admin
        if current_user.admin != true
          flash[:danger] = "Промена може да направи само администратор"
          redirect_to generic_names_path
        end
    end
end