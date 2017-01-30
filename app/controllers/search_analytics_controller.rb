class SearchAnalyticsController < ApplicationController
  # GET /search_analytics
  # GET /search_analytics.json
  def index
    @search_analytic = SearchAnalytic.new
  end

  def show_search_analytics
    @search_analytics = SearchAnalytic.all.order(quantity: :desc)
  end

  def save_search
    @search_analytic = SearchAnalytic.find_or_initialize_by(article_title: search_analytic_params[:article_title])
    @search_analytic.quantity.nil? ? @search_analytic.quantity = 1 : @search_analytic.quantity += 1;

    respond_to do |format|
      if @search_analytic.save
        format.json { render json: I18n.t('search_analytics.index.results', article_title: @search_analytic.article_title).to_json, status: :ok }
      else
        format.json { render json: nil, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_analytics/1
  # DELETE /search_analytics/1.json
  def destroy
    SearchAnalytic.destroy_all
    respond_to do |format|
      format.html { redirect_to show_search_analytics_url, notice: 'Stats cleared.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def search_analytic_params
      params.permit(:article_title)
    end
end
