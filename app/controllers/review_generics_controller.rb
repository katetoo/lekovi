class ReviewGenericsController < ApplicationController 
  before_action :require_user
  before_action :require_same_user, only: [:update, :edit, :destroy]
  
  def create
    @komgen = GenericName.find(params[:generic_name_id]).reviewgenerics.paginate(page: params[:page], per_page: 6)
    @genname = GenericName.find(params[:generic_name_id])
    @komentar = @genname.reviewgenerics.build(comment_params)
    @komentar.user = current_user

    if @komentar.save
      flash[:success] = "Вашиот коментар е зачуван"
      redirect_to generic_name_path(@genname)
    else
      render generic_names_path
    end
  end

  def edit
    
    @genname = GenericName.find(params[:generic_name_id])
    
    @reviewgen = Reviewgeneric.find(params[:id])
  end

  def update
    @genname = GenericName.find(params[:generic_name_id])
    @komentar = Reviewgeneric.find(params[:id])
    if @komentar.update(comment_params)
      flash[:success] = "Успешна промена"
      redirect_to generic_name_path(@genname)
    else
      render 'edit'
    end
  end

  def destroy
    @komentar = Reviewgeneric.find(params[:id]).destroy
    flash[:success] = "Вашиот коментар е избришан"
    redirect_to :back
  end

  private
    def comment_params
      params.require(:reviewgeneric).permit(:generic_name_id, :komentar_na_generika, :approve)
    end

  def require_same_user
    @genname = GenericName.find(params[:generic_name_id])
    @review = @genname.reviewgenerics.find(params[:id])
    if  !current_user.admin? &&  @review.user != current_user
      flash[:danger] = "Можете да ги менувате само Вашите коментари"
      redirect_to generic_name_path(@genname)
    end
  end

end