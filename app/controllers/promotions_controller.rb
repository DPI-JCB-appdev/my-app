class PromotionsController < ApplicationController

  def home
    
    render({ :template => "promotions/home.html.erb" })
  end

  def index
    matching_promotions = Promotion.all

    @list_of_promotions = matching_promotions.order({ :created_at => :desc })

    render({ :template => "promotions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_promotions = Promotion.where({ :id => the_id })

    @the_promotion = matching_promotions.at(0)

    render({ :template => "promotions/show.html.erb" })
  end

  def create
    the_promotion = Promotion.new
    the_promotion.ended_at = params.fetch("query_ended_at")
    the_promotion.title = params.fetch("query_title")
    the_promotion.description = params.fetch("query_description")
    the_promotion.vendor_id = params.fetch("query_vendor_id")
    the_promotion.started_at = params.fetch("query_started_at")

    if the_promotion.valid?
      the_promotion.save
      redirect_to("/promotions", { :notice => "Promotion created successfully." })
    else
      redirect_to("/promotions", { :alert => the_promotion.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_promotion = Promotion.where({ :id => the_id }).at(0)

    the_promotion.ended_at = params.fetch("query_ended_at")
    the_promotion.title = params.fetch("query_title")
    the_promotion.description = params.fetch("query_description")
    the_promotion.vendor_id = params.fetch("query_vendor_id")
    the_promotion.started_at = params.fetch("query_started_at")

    if the_promotion.valid?
      the_promotion.save
      redirect_to("/promotions/#{the_promotion.id}", { :notice => "Promotion updated successfully."} )
    else
      redirect_to("/promotions/#{the_promotion.id}", { :alert => the_promotion.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_promotion = Promotion.where({ :id => the_id }).at(0)

    the_promotion.destroy

    redirect_to("/promotions", { :notice => "Promotion deleted successfully."} )
  end
end
