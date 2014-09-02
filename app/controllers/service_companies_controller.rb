class ServiceCompaniesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @service_companies = ServiceCompany.where(user_id: current_user.id)

    if params[:q].present?
      @q = params[:q]
      @service_companies = @service_companies.where("service_companies.name LIKE :q", q: "%#{@q}%")
    end

    @service_companies = @service_companies.page(params[:page]).per(10)
  end

  def show
    @service_company = ServiceCompany.find(params[:id])
  end
  
  def new
    @service_company = ServiceCompany.new
  end

  def create
    @service_company = ServiceCompany.new(service_company_params)
    @service_company.user_id = current_user.id
    
    if @service_company.save
      flash[:success] = "Successfully saved service company record"
      redirect_to service_companies_path
    else
      flash.now[:error] = "Error in saving service company record"
      render :new
    end
  end

  def edit
    @service_company = ServiceCompany.find(params[:id])
  end

  def update
    @service_company = ServiceCompany.find(params[:id])
    @service_company.user_id = current_user.id

    if @service_company.update(service_company_params)
      flash[:success] = "Successfully saved service company record"
      redirect_to service_companies_path
    else
      flash.now[:error] = "Error in saving service company record"
      render :edit
    end
  end

  def destroy
    @service_company = ServiceCompany.find(params[:id])
    @service_company.destroy!
    flash[:success] = "Successfully deleted service company record"
    redirect_to service_companies_path
  end

  private

  def service_company_params
    params.require(:service_company).permit!
  end
end
