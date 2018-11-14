class ResolutionsController < InheritedResources::Base
  before_action :find_resolution, only: [:show, :update, :edit, :destroy]
  def show
  end
  def index
    @search = "1"
    @resolutions = Resolution.all
    #@search = Randsack.value(result_param: params[:id]).all
  end
  private

    def resolution_params
      params.require(:resolution).permit(
        :title, :topic, :from, :to, :description,
        :code
      )
    end

    def find_resolution
      @resolution = Resolution.find(params[:id])
    end
end

