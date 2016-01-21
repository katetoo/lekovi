class ReviewMedsController < ApplicationController 
  before_action :require_user
  before_action :require_same_user, only: [:update, :edit, :destroy]

  def create
    @kommed = Medicament.find(params[:medicament_id]).reviewmeds.paginate(page: params[:page], per_page: 6)
    @medname = Medicament.find(params[:medicament_id])
    @komentarr = @medname.reviewmeds.build(commentm_params)
    @komentarr.user = current_user

    if @komentarr.save
      flash[:success] = "Вашиот коментар е зачуван, се чека дозвола од администратор"
      redirect_to medicament_path(@medname)
    else
      render medicaments_path
    end
  end

  def edit
    @medname = Medicament.find(params[:medicament_id])
    @kommeds = GenericName.find(params[:id]).reviewgenerics
    @komentarr = Reviewmed.find(params[:id])
  end

  def update
    @medname = Medicament.find(params[:medicament_id])
    @komentarr = Reviewmed.find(params[:id])
    if @komentarr.update(commentm_params)
      flash[:success] = "Успешна промена"
      redirect_to medicament_path(@medname)
    else
      render 'edit'
    end
  end

  def destroy
    @komentarr = Reviewmed.find(params[:id]).destroy
    flash[:success] = "Вашиот коментар е избришан"
    redirect_to :back
  end

  private
    def commentm_params
      params.require(:reviewmed).permit(:medicament_id, :komentar_na_lek, :approve)
    end

  def require_same_user
    @medname = Medicament.find(params[:medicament_id])
    if current_user != Reviewmed.find(params[:id]).user && !current_user.admin?
      flash[:danger] = "Можете да ги менувате само вашите коментари"
      redirect_to medicament_path(@medname)
    end
  end

end